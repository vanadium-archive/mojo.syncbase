part of syncbase_client;

class SyncbaseNoSqlDatabase extends NamedResource {
  SyncbaseNoSqlDatabase._internal(_proxy, _parentFullName, relativeName)
      : super._internal(_proxy, _parentFullName, relativeName);

  // table returns a table with the given relativeName.  relativeName must not
  // contain slashes.
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

  // TODO(nlacasse): Make a BatchDatabase class similar to what we did in JS.
  Future<String> beginBatch(mojom.BatchOptions opts) async {
    var v = await _proxy.ptr.dbBeginBatch(fullName, opts);
    if (isError(v.err)) throw v.err;
    return v.batchDn;
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

  onDone(mojom.Error err) {
    if (isError(err)) {
      sc.addError(err);
    }
    sc.close();
  }
}
