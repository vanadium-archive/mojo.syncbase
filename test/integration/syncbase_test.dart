#!mojo mojo:dart_content_handler?strict=true
// Copyright 2015 The Vanadium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:async';

import 'package:mojo/core.dart' show MojoHandle;
import 'package:test/test.dart';

import 'package:syncbase/src/testing_instrumentation.dart' as testing;
import 'package:syncbase/initialized_application.dart'
    show InitializedApplication;
import 'package:syncbase/syncbase_client.dart' show SyncbaseClient;

// Import other test files.
import './syncbase_app_test.dart' show runAppTests;
import './syncbase_database_test.dart' show runDatabaseTests;
import './syncbase_row_test.dart' show runRowTests;
import './syncbase_syncgroup_test.dart' show runSyncgroupTests;
import './syncbase_table_test.dart' show runTableTests;

main(List args) async {
  // Enable testing instrumentation.
  testing.isTesting = true;

  InitializedApplication app = new InitializedApplication.fromHandle(args[0]);
  await app.initialized;

  SyncbaseClient c = new SyncbaseClient(
      app.connectToService, 'https://mojo.v.io/syncbase_server.mojo');

  tearDown(() {
    app.resetConnections();
  });

  // Run imported tests.
  runAppTests(c);
  runDatabaseTests(c);
  runSyncgroupTests(c);
  runTableTests(c);
  runRowTests(c);

  // Append a final test to terminate shell connection.
  // TODO(nlacasse): Remove this once package 'test' supports a global tearDown
  // callback.  See https://github.com/dart-lang/test/issues/18.
  test('terminate shell connection', () async {
    await c.close();

    // TODO(aghassemi): Reporting on handle leaks is blocked on
    // a bug (https://github.com/domokit/mojo/issues/487) where mojo_test is not
    // exiting gracefully with --enable-multiprocess. To avoid this,
    // we sleep for a second so the test reporter can finish and print the
    // results before we close the app.
    // Currently there is no way to check for leaks since if we don't wait for
    // app.close(), there will always be leaks and if we do wait, test crashes
    // due to the bug and we can't check leaks anyway.
    // Enable this and remote the timer as soon as that bug is fixed.
    //await app.close();
    //expect(MojoHandle.reportLeakedHandles(), isTrue);
    new Timer(new Duration(seconds: 1), app.close);
  });
}
