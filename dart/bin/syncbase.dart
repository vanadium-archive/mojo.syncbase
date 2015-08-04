#!mojo mojo:dart_content_handler

// TODO(nlacasse): Remove this file once the tests are sufficiently reliable to
// test syncbase connectivity.

import 'package:mojo/core.dart' show MojoHandle;

import '../lib/syncbase_client.dart' show SyncbaseClient;

main(List args) async {
  MojoHandle handle = new MojoHandle(args[0]);

  // TODO(nlacasse): Switch to serving these files over http rather than
  // directly from the filesystem, so they can be accessed by Android.
  String url = args[1].replaceFirst('dart/bin/syncbase.dart', 'gen/mojo/syncbase_server.mojo');

  SyncbaseClient c = new SyncbaseClient(handle, url);
  await c.connect();
  bool exists = await c.appExists('foo');
  print('appExists(foo): $exists');
}
