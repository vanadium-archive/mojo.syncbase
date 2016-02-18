#!mojo mojo:dart_content_handler?strict=true
// Copyright 2016 The Vanadium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:async';

import 'package:mojo/application.dart' show Application;
import 'package:mojo/core.dart' show MojoHandle;
import 'package:syncbase/syncbase_client.dart' show SyncbaseClient;

import './pingpong_test.dart' show runPingPongTest;

class PingPongApplication extends Application {
  PingPongApplication.fromHandle(MojoHandle handle) : super.fromHandle(handle);

  void initialize(List<String> args, String url) {
    run(args, url);
  }

  Future run(List<String> args, String url) async {
    // args[0] is the mojo name
    // args[1] is the remote endpoint.
    // args[2+] are the words to echo.
    print("$url PingPong");
    print(args);

    SyncbaseClient c = new SyncbaseClient(
        this.connectToService, 'https://mojo.v.io/syncbase_server.mojo');

    await runPingPongTest(args, c);

    await this.closeApplication();
  }

  Future closeApplication() async {
    print("Closing application...");
    await this.close();

    assert(MojoHandle.reportLeakedHandles());
  }
}

main(List args) {
  MojoHandle appHandle = new MojoHandle(args[0]);
  new PingPongApplication.fromHandle(appHandle);
}
