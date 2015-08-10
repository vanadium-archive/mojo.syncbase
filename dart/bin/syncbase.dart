#!mojo mojo:dart_content_handler

// TODO(nlacasse): Remove this file once the tests are sufficiently reliable to
// test syncbase connectivity.

import 'package:ether/initialized_application.dart' show InitializedApplication;
import 'package:ether/syncbase_client.dart' show SyncbaseClient;

main(List args) async {
  InitializedApplication app = new InitializedApplication.fromHandle(args[0]);
  await app.initialized;

  // TODO(nlacasse): Switch to serving these files over http rather than
  // directly from the filesystem, so they can be accessed by Android.
  String url = 'file://' +
      args[1].replaceFirst(
          'dart/bin/syncbase.dart', 'gen/mojo/syncbase_server.mojo');

  SyncbaseClient c = new SyncbaseClient(app, url);
  bool exists = await c.app('foo').exists();
  print('app(foo).exists(): $exists');
}
