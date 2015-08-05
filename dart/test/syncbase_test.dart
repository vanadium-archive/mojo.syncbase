#!mojo mojo:dart_content_handler
import 'package:mojo/core.dart' show MojoHandle;
import 'package:test/test.dart';

import 'package:ether/initialized_application.dart' show InitializedApplication;
import 'package:ether/syncbase_client.dart' show SyncbaseClient;

main(List args) async {
  InitializedApplication app = new InitializedApplication.fromHandle(args[0]);
  await app.initialized;

  // TODO(nlacasse): Switch to serving these files over http rather than
  // directly from the filesystem, so they can be accessed by Android.
  String url = 'file://' + args[1].replaceFirst('dart/test/syncbase_test.dart', 'gen/mojo/synbase_server.mojo');

  SyncbaseClient c = new SyncbaseClient(app, url);

  tearDown(() {
    app.resetConnections();
  });

  test('appExists(foo) should be false', () {
    expect(c.appExists, completion(isFalse));
  });

  // Append a final test to terminate shell connection.
  // TODO(nlacasse): Remove this once package 'test' supports a global tearDown
  // callback.  See https://github.com/dart-lang/test/issues/18.
  test('terminate shell connection', () async {
    await app.close();
    expect(MojoHandle.reportLeakedHandles(), isTrue);
  });
}
