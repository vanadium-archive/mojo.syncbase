library syncbase_database_test;

import 'package:test/test.dart';

import 'package:ether/syncbase_client.dart' show SyncbaseClient;

import './utils.dart' as utils;

runDatabaseTests(SyncbaseClient c) {
  test('getting a handle to a database', () {
    var app = c.app(utils.uniqueName('app'));
    var dbName = utils.uniqueName('db');
    var db = app.noSqlDatabase(dbName);
    expect(db.relativeName, equals(dbName));
    expect(db.fullName, equals(app.fullName + '/' + dbName));
  });

  test('creating and deleting a database', () async {
    var app = c.app(utils.uniqueName('app'));
    await app.create(utils.emptyPerms());

    var db = app.noSqlDatabase(utils.uniqueName('db'));

    expect(await db.exists(), equals(false));
    await db.create(utils.emptyPerms());
    expect(await db.exists(), equals(true));
    await db.delete();
    expect(await db.exists(), equals(false));
  });

  // TODO(nlacasse): Test database.get/setPermissions.
}
