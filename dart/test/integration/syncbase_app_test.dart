// Copyright 2015 The Vanadium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library syncbase_app_test;

import 'package:test/test.dart';

import 'package:ether/syncbase_client.dart' show SyncbaseClient;

import './utils.dart' as utils;

runAppTests(SyncbaseClient c) {
  test('getting a handle to an app', () {
    var appName = utils.uniqueName('app');
    var app = c.app(appName);
    expect(app.relativeName, equals(appName));
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

  // TODO(nlacasse): Test app.get/setPermissions.
}
