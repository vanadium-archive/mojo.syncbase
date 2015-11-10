// Copyright 2015 The Vanadium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library syncbase_app_test;

import 'package:test/test.dart';

import 'package:syncbase/syncbase_client.dart' show SyncbaseClient;

import './utils.dart' as utils;

runAppTests(SyncbaseClient c) {
  test('getting a handle to an app', () {
    var appName = utils.uniqueName('app');
    var app = c.app(appName);
    expect(app.name, equals(appName));
    expect(app.fullName, equals(appName));
  });

  test('creating and destroying an app', () async {
    var appName = utils.uniqueName('app');
    var app = c.app(appName);

    expect(await app.exists(), equals(false));
    await app.create(utils.emptyPerms());
    expect(await app.exists(), equals(true));
    await app.destroy();
    expect(await app.exists(), equals(false));
  });

  test('listing apps', () async {
    var appName = utils.uniqueName('app');
    await c.app(appName).create(utils.emptyPerms());

    var apps = await c.listApps();

    // Note: The Syncbase instance is shared among all tests, so listApps() will
    // return lots of apps; here, we simply verify that our appName is in the
    // returned list.
    expect(apps.contains(appName), equals(true));
  });

  test('listing databases', () async {
    var appName = utils.uniqueName('app');
    var app = c.app(appName);
    await app.create(utils.emptyPerms());

    var want = [utils.uniqueName('db1'), utils.uniqueName('db2')];
    want.sort();

    for (var dbName in want) {
      await app.noSqlDatabase(dbName).create(utils.emptyPerms());
    }

    var got = await app.listDatabases();
    got.sort((d1, d2) => d1.compareTo(d2));
    expect(got.length, equals(want.length));
    for (var i = 0; i < got.length; i++) {
      expect(got[i], equals(want[i]));
    }
  });

  // TODO(nlacasse): Test app.get/setPermissions.
}
