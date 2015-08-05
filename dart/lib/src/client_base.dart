import 'dart:async';

// TODO(nlacasse): Once echo_client is gone, make this file (and any other
// shared dependencies) a "part of" syncbase library so we can use private
// methods and variables.

import 'package:mojo/application.dart' show Application;
import 'package:mojo/bindings.dart' show ProxyBase;
import 'package:mojo/core.dart' show MojoHandle;

// InitializedApplication is an Application with a future 'initialized' that is
// resolved after the 'initialize' method finishes.
class InitializedApplication extends Application {
  final _initializeCompleter = new Completer();
  Future get initialized => _initializeCompleter.future;

  InitializedApplication.fromHandle(MojoHandle handle) : super.fromHandle(handle);

  void initialize(List<String> args, String url) {
    _initializeCompleter.complete();
  }
}

// ClientBase is the base class for a client that needs to connect to a mojo
// service.
// TODO(nlacasse): This class is useful for holding the common parts of
// echo_client and syncbase_client during this time of rapid change.  Once we
// get rid of echo_client, reconsider if this base class makes sense.
abstract class ClientBase {
  final String url;
  final InitializedApplication _app;

  ClientBase(MojoHandle handle, this.url) : this._app = new InitializedApplication.fromHandle(handle);

  Future connectWithProxy(ProxyBase p) async {
    await _app.initialized;
    print('connecting to $url');
    _app.connectToService(url, p);
    print('connected');
  }

  Future close() {
    return _app.close();
  }
}
