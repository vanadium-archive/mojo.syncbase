#!mojo mojo:dart_content_handler

import 'dart:async';

import 'package:mojo/application.dart' show Application;

// TODO(nlacasse): Get this library from Pub once it is available there.
import '../lib/src/apptest/apptest.dart';

import '../../gen/dart-gen/mojom/lib/mojo/echo.mojom.dart' show EchoEchoStringResponseParams, EchoProxy;

echoTests(Application app, String url) {
  // TODO(nlacasse): This is pretty gross, but there's no good way to get the
  // current directory from within a Mojo app.  Dart's Directory.current() is
  // either broken or unsupported.  In any case, this will never work on
  // Android, so we should switch to serving these files over http rather
  // than directly from the filesystem.
  String echoServerUrl = url.replaceFirst('dart/test/echo_test.dart', 'gen/mojo/echo_server.mojo');

  test('echo returns correct response', () async {
    EchoProxy ep = new EchoProxy.unbound();
    app.connectToService(echoServerUrl, ep);

    String input = 'foobee';
    var v = await ep.ptr.echoString(input);
    expect(v.value, equals(input));

    await ep.ptr.quit();
    await ep.close();
  });
}

Future<int> main(List args) async {
  var exitCode = await runAppTests(args[0], [echoTests]);
  return exitCode;
}
