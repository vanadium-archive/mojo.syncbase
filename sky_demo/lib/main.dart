import 'dart:async';
import 'dart:convert' show UTF8;

import 'package:sky/mojo/embedder.dart' show embedder;
import 'package:sky/widgets.dart';

import 'package:ether/echo_client.dart' show EchoClient;
import 'package:ether/syncbase_client.dart'
    show Perms, SyncbaseClient, SyncbaseTable;

log(String msg) {
  DateTime now = new DateTime.now();
  print('$now $msg');
}

Perms emptyPerms() => new Perms()..json = '{}';

class DemoApp extends App {
  final EchoClient _echoClient;
  final SyncbaseClient _syncbaseClient;

  DemoApp()
      : _echoClient = new EchoClient(
            embedder.connectToService, 'https://mojo.v.io/echo_server.mojo'),
        _syncbaseClient = new SyncbaseClient(embedder.connectToService,
            'https://mojo.v.io/syncbase_server.mojo');

  int seq = 0;
  SyncbaseTable tb;
  String sendMsg, recvMsg, putStr, getStr;

  Future doEcho() async {
    log('DemoApp.doEcho');

    setState(() {
      sendMsg = seq.toString();
      recvMsg = '';
    });
    seq++;
    log('setState sendMsg done');

    String recvMsgAsync = await _echoClient.echo(sendMsg);

    setState(() {
      recvMsg = recvMsgAsync;
    });
    log('setState recvMsg done');
  }

  Future doSyncbaseInit() async {
    log('DemoApp.doSyncbaseInit');
    if (tb != null) {
      log('syncbase already initialized');
      return;
    }
    var app = _syncbaseClient.app('app');
    if (!(await app.exists())) {
      await app.create(emptyPerms());
    }
    var db = app.noSqlDatabase('db');
    if (!(await db.exists())) {
      await db.create(emptyPerms());
    }
    var table = db.table('table');
    if (!(await table.exists())) {
      await table.create(emptyPerms());
    }
    tb = table;
    log('syncbase is now initialized');
  }

  Future doPutGet() async {
    log('DemoApp.doPutGet');
    await doSyncbaseInit();

    setState(() {
      putStr = seq.toString();
      getStr = '';
    });
    seq++;
    log('setState putStr done');

    // TODO(sadovsky): Switch to tb.put/get once they exist.
    var row = tb.row('key');
    await row.put(UTF8.encode(putStr));
    var getBytes = await row.get();

    setState(() {
      getStr = UTF8.decode(getBytes);
    });
    log('setState getStr done');
  }

  // TODO(sadovsky): I don't think Sky calls App.close().
  Future close({bool immediate: false}) async {
    log('DemoApp.close');
    await _echoClient.close(immediate: immediate);
    await _syncbaseClient.close(immediate: immediate);
  }

  Widget build() {
    return new Container(
        decoration:
            const BoxDecoration(backgroundColor: const Color(0xFF00ACC1)),
        child: new Flex([
          new RaisedButton(child: new Text('doEcho'), onPressed: doEcho),
          new Text('sendMsg: $sendMsg'),
          new Text('recvMsg: $recvMsg'),
          new RaisedButton(child: new Text('doPutGet'), onPressed: doPutGet),
          new Text('putStr: $putStr'),
          new Text('getStr: $getStr')
        ], direction: FlexDirection.vertical));
  }
}

void main() {
  runApp(new DemoApp());
}
