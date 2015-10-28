#!mojo mojo:dart_content_handler
// Copyright 2015 The Vanadium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:async';
import 'dart:math' show Random;
import 'dart:convert' show UTF8;

import 'package:syncbase/initialized_application.dart'
    show InitializedApplication;
import 'package:syncbase/src/naming/util.dart' as naming;
import 'package:syncbase/syncbase_client.dart' as sb;

main(List args) async {
  // mojo_shell does not print a stack trace when the dart program crashes.
  // Hence, we must wrap everything in a try/catch if we want to see the
  // errors. :(
  try {
    InitializedApplication app = new InitializedApplication.fromHandle(args[0]);
    await app.initialized;

    const String mtAddr = '/ns.dev.v.io:8101';

    sb.SyncbaseClient c = new sb.SyncbaseClient(
        app.connectToService, 'https://mojo.v.io/syncbase_server.mojo');

    sb.SyncbaseApp sbApp = await createApp(c, 'testapp');
    sb.SyncbaseNoSqlDatabase sbDb = await createDb(sbApp, 'testdb');
    sb.SyncbaseTable sbTable = await createTable(sbDb, 'testtable');
    await joinOrCreateSyncgroup(sbDb, mtAddr, sbTable.name, 'testsg');

    startWatch(sbDb, sbTable);
    startPuts(sbTable);

    // Wait forever.
    await new Completer().future;

    // Looks like forever came and went.  Might as well clean up after
    // ourselves...
    await c.close();
    await app.close();
  } catch (e) {
    print('ERROR in main()');
    print(e);
  }
}

startWatch(db, table) async {
  try {
    var s = db.watch(table.name, '', await db.getResumeMarker());
    await for (var change in s) {
      print(
          'GOT CHANGE: ${change.rowKey} - ${UTF8.decode(change.valueBytes)} - ${change.fromSync}');
    }
  } catch (e) {
    print('ERROR in startWatch()');
    print(e);
  }
}

var r = new Random();

startPuts(table) async {
  try {
    var key = r.nextInt(100000000);
    var val = r.nextInt(100000000);

    var row = table.row('k$key');
    print('PUTTING k$key');
    await row.put(UTF8.encode('$val'));
  } catch (e) {
    print('ERROR in startPuts()');
    print(e);
  }

  await new Future.delayed(new Duration(seconds: 2));
  startPuts(table);
}

String openPermsJson =
    '{"Admin":{"In":["..."]},"Write":{"In":["..."]},"Read":{"In":["..."]},"Resolve":{"In":["..."]},"Debug":{"In":["..."]}}';
sb.Perms openPerms = sb.SyncbaseClient.perms(openPermsJson);

Future<sb.SyncbaseApp> createApp(sb.SyncbaseClient c, String name) async {
  var app = c.app(name);
  var exists = await app.exists();
  if (exists) {
    print('app exists, rolling with it');
    return app;
  }
  print('app does not exist, creating it');
  await app.create(openPerms);
  return app;
}

Future<sb.SyncbaseNoSqlDatabase> createDb(
    sb.SyncbaseApp app, String name) async {
  var db = app.noSqlDatabase(name);
  var exists = await db.exists();
  if (exists) {
    print('db exists, rolling with it');
    return db;
  }
  print('db does not exist, creating it');
  await db.create(openPerms);
  return db;
}

Future<sb.SyncbaseTable> createTable(
    sb.SyncbaseNoSqlDatabase db, String name) async {
  var table = db.table(name);
  var exists = await table.exists();
  if (exists) {
    print('table exists, rolling with it');
    return table;
  }
  print('table does not exist, creating it');
  await table.create(openPerms);
  return table;
}

Future<sb.SyncbaseSyncgroup> joinOrCreateSyncgroup(sb.SyncbaseNoSqlDatabase db,
    String mtAddr, String tableName, String name) async {
  var mtName = naming.join(
      mtAddr, 'users/vanadium.bot@gmail.com/apps/mojo-syncbase-example');
  // TODO(nlacasse): Make this %%sync thing a constant.
  var sgPrefix = naming.join(mtName, 'syncbase_mojo/%%sync');
  var sgName = naming.join(sgPrefix, 'testsg');
  var sg = db.syncgroup(sgName);

  print('SGNAME = $sgName');

  var myInfo = sb.SyncbaseClient.syncgroupMemberInfo(syncPriority: 3);

  try {
    print('trying to join syncgroup');
    await sg.join(myInfo);
    print('syncgroup join success');
  } catch (e) {
    // Syncgroup does not exist.
    print('syncgroup does not exist, creating it');

    List<sb.TableRow> prefixes = [];
    prefixes.add(sb.SyncbaseClient.syncgroupPrefix('$tableName', ''));

    var sgSpec = sb.SyncbaseClient.syncgroupSpec(prefixes,
        description: 'test syncgroup',
        perms: openPerms,
        // Sync the entire table.
        mountTables: [mtName]);

    print('SGSPEC = $sgSpec');

    try {
      await sg.create(sgSpec, myInfo);
    } catch (e) {
      print('ERROR creating syncgroup');
      print(e);
    }
  }

  return sg;
}
