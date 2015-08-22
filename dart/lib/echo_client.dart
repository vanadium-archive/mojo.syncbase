library echo_client;

import 'dart:async';

import 'package:mojo/bindings.dart' as bindings;

import 'gen/dart-gen/mojom/lib/mojo/echo.mojom.dart' as mojom;

typedef void ConnectToServiceFn(String url, bindings.ProxyBase proxy);

class EchoClient {
  final mojom.EchoProxy _proxy;
  final String _url;

  Future close({bool immediate: false}) {
    return _proxy.close(immediate: immediate);
  }

  EchoClient(ConnectToServiceFn cts, this._url)
      : _proxy = new mojom.EchoProxy.unbound() {
    print('connecting to $_url');
    cts(_url, _proxy);
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
