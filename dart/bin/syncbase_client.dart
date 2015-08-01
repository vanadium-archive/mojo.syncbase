#!mojo mojo:dart_content_handler

import 'dart:async';

// TODO(nlacasse): Use 'show' or 'as' in non-stdlib import statements, per
// Vanadium Dart convention.
import 'package:mojo/application.dart';
import 'package:mojo/core.dart';

import '../../gen/dart-gen/mojom/lib/mojo/syncbase.mojom.dart' show SyncbaseProxy;

class Client extends Application {
  Client.fromHandle(MojoHandle handle) : super.fromHandle(handle);

  void initialize(List<String> args, String url) {
    // TODO(nlacasse): This is pretty gross, but there's no good way to get the
    // current directory from within a Mojo app.  Dart's Directory.current() is
    // either broken or unsupported.  In any case, this will never work on
    // Android, so we should switch to serving these files over http rather
    // than directly from the filesystem.
    String serviceUrl = url.replaceFirst('dart/bin/syncbase_client.dart', 'gen/mojo/syncbase_server.mojo');

    print('connecting to $serviceUrl');

    SyncbaseProxy p = new SyncbaseProxy.unbound();
    connectToService(serviceUrl, p);

    print('connected');

    closeApplication();
  }

  Future closeApplication() async {
    await close();
    assert(MojoHandle.reportLeakedHandles());
  }
}

main(List args) {
  MojoHandle appHandle = new MojoHandle(args[0]);
  new Client.fromHandle(appHandle);
}
