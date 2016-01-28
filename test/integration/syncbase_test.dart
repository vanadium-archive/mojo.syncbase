#!mojo mojo:dart_content_handler?strict=true
// Copyright 2015 The Vanadium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:async';

import 'package:test/test.dart';

import 'package:syncbase/src/testing_instrumentation.dart' as testing;
import 'package:syncbase/initialized_application.dart'
    show InitializedApplication;
import 'package:syncbase/syncbase_client.dart' show SyncbaseClient;

// Import other test files.
import './syncbase_app_test.dart' show runAppTests;
import './syncbase_batch_test.dart' show runBatchTests;
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
  runBatchTests(c);
  runSyncgroupTests(c);
  runTableTests(c);
  runRowTests(c);

  tearDownAll(() async {
    await c.close();

    // TODO(aghassemi): mojo_test does not exit gracefully when
    // --enable-multiprocess is set, which is required when running Go Mojo
    // services. See https://github.com/domokit/mojo/issues/487. Because of this
    // bug, we must sleep for a second before exiting to give the test reporter
    // time to print the test results.
    // A consequence of this bug is that there is no way to check for handle
    // leaks: if we don't wait for app.close(), there will always be leaks, and
    // if we do wait, the test crashes.
    // We should enable checking for leaks and remove the timer once the
    // graceful exit bug is fixed.
    //await app.close();
    //expect(MojoHandle.reportLeakedHandles(), isTrue);
    new Timer(new Duration(seconds: 1), app.close);
  });
}
