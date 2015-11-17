// Copyright 2015 The Vanadium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of syncbase_client;

class SyncbaseDatabase extends AbstractDatabase {
  SyncbaseDatabase._internal(_ctx, _parentFullName, relativeName)
      : super._internal(_ctx, _parentFullName, relativeName, '');

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

  Future<SyncbaseBatchDatabase> beginBatch(mojom.BatchOptions opts) async {
    var v = await _ctx.syncbase.dbBeginBatch(fullName, opts);
    if (isError(v.err)) throw v.err;
    return new SyncbaseBatchDatabase._internal(
        _ctx, _parentFullName, name, v.batchSuffix);
  }

  // syncgroup returns a syncgroup with the given name.
  SyncbaseSyncgroup syncgroup(String name) {
    return new SyncbaseSyncgroup._internal(_ctx, fullName, name);
  }

  Future<List<String>> getSyncgroupNames() async {
    var v = await _ctx.syncbase.dbGetSyncgroupNames(fullName);
    if (isError(v.err)) throw v.err;
    return v.names;
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
    // NOTE(aghassemi): newAck must be optional to match the mojom-generated
    // Dart interface, but in practice the Mojo IPC framework always provides
    // it.
    if (newAck == null) {
      throw new ArgumentError('newAck must not be null');
    }
    // Test instrumentation, for testing flow control.
    if (testing.isTesting) {
      testing.DatabaseWatch.onChangeCounter.increment();
    }

    _sc.add(change);

    // Only ack after we become unlocked.
    // If we are unlocked, onNextUnlock returns immediately.
    return onNextUnlock().then((_) => newAck());
  }

  // Called by the Mojo proxy when the Go function call returns.
  // (Note, watch never terminates unless there is an error.)
  onError(mojom.Error err) {
    if (isError(err)) {
      _sc.addError(err);
    }
    _sc.close();
    _ctx.unclosedStubsManager.close(_stub);
  }
}
