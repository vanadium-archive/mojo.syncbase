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

    // NOTE(aghassemi): Since the Syncbase instance is shared between all tests,
    // we will get a lot more than just 1 app, so we simply verify that our
    // appName is in the returned list.
    expect(apps.length, greaterThan(0));
    var ourApp = apps.firstWhere((e) => e.name == appName);
    expect(ourApp.name, equals(appName));
  });

  test('listing databases', () async {
    var appName = utils.uniqueName('app');
    var app = c.app(appName);
    await app.create(utils.emptyPerms());

    var dbNames = [utils.uniqueName('db1'), utils.uniqueName('db2')];
    dbNames.sort();

    for (var dbName in dbNames) {
      await app.noSqlDatabase(dbName).create(utils.emptyPerms());
    }

    var dbs = await app.listDatabases();
    dbs.sort((d1, d2) => d1.name.compareTo(d2.name));
    expect(dbs.length, equals(dbNames.length));
    for (var i = 0; i < dbNames.length; i++) {
      expect(dbs[i].name, equals(dbNames[i]));
    }
  });

  // TODO(nlacasse): Test app.get/setPermissions.
}
