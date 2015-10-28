// Copyright 2015 The Vanadium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library syncbase_syncgroup_test;

import 'package:test/test.dart';

import 'package:syncbase/syncbase_client.dart'
    show SyncbaseClient, TableRow, SyncgroupSpec;

import './utils.dart' as utils;

List<TableRow> mkPfxs(List<String> strs) {
  List<TableRow> res = [];
  for (var str in strs) {
    var parts = str.split(':');
    assert(parts.length == 2);
    res.add(SyncbaseClient.syncgroupPrefix(parts[0], parts[1]));
  }
  return res;
}

// NOTE(nlacasse): It would be nice if we could override the == operator on
// SyncgroupSpec so that checking for equality would "just work" without
// needing this helper method.  Unfortunately those SyncgroupSpec is generated
// from the mojom file, so there's no way to change its functionality without
// wrapping, which I'd like to avoid.
bool specsAreEqual(SyncgroupSpec s1, SyncgroupSpec s2) {
  if (s1.description != s2.description) {
    return false;
  }
  if (s1.prefixes.length != s2.prefixes.length) {
    return false;
  }

  // Sort prefixes by tableName then row.
  int comparePrefixes(p1, p2) {
    if (p1.tableName != p2.tableName) {
      return p1.tableName.compareTo(p2.tableName);
    }
    return p1.row.compareTo(p2.row);
  }

  s1.prefixes.sort(comparePrefixes);
  s2.prefixes.sort(comparePrefixes);

  for (var i = 0; i < s1.prefixes.length; i++) {
    if (s1.prefixes[i].tableName != s2.prefixes[i].tableName) {
      return false;
    }
    if (s1.prefixes[i].row != s2.prefixes[i].row) {
      return false;
    }
  }
  return true;
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

    var emptySpec = SyncbaseClient.syncgroupSpec(mkPfxs([]));
    expect(sg.create(emptySpec, myInfo), throws);
  });

  test('sg.create with valid spec should succeed', () async {
    var app = c.app(utils.uniqueName('app'));
    await app.create(utils.emptyPerms());
    var db = app.noSqlDatabase(utils.uniqueName('db'));
    await db.create(utils.emptyPerms());
    var sg = db.syncgroup(utils.uniqueName('sg'));

    var spec = SyncbaseClient.syncgroupSpec(mkPfxs(['t1:foo']),
        description: 'test syncgroup ${sg.name}');

    await sg.create(spec, myInfo);
  });

  test('sg.create with odd (but valid) characters should succeed', () async {
    var app = c.app(utils.uniqueName('app'));
    await app.create(utils.emptyPerms());
    var db = app.noSqlDatabase(utils.uniqueName('db'));
    await db.create(utils.emptyPerms());

    var sgName = utils.uniqueName('sg-/!@#%^&*():\$\x01\xfe');
    var sg = db.syncgroup(sgName);

    var spec = SyncbaseClient.syncgroupSpec(mkPfxs(['t1:foo']),
        description: 'test syncgroup ${sgName}');

    await sg.create(spec, myInfo);
  });

  test('creating a nested syncgroup', () async {
    var app = c.app(utils.uniqueName('app'));
    await app.create(utils.emptyPerms());
    var db = app.noSqlDatabase(utils.uniqueName('db'));
    await db.create(utils.emptyPerms());

    var sg1 = db.syncgroup(utils.uniqueName('sg'));
    var spec1 = SyncbaseClient.syncgroupSpec(mkPfxs(['t1:foo']),
        description: 'test nested syncgroup ${sg1.name}');

    await sg1.create(spec1, myInfo);

    var sg2 = db.syncgroup(utils.uniqueName('sg'));
    var spec2 = SyncbaseClient.syncgroupSpec(mkPfxs(['t1:foo']),
        description: 'test nested syncgroup ${sg2.name}');

    await sg2.create(spec2, myInfo);
  });

  test('creating a syncgroup that already exist', () async {
    var app = c.app(utils.uniqueName('app'));
    await app.create(utils.emptyPerms());
    var db = app.noSqlDatabase(utils.uniqueName('db'));
    await db.create(utils.emptyPerms());

    var sgName = utils.uniqueName('sg');
    var spec1 = SyncbaseClient.syncgroupSpec(mkPfxs(['t1:foo']),
        description: 'test syncgroup ${sgName}');

    var sg1 = db.syncgroup(sgName);
    await sg1.create(spec1, myInfo);

    var spec2 = SyncbaseClient.syncgroupSpec(mkPfxs(['t2:bar']),
        description: 'another syncgroup ${sgName}');

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

    var spec = SyncbaseClient.syncgroupSpec(mkPfxs(['t1:foo']),
        description: 'test syncgroup ${sgName}');

    await sg.create(spec, myInfo);

    var gotSpec = await sg.getSpec();
    expect(specsAreEqual(gotSpec, spec), isTrue);

    var newSpec = SyncbaseClient.syncgroupSpec(mkPfxs(['t1:foo']),
        description: 'a totally new spec ${sgName}');

    await sg.setSpec(newSpec, '');

    var gotSpec2 = await sg.getSpec();
    expect(specsAreEqual(gotSpec2, newSpec), isTrue);
  });
}
