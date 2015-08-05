library echo_client;

import 'dart:async';

import 'package:mojo/application.dart' show Application;

import 'gen/dart-gen/mojom/lib/mojo/echo.mojom.dart' as mojom;

class EchoClient {
  final Application _app;
  final mojom.EchoProxy _proxy;
  final String url;

  EchoClient(this._app, this.url) : _proxy = new mojom.EchoProxy.unbound() {
    print('connecting to $url');
    _app.connectToService(url, _proxy);
    print('connected');
  }

  Future<String> echo(String s) async {
    print('calling echoString($s)');
    mojom.EchoEchoStringResponseParams v = await _proxy.ptr.echoString(s);

    String output = v.value;
    print('got echo result: $output');
    return output;
  }
}
