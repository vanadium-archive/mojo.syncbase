// Copyright 2015 The Vanadium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of syncbase_client;

// TODO(sadovsky): Add listTables method.
class SyncbaseNoSqlDatabase extends NamedResource {
  SyncbaseNoSqlDatabase._internal(
      _proxy, _parentFullName, relativeName, batchSuffix)
      : super._internal(_proxy, _parentFullName, relativeName,
          naming.join(_parentFullName, escape(relativeName) + batchSuffix));

  // table returns a table with the given relativeName.
  SyncbaseTable table(String relativeName) {
    return new SyncbaseTable._internal(_proxy, fullName, relativeName);
  }

  // syncGroup returns a syncGroup with the given name.
  SyncbaseSyncGroup syncGroup(String name) {
    return new SyncbaseSyncGroup._internal(_proxy, this.fullName, name);
  }

  Future<List<String>> getSyncGroupNames() async {
    var v = await _proxy.ptr.dbGetSyncGroupNames(fullName);
    if (isError(v.err)) throw v.err;
    return v.names;
  }

  Future create(mojom.Perms perms) async {
    var v = await _proxy.ptr.dbCreate(fullName, perms);
    if (isError(v.err)) throw v.err;
  }

  Future destroy() async {
    var v = await _proxy.ptr.dbDestroy(fullName);
    if (isError(v.err)) throw v.err;
  }

  Future<bool> exists() async {
    var v = await _proxy.ptr.dbExists(fullName);
    if (isError(v.err)) throw v.err;
    return v.exists;
  }

  Stream<mojom.Result> exec(String query) {
    StreamController<mojom.Result> sc = new StreamController();
    mojom.ExecStream execStream = new ExecStreamImpl._fromStreamController(sc);

    // Call dbExec asynchronously.
    _proxy.ptr.dbExec(fullName, query, execStream).then((v) {
      // TODO(nlacasse): Is throwing the correct behavior here?  Consider
      // returning a tuple (Stream<mojom.Result>, Future) and resolve the
      // Future at the end of the RPC (with an error if applicable).  Then
      // errors will be handled the same in this method as in all the other
      // methods that return Futures.  (Even though the other methods seem to
      // "throw", they are actually resolving a Future since the function is
      // declared with "async".)
      if (isError(v.err)) throw v.err;
    });

    return sc.stream;
  }

  Stream<mojom.WatchChange> watch(
      String tableName, String prefix, List<int> resumeMarker) {
    StreamController<mojom.WatchChange> sc = new StreamController();

    mojom.WatchGlobStreamStub stub = new mojom.WatchGlobStreamStub.unbound();
    stub.impl = new WatchGlobStreamImpl._fromStreamController(sc);

    // TODO(aghassemi): Implement naming utilities such as Join in Dart and use them instead.
    var pattern = naming.join(tableName, prefix) + '*';
    var req = new mojom.GlobRequest();
    req.pattern = pattern;
    req.resumeMarker = resumeMarker;

    // Call dbWatch asynchronously.
    _proxy.ptr.dbWatchGlob(fullName, req, stub).then((c) {
      // TODO(nlacasse): Same question regarding throwing behavior as TableScan.
      if (isError(c.err)) throw c.err;
    });

    return sc.stream;
  }

  Future<List<int>> getResumeMarker() async {
    var v = await _proxy.ptr.dbGetResumeMarker(fullName);
    if (isError(v.err)) throw v.err;
    return v.resumeMarker;
  }

  Future<String> beginBatch(mojom.BatchOptions opts) async {
    var v = await _proxy.ptr.dbBeginBatch(fullName, opts);
    if (isError(v.err)) throw v.err;
    return v.batchSuffix;
  }

  Future commit() async {
    var v = await _proxy.ptr.dbCommit(fullName);
    if (isError(v.err)) throw v.err;
  }

  Future abort() async {
    var v = await _proxy.ptr.dbAbort(fullName);
    if (isError(v.err)) throw v.err;
  }

  Future<mojom.Perms> getPermissions() async {
    var v = await _proxy.ptr.dbGetPermissions(fullName);
    if (isError(v.err)) throw v.err;
    // TODO(nlacasse): We need to return the version too.  Create a struct type
    // that combines perms and version?
    return v.perms;
  }

  Future setPermissions(mojom.Perms perms, String version) async {
    var v = await _proxy.ptr.dbSetPermissions(fullName, perms, version);
    if (isError(v.err)) throw v.err;
  }
}

class ExecStreamImpl implements mojom.ExecStream {
  final StreamController<mojom.Result> sc;
  ExecStreamImpl._fromStreamController(this.sc);

  onResult(mojom.Result result) {
    sc.add(result);
  }

  // Called by the mojo proxy when the Go function call returns.
  onReturn(mojom.Error err) {
    if (isError(err)) {
      sc.addError(err);
    }
    sc.close();
  }
}

class WatchGlobStreamImpl extends Object with StreamFlowControl
    implements mojom.WatchGlobStream {
  final StreamController<mojom.WatchChange> sc;

  WatchGlobStreamImpl._fromStreamController(this.sc) {
    setupFlowControl(this.sc);
  }

  Future<mojom.WatchGlobStreamOnChangeResponseParams> onChange(
      mojom.WatchChange change, Function resultFactory) {

    // Testing instrumentations for testing flow control.
    if (testing.isTesting) {
      testing.DatabaseWatch.onChangeCounter.increment();
    }

    sc.add(change);

    // Only ack after we get unlocked.
    // If we are not locked, onNextUnlock completes immediately.
    var ack = onNextUnlock().then((_) {

      // Send an ack back to server.
      return new Future.value(resultFactory(true));
    });
    return ack;
  }

  // Called by the mojo proxy when the Go function call returns.
  // Watch technically never returns unless there is an error.
  onError(mojom.Error err) {
    if (isError(err)) {
      sc.addError(err);
    }
    sc.close();
  }
}
