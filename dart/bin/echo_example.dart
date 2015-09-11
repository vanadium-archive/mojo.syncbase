#!mojo mojo:dart_content_handler
// Copyright 2015 The Vanadium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:ether/initialized_application.dart' show InitializedApplication;
import 'package:ether/echo_client.dart' show EchoClient;

main(List args) async {
  InitializedApplication app = new InitializedApplication.fromHandle(args[0]);
  await app.initialized;

  EchoClient c = new EchoClient(
      app.connectToService, 'https://mojo.v.io/echo_server.mojo');

  String input = 'foobar';
  String output = await c.echo(input);
  print('in=$input out=$output match=${input == output}');

  await c.close();
  await app.close();
}
