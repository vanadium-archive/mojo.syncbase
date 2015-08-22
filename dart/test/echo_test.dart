#!mojo mojo:dart_content_handler
import 'dart:async';

import 'package:mojo/core.dart' show MojoHandle;
import 'package:test/test.dart';

import 'package:ether/echo_client.dart' show EchoClient;
import 'package:ether/initialized_application.dart' show InitializedApplication;

main(List args) async {
  InitializedApplication app = new InitializedApplication.fromHandle(args[0]);
  await app.initialized;

  String url = 'https://mojo.v.io/echo_server.mojo';

  EchoClient c = new EchoClient(app.connectToService, url);

  tearDown(() {
    app.resetConnections();
  });

  test('echo string returns correct response', () {
    String input = 'foobee';
    Future<String> got = c.echo(input);
    expect(got, completion(equals(input)));
  });

  test('echo empty string returns correct response', () {
    String input = '';
    Future<String> got = c.echo(input);
    expect(got, completion(equals(input)));
  });

  // Append a final test to terminate shell connection.
  // TODO(nlacasse): Remove this once package 'test' supports a global tearDown
  // callback.  See https://github.com/dart-lang/test/issues/18.
  test('terminate shell connection', () async {
    await c.close();
    expect(MojoHandle.reportLeakedHandles(), isTrue);

    // TODO(nlacasse): When running mojo_shell with --enable-multiprocess,
    // closing the application causes a non-graceful shutdown.  To avoid this,
    // we sleep for a second so the test reporter can finish and print the
    // results before we close the app.  Once mojo_shell can shut down more
    // gracefully, we should call app.close directly in the test and not in
    // this Timer.
    new Timer(new Duration(seconds: 1), app.close);
  });
}
