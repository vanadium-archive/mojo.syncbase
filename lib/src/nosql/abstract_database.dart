// Copyright 2015 The Vanadium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of syncbase_client;

abstract class AbstractDatabase extends NamedResource {
  AbstractDatabase._internal(_ctx, _parentFullName, relativeName, batchSuffix)
      : super._internal(_ctx, _parentFullName, relativeName,
            naming.join(_parentFullName, escape(relativeName) + batchSuffix));

  // Returns the table with the given relative name.
  SyncbaseTable table(String relativeName) {
    return new SyncbaseTable._internal(_ctx, fullName, relativeName);
  }

  // Returns a list of all table names.
  Future<List<String>> listTables() async {
    var v = await _ctx.syncbase.dbListTables(fullName);
    if (isError(v.err)) throw v.err;
    return v.tables;
  }

  // Executes a syncQL query.
  Stream<mojom.Result> exec(String query, [List<List<int>> params = const []]) {
    StreamController<mojom.Result> sc = new StreamController();

    mojom.ExecStreamStub stub = new mojom.ExecStreamStub.unbound();
    stub.impl = new ExecStreamImpl._fromStreamController(_ctx, sc, stub);

    _ctx.unclosedStubsManager.register(stub);

    // Call dbExec asynchronously.
    _ctx.syncbase.dbExec(fullName, query, params, stub).then((v) {
      // TODO(nlacasse): Same question regarding throwing behavior as TableScan.
      if (isError(v.err)) throw v.err;
    });

    return sc.stream;
  }

  Future<List<int>> getResumeMarker() async {
    var v = await _ctx.syncbase.dbGetResumeMarker(fullName);
    if (isError(v.err)) throw v.err;
    return v.resumeMarker;
  }
}

class ExecStreamImpl extends Object
    with StreamFlowControl
    implements mojom.ExecStream {
  final ClientContext _ctx;
  final StreamController<mojom.Result> _sc;
  final mojom.ExecStreamStub _stub;

  ExecStreamImpl._fromStreamController(this._ctx, this._sc, this._stub) {
    initFlowControl(this._sc);
  }

  onResult(mojom.Result result, [Function newAck = null]) {
    // NOTE(aghassemi): newAck must be optional to match the mojom-generated
    // Dart interface, but in practice the Mojo IPC framework always provides
    // it.
    if (newAck == null) {
      throw new ArgumentError('newAck must not be null');
    }
    _sc.add(result);

    // Only ack after we become unlocked.
    // If we are unlocked, onNextUnlock returns immediately.
    return onNextUnlock().then((_) => newAck());
  }

  // Called by the Mojo proxy when the Go function call returns.
  onDone(mojom.Error err) {
    if (isError(err)) {
      _sc.addError(err);
    }
    _sc.close();
    _ctx.unclosedStubsManager.close(_stub);
  }
}
