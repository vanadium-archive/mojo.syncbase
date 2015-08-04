library echo_client;

import 'dart:async';

import 'package:mojo/core.dart' show MojoHandle;

import 'gen/dart-gen/mojom/lib/mojo/echo.mojom.dart' as mojom;
import 'src/client_base.dart' show ClientBase;

class EchoClient extends ClientBase {
  final mojom.EchoProxy _proxy;

  EchoClient(MojoHandle handle, String url) :
    _proxy = new mojom.EchoProxy.unbound(),
    super(handle, url);

  Future connect() {
    return connectWithProxy(_proxy);
  }

  Future<String> echo(String s) async {
    print('calling echoString($s)');
    mojom.EchoEchoStringResponseParams v = await _proxy.ptr.echoString(s);

    String output = v.value;
    print('got echo result: $output');
    return output;
  }
}
