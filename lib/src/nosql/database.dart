// Copyright 2015 The Vanadium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of syncbase_client;

class SyncbaseNoSqlDatabase extends NamedResource {
  SyncbaseNoSqlDatabase._internal(
      _ctx, _parentFullName, relativeName, batchSuffix)
      : super._internal(_ctx, _parentFullName, relativeName,
            naming.join(_parentFullName, escape(relativeName) + batchSuffix));

  // table returns a table with the given relativeName.
  SyncbaseTable table(String relativeName) {
    return new SyncbaseTable._internal(_ctx, fullName, relativeName);
  }

  // syncgroup returns a syncgroup with the given name.
  SyncbaseSyncgroup syncgroup(String name) {
    return new SyncbaseSyncgroup._internal(_ctx, this.fullName, name);
  }

  Future<List<String>> getSyncgroupNames() async {
    var v = await _ctx.syncbase.dbGetSyncgroupNames(fullName);
    if (isError(v.err)) throw v.err;
    return v.names;
  }

  Future create(mojom.Perms perms) async {
    var v = await _ctx.syncbase.dbCreate(fullName, perms);
    if (isError(v.err)) throw v.err;
  }

  Future destroy() async {
    var v = await _ctx.syncbase.dbDestroy(fullName);
    if (isError(v.err)) throw v.err;
  }

  Future<bool> exists() async {
    var v = await _ctx.syncbase.dbExists(fullName);
    if (isError(v.err)) throw v.err;
    return v.exists;
  }

  Stream<mojom.Result> exec(String query) {
    StreamController<mojom.Result> sc = new StreamController();

    mojom.ExecStreamStub stub = new mojom.ExecStreamStub.unbound();
    stub.impl = new ExecStreamImpl._fromStreamController(_ctx, sc, stub);

    _ctx.unclosedStubsManager.register(stub);

    // Call dbExec asynchronously.
    _ctx.syncbase.dbExec(fullName, query, stub).then((v) {
      // TODO(nlacasse): Same question regarding throwing behavior as TableScan.
      if (isError(v.err)) throw v.err;
    });

    return sc.stream;
  }

  Stream<mojom.WatchChange> watch(
      String tableName, String prefix, List<int> resumeMarker) {
    StreamController<mojom.WatchChange> sc = new StreamController();

    mojom.WatchGlobStreamStub stub = new mojom.WatchGlobStreamStub.unbound();

    stub.impl = new WatchGlobStreamImpl._fromStreamController(_ctx, sc, stub);

    _ctx.unclosedStubsManager.register(stub);

    // TODO(aghassemi): Implement naming utilities such as Join in Dart and use
    // them instead.
    var pattern = naming.join(tableName, prefix) + '*';
    var req = new mojom.GlobRequest();
    req.pattern = pattern;
    req.resumeMarker = resumeMarker;

    // Call dbWatch asynchronously.
    _ctx.syncbase.dbWatchGlob(fullName, req, stub).then((c) {
      // TODO(nlacasse): Same question regarding throwing behavior as TableScan.
      if (isError(c.err)) throw c.err;
    });

    return sc.stream;
  }

  Future<List<int>> getResumeMarker() async {
    var v = await _ctx.syncbase.dbGetResumeMarker(fullName);
    if (isError(v.err)) throw v.err;
    return v.resumeMarker;
  }

  Future<List<SyncbaseTable>> listTables() async {
    var v = await _ctx.syncbase.dbListTables(fullName);
    if (isError(v.err)) throw v.err;
    return v.tables;
  }

  Future<String> beginBatch(mojom.BatchOptions opts) async {
    var v = await _ctx.syncbase.dbBeginBatch(fullName, opts);
    if (isError(v.err)) throw v.err;
    return v.batchSuffix;
  }

  Future commit() async {
    var v = await _ctx.syncbase.dbCommit(fullName);
    if (isError(v.err)) throw v.err;
  }

  Future abort() async {
    var v = await _ctx.syncbase.dbAbort(fullName);
    if (isError(v.err)) throw v.err;
  }

  Future<mojom.Perms> getPermissions() async {
    var v = await _ctx.syncbase.dbGetPermissions(fullName);
    if (isError(v.err)) throw v.err;
    // TODO(nlacasse): We need to return the version too.  Create a struct type
    // that combines perms and version?
    return v.perms;
  }

  Future setPermissions(mojom.Perms perms, String version) async {
    var v = await _ctx.syncbase.dbSetPermissions(fullName, perms, version);
    if (isError(v.err)) throw v.err;
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
    // NOTE(aghassemi): We need to make newAck optional to match mojo's
    // define class, but newAck is always provided by mojo when called.
    if (newAck == null) {
      throw new ArgumentError('newAck must not be null');
    }
    _sc.add(result);

    // Only ack after we get unlocked.
    // If we are not locked, onNextUnlock returns immediately.
    return onNextUnlock().then((_) => newAck());
  }

  // Called by the mojo proxy when the Go function call returns.
  onDone(mojom.Error err) {
    if (isError(err)) {
      _sc.addError(err);
    }
    _sc.close();
    _ctx.unclosedStubsManager.close(_stub);
  }
}

class WatchGlobStreamImpl extends Object
    with StreamFlowControl
    implements mojom.WatchGlobStream {
  final ClientContext _ctx;
  final StreamController<mojom.WatchChange> _sc;
  final mojom.WatchGlobStreamStub _stub;

  WatchGlobStreamImpl._fromStreamController(this._ctx, this._sc, this._stub) {
    initFlowControl(this._sc);
  }

  Future onChange(mojom.WatchChange change, [Function newAck = null]) {
    // NOTE(aghassemi): We need to make newAck optional to match mojo's
    // define class, but newAck is always provided by mojo when called.
    if (newAck == null) {
      throw new ArgumentError('newAck must not be null');
    }
    // Testing instrumentation for testing flow control.
    if (testing.isTesting) {
      testing.DatabaseWatch.onChangeCounter.increment();
    }

    _sc.add(change);

    // Only ack after we get unlocked.
    // If we are not locked, onNextUnlock returns immediately.
    return onNextUnlock().then((_) => newAck());
  }

  // Called by the mojo proxy when the Go function call returns.
  // Watch technically never returns unless there is an error.
  onError(mojom.Error err) {
    if (isError(err)) {
      _sc.addError(err);
    }
    _sc.close();
    _ctx.unclosedStubsManager.close(_stub);
  }
}
