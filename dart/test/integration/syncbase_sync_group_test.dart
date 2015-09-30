// Copyright 2015 The Vanadium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library syncbase_watch_test;

import 'package:test/test.dart';

import 'package:ether/syncbase_client.dart'
    show Perms, SyncbaseClient, SyncGroupMemberInfo, SyncGroupSpec;

import './utils.dart' as utils;

runSyncGroupTests(SyncbaseClient c) {
  // TODO(nlacasse): Where does this magic number 8 come from? It's in
  // syncgroup_test.go.
  var myInfo = SyncbaseClient.syncGroupMemberInfo(syncPriority: 8);

  test('db.syncGroup returns a SyncGroup with name', () {
    var app = c.app(utils.uniqueName('app'));
    var db = app.noSqlDatabase(utils.uniqueName('db'));
    var sgName = utils.uniqueName('sg');
    var sg = db.syncGroup(sgName);
    expect(sg.name, equals(sgName));
  });

  test('sg.create with empty spec should throw', () async {
    var app = c.app(utils.uniqueName('app'));
    await app.create(utils.emptyPerms());
    var db = app.noSqlDatabase(utils.uniqueName('db'));
    await db.create(utils.emptyPerms());
    var sg = db.syncGroup(utils.uniqueName('sg'));

    var emptySpec = SyncbaseClient.syncGroupSpec(prefixes: []);
    expect(sg.create(emptySpec, myInfo), throws);
  });

  test('sg.create with valid spec should succeed', () async {
    var app = c.app(utils.uniqueName('app'));
    await app.create(utils.emptyPerms());
    var db = app.noSqlDatabase(utils.uniqueName('db'));
    await db.create(utils.emptyPerms());
    var sg = db.syncGroup(utils.uniqueName('sg'));

    var spec = SyncbaseClient.syncGroupSpec(
        description: 'test syncgroup ${sg.name}', prefixes: ['t1/foo']);

    await sg.create(spec, myInfo);
  });

  test('sg.create with odd (but valid) characters should succeed', () async {
    var app = c.app(utils.uniqueName('app'));
    await app.create(utils.emptyPerms());
    var db = app.noSqlDatabase(utils.uniqueName('db'));
    await db.create(utils.emptyPerms());

    var sgName = utils.uniqueName('sg-/!@#%^&*():\$\x01\xfe');
    var sg = db.syncGroup(sgName);

    var spec = SyncbaseClient.syncGroupSpec(
        description: 'test syncgroup ${sgName}', prefixes: ['t1/foo']);

    await sg.create(spec, myInfo);
  });

  test('creating a nested syncgroup', () async {
    var app = c.app(utils.uniqueName('app'));
    await app.create(utils.emptyPerms());
    var db = app.noSqlDatabase(utils.uniqueName('db'));
    await db.create(utils.emptyPerms());

    var sg1 = db.syncGroup(utils.uniqueName('sg'));
    var spec1 = SyncbaseClient.syncGroupSpec(
        description: 'test nested syncgroup ${sg1.name}', prefixes: ['t1/foo']);

    await sg1.create(spec1, myInfo);

    var sg2 = db.syncGroup(utils.uniqueName('sg'));
    var spec2 = SyncbaseClient.syncGroupSpec(
        description: 'test nested syncgroup ${sg2.name}', prefixes: ['t1/foo']);

    await sg2.create(spec2, myInfo);
  });

  test('creating a syncgroup that already exist', () async {
    var app = c.app(utils.uniqueName('app'));
    await app.create(utils.emptyPerms());
    var db = app.noSqlDatabase(utils.uniqueName('db'));
    await db.create(utils.emptyPerms());

    var sgName = utils.uniqueName('sg');
    var spec1 = SyncbaseClient.syncGroupSpec(
        description: 'test syncgroup ${sgName}', prefixes: ['t1/foo']);

    var sg1 = db.syncGroup(sgName);
    await sg1.create(spec1, myInfo);

    var spec2 = SyncbaseClient.syncGroupSpec(
        description: 'another syncgroup ${sgName}', prefixes: ['t2/bar']);

    var sg2 = db.syncGroup(sgName);
    expect(sg2.create(spec2, myInfo), throws);
  });

  test('sg.get/setSpec', () async {
    var app = c.app(utils.uniqueName('app'));
    await app.create(utils.emptyPerms());
    var db = app.noSqlDatabase(utils.uniqueName('db'));
    await db.create(utils.emptyPerms());
    var sgName = utils.uniqueName('sg');
    var sg = db.syncGroup(sgName);

    var spec = SyncbaseClient.syncGroupSpec(
        description: 'test syncgroup ${sgName}', prefixes: ['t1/foo']);

    await sg.create(spec, myInfo);

    var gotSpec = await sg.getSpec();
    expect(gotSpec.description, equals(spec.description));
    expect(gotSpec.prefixes, equals(spec.prefixes));

    var newSpec = SyncbaseClient.syncGroupSpec(
        description: 'a totally new spec ${sgName}', prefixes: ['t1/foo']);

    await sg.setSpec(newSpec, '');

    var gotSpec2 = await sg.getSpec();
    expect(gotSpec2.description, equals(newSpec.description));
    expect(gotSpec2.prefixes, equals(newSpec.prefixes));
  });
}
