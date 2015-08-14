#!mojo mojo:dart_content_handler

import 'package:ether/initialized_application.dart' show InitializedApplication;
import 'package:ether/syncbase_client.dart' show SyncbaseClient;

main(List args) async {
  InitializedApplication app = new InitializedApplication.fromHandle(args[0]);
  await app.initialized;

  String url = 'https://mojo.v.io/syncbase_server.mojo';

  SyncbaseClient c = new SyncbaseClient(app, url);
  bool exists = await c.app('foo').exists();
  print('app(foo).exists(): $exists');

  await c.close();
  await app.close();
}
