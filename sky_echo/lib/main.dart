import 'dart:async';

import 'package:sky/mojo/embedder.dart' show embedder;
import 'package:sky/widgets.dart';

import '../../dart/lib/echo_client.dart' show EchoClient;

log(String msg) {
  DateTime now = new DateTime.now();
  print('$now $msg');
}

class EchoApp extends App {
  final EchoClient _c;

  EchoApp()
      : _c = new EchoClient(
            embedder.connectToService, 'https://mojo.v.io/echo_server.mojo');

  int seq = 0;
  String sendMsg = '';
  String recvMsg = '';

  Future doEcho() async {
    log('EchoApp.doEcho');
    setState(() {
      sendMsg = seq.toString();
      recvMsg = '';
    });
    seq++;
    log('setState sendMsg done');

    String recvMsgAsync = await _c.echo(sendMsg);

    setState(() {
      recvMsg = recvMsgAsync;
    });
    log('setState recvMsg done');
  }

  // TODO(sadovsky): I don't think Sky calls App.close().
  Future close({bool immediate: false}) async {
    log('EchoApp.close');
    return await _c.close(immediate: immediate);
  }

  Widget build() {
    return new Container(
        decoration:
            const BoxDecoration(backgroundColor: const Color(0xFF00ACC1)),
        child: new Flex([
          new RaisedButton(child: new Text('doEcho'), onPressed: doEcho),
          new Text('Sent message $sendMsg'),
          new Text('Received message $recvMsg')
        ], direction: FlexDirection.vertical));
  }
}

void main() {
  runApp(new EchoApp());
}
