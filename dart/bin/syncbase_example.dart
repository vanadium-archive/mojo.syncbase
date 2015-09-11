#!mojo mojo:dart_content_handler
// Copyright 2015 The Vanadium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:ether/initialized_application.dart' show InitializedApplication;
import 'package:ether/syncbase_client.dart' show SyncbaseClient;

main(List args) async {
  InitializedApplication app = new InitializedApplication.fromHandle(args[0]);
  await app.initialized;

  SyncbaseClient c = new SyncbaseClient(
      app.connectToService, 'https://mojo.v.io/syncbase_server.mojo');

  bool exists = await c.app('foo').exists();
  print('app(foo).exists(): $exists');

  await c.close();
  await app.close();
}
