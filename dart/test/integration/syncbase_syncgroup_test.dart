// Copyright 2015 The Vanadium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library syncbase_syncgroup_test;

import 'package:test/test.dart';

import 'package:ether/syncbase_client.dart'
    show SyncbaseClient, SyncgroupPrefix;

import './utils.dart' as utils;

List<SyncgroupPrefix> mkPfxs(List<String> strs) {
  List<SyncgroupPrefix> res = [];
  for (var str in strs) {
    var parts = str.split(':');
    assert(parts.length == 2);
    res.add(SyncbaseClient.syncgroupPrefix(
        tableName: parts[0], rowPrefix: parts[1]));
  }
  return res;
}

runSyncgroupTests(SyncbaseClient c) {
  // TODO(nlacasse): Where does this magic number 8 come from? It's in
  // syncgroup_test.go.
  var myInfo = SyncbaseClient.syncgroupMemberInfo(syncPriority: 8);

  test('db.syncgroup returns a syncgroup with name', () {
    var app = c.app(utils.uniqueName('app'));
    var db = app.noSqlDatabase(utils.uniqueName('db'));
    var sgName = utils.uniqueName('sg');
    var sg = db.syncgroup(sgName);
    expect(sg.name, equals(sgName));
  });

  test('sg.create with empty spec should throw', () async {
    var app = c.app(utils.uniqueName('app'));
    await app.create(utils.emptyPerms());
    var db = app.noSqlDatabase(utils.uniqueName('db'));
    await db.create(utils.emptyPerms());
    var sg = db.syncgroup(utils.uniqueName('sg'));

    var emptySpec = SyncbaseClient.syncgroupSpec(prefixes: mkPfxs([]));
    expect(sg.create(emptySpec, myInfo), throws);
  });

  test('sg.create with valid spec should succeed', () async {
    var app = c.app(utils.uniqueName('app'));
    await app.create(utils.emptyPerms());
    var db = app.noSqlDatabase(utils.uniqueName('db'));
    await db.create(utils.emptyPerms());
    var sg = db.syncgroup(utils.uniqueName('sg'));

    var spec = SyncbaseClient.syncgroupSpec(
        description: 'test syncgroup ${sg.name}', prefixes: mkPfxs(['t1:foo']));

    await sg.create(spec, myInfo);
  });

  test('sg.create with odd (but valid) characters should succeed', () async {
    var app = c.app(utils.uniqueName('app'));
    await app.create(utils.emptyPerms());
    var db = app.noSqlDatabase(utils.uniqueName('db'));
    await db.create(utils.emptyPerms());

    var sgName = utils.uniqueName('sg-/!@#%^&*():\$\x01\xfe');
    var sg = db.syncgroup(sgName);

    var spec = SyncbaseClient.syncgroupSpec(
        description: 'test syncgroup ${sgName}', prefixes: mkPfxs(['t1:foo']));

    await sg.create(spec, myInfo);
  });

  test('creating a nested syncgroup', () async {
    var app = c.app(utils.uniqueName('app'));
    await app.create(utils.emptyPerms());
    var db = app.noSqlDatabase(utils.uniqueName('db'));
    await db.create(utils.emptyPerms());

    var sg1 = db.syncgroup(utils.uniqueName('sg'));
    var spec1 = SyncbaseClient.syncgroupSpec(
        description: 'test nested syncgroup ${sg1.name}',
        prefixes: mkPfxs(['t1:foo']));

    await sg1.create(spec1, myInfo);

    var sg2 = db.syncgroup(utils.uniqueName('sg'));
    var spec2 = SyncbaseClient.syncgroupSpec(
        description: 'test nested syncgroup ${sg2.name}',
        prefixes: mkPfxs(['t1:foo']));

    await sg2.create(spec2, myInfo);
  });

  test('creating a syncgroup that already exist', () async {
    var app = c.app(utils.uniqueName('app'));
    await app.create(utils.emptyPerms());
    var db = app.noSqlDatabase(utils.uniqueName('db'));
    await db.create(utils.emptyPerms());

    var sgName = utils.uniqueName('sg');
    var spec1 = SyncbaseClient.syncgroupSpec(
        description: 'test syncgroup ${sgName}', prefixes: mkPfxs(['t1:foo']));

    var sg1 = db.syncgroup(sgName);
    await sg1.create(spec1, myInfo);

    var spec2 = SyncbaseClient.syncgroupSpec(
        description: 'another syncgroup ${sgName}',
        prefixes: mkPfxs(['t2:bar']));

    var sg2 = db.syncgroup(sgName);
    expect(sg2.create(spec2, myInfo), throws);
  });

  test('sg.get/setSpec', () async {
    var app = c.app(utils.uniqueName('app'));
    await app.create(utils.emptyPerms());
    var db = app.noSqlDatabase(utils.uniqueName('db'));
    await db.create(utils.emptyPerms());
    var sgName = utils.uniqueName('sg');
    var sg = db.syncgroup(sgName);

    var spec = SyncbaseClient.syncgroupSpec(
        description: 'test syncgroup ${sgName}', prefixes: mkPfxs(['t1:foo']));

    await sg.create(spec, myInfo);

    var gotSpec = await sg.getSpec();
    expect(gotSpec.description, equals(spec.description));
    expect(gotSpec.prefixes, equals(spec.prefixes));

    var newSpec = SyncbaseClient.syncgroupSpec(
        description: 'a totally new spec ${sgName}',
        prefixes: mkPfxs(['t1:foo']));

    await sg.setSpec(newSpec, '');

    var gotSpec2 = await sg.getSpec();
    expect(gotSpec2.description, equals(newSpec.description));
    expect(gotSpec2.prefixes, equals(newSpec.prefixes));
  });
}
