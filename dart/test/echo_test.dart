#!mojo mojo:dart_content_handler
import 'dart:async';

import 'package:mojo/core.dart' show MojoHandle;
import 'package:test/test.dart';

import '../lib/echo_client.dart' show EchoClient;

main(List args) async {
  // args[0] is the mojo handle.
  MojoHandle handle = new MojoHandle(args[0]);

  // TODO(nlacasse): Switch to serving these files over http rather than
  // directly from the filesystem, so they can be accessed by Android.
  String serviceUrl = 'file://' + args[1].replaceFirst('dart/test/echo_test.dart', 'gen/mojo/echo_server.mojo');

  EchoClient c = new EchoClient(handle, serviceUrl);
  c.connect();

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
  });
}
