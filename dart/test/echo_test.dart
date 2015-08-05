#!mojo mojo:dart_content_handler
import 'dart:async';

import 'package:mojo/core.dart' show MojoHandle;
import 'package:test/test.dart';

import 'package:ether/echo_client.dart' show EchoClient;
import 'package:ether/initialized_application.dart' show InitializedApplication;

main(List args) async {
  InitializedApplication app = new InitializedApplication.fromHandle(args[0]);
  await app.initialized;

  // TODO(nlacasse): Switch to serving these files over http rather than
  // directly from the filesystem, so they can be accessed by Android.
  String url = 'file://' + args[1].replaceFirst('dart/test/echo_test.dart', 'gen/mojo/echo_server.mojo');

  EchoClient c = new EchoClient(app, url);

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
    await app.close();
    expect(MojoHandle.reportLeakedHandles(), isTrue);
  });
}
