import 'package:sky/widgets.dart';

class HelloWorldApp extends App {
  Widget build() {
    return new Center(child: new Text('Hello, world!'));
  }
}

void main() {
  runApp(new HelloWorldApp());
}


/*
import 'package:sky/widgets.dart';

import 'dart:async';

import 'package:mojo/core.dart';
import 'package:mojo/bindings.dart';
import 'package:sky/mojo/embedder.dart' show embedder;

import 'package:ether/echo_client.dart' show EchoClient;

class EchoApp extends App {
  EchoApp() : super();

  EchoClient c = new EchoClient(app, 'https://mojo.v.io/echo_server.mojo');
  String sentMsg = '';
  String recvMsg = '';
  bool connected = false;

  void _connect() {
    if (connected) return;
    //embedder.connectToService('mojo:echo_server', echoProxy);
    //embedder.connectToService('https://core.mojoapps.io/go_echo_server.mojo', echoProxy); // works with echo_server.mojo, but must use --enable-multiprocess for this one
    embedder.connectToService('https://core.mojoapps.io/go_forward_echo_server.mojo', echoProxy);

    connected = true;
  }

  Future doEcho({bool immediate: false}) async {
    setState(() {
      sendMsg = 'hello';
    });
    print('Sent message $sendMsg');

    recvMsg = await c.echo(sendMsg);
    _connect();
    String msg = 'Hello ' + recvMsg;
    setState(() {
      sentMsg = msg;
      print('Sending message $sentMsg');
    });
    try {
      //final EchoEchoStringResponseParams result = await echoProxy.ptr.echoString(msg);
      String endpoint = '/@5@wsh@172.17.166.74:33841@cbf4008c9abb8a430b1b455058e1e7ba@s@alexfandrianto@alexfandrianto0.mtv.corp.google.com-18361@@/mojo:go_echo_server/mojo::examples::Echo';
      final ForwardEchoEchoForwardResponseParams result = await echoProxy.ptr.echoForward(msg, endpoint);

      setState(() {
        recvMsg = result.value;
        print('Got message $recvMsg');
      });
    } catch(e) {
      print('Error echoing: ' + e.toString());
      return false;
    }
    return true;
  }

  Future close({bool immediate: false}) async {
    await echoProxy.close(immediate: immediate);
    return;
  }

  Widget build() {
    return new Container(
      decoration: const BoxDecoration(
        backgroundColor: const Color(0xFF00ACC1)
      ),
      child: new Flex([
        new RaisedButton(
          child: new Text('Click here'),
          onPressed: doEcho
        ),
        new Text('Sent message $sentMsg'),
        new Text('Received message $recvMsg')
      ],
      direction: FlexDirection.vertical)
    );
  }
}

void main() {
  runApp(new EchoApp());
}
*/
