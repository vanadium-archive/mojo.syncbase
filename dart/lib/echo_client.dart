library echo_client;

import 'dart:async';

import 'package:mojo/bindings.dart' as bindings;

import 'gen/dart-gen/mojom/lib/mojo/echo.mojom.dart' as mojom;

typedef void ConnectToServiceFn(String url, bindings.ProxyBase proxy);

class EchoClient {
  final mojom.EchoProxy _proxy;

  EchoClient(ConnectToServiceFn cts, String url)
      : _proxy = new mojom.EchoProxy.unbound() {
    print('connecting to $url');
    cts(url, _proxy);
    print('connected');
  }

  // TODO(nlacasse): Is this necessary?
  Future close({bool immediate: false}) {
    return _proxy.close(immediate: immediate);
  }

  Future<String> echo(String s) async {
    print('calling echoString($s)');
    mojom.EchoEchoStringResponseParams v = await _proxy.ptr.echoString(s);

    String output = v.value;
    print('got echo result: $output');
    return output;
  }
}
