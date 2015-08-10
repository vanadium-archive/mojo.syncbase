part of syncbase_client;

class SyncbaseTable extends NamedResource {
  SyncbaseTable._internal(_proxy, _parentFullName, relativeName)
      : super._internal(_proxy, _parentFullName, relativeName);

  SyncbaseRow row(String key) {
    return new SyncbaseRow._internal(_proxy, fullName, key);
  }

  Future create(mojom.Perms perms) async {
    var v = await _proxy.ptr.tableCreate(fullName, perms);
    if (isError(v.err)) throw v.err;
    return;
  }

  Future delete() async {
    var v = await _proxy.ptr.tableDelete(fullName);
    if (isError(v.err)) throw v.err;
    return;
  }

  Future<bool> exists() async {
    var v = await _proxy.ptr.tableExists(fullName);
    if (isError(v.err)) throw v.err;
    return v.exists;
  }

  Future deleteRowRange(Uint8List start, Uint8List limit) async {
    var v = await _proxy.ptr.tableDeleteRowRange(fullName, start, limit);
    if (isError(v.err)) throw v.err;
    return;
  }

  Stream<mojom.KeyValue> scan(Uint8List start, Uint8List limit) {
    StreamController<mojom.KeyValue> sc = new StreamController();
    mojom.ScanStream scanStream = new ScanStreamImpl._fromStreamController(sc);

    // Call tableScan asynchronously.
    _proxy.ptr.tableScan(fullName, start, limit, scanStream).then((v) {
      // TODO(nlacasse): Is throwing the correct behavior here?  Consider
      // returning a tuple (Stream<mojom.KeyValue>, Future) and resolve the
      // Future at the end of the RPC (with an error if applicable).  Then
      // errors will be handled the same in this method as in all the other
      // methods that return Futures.  (Even though the other methods seem to
      // "throw", they are actually resolving a Future since the function is
      // declared with "async".)
      if (isError(v.err)) throw v.err;
    });

    return sc.stream;
  }

  Future<List<mojom.PrefixPerms>> getPermissions(String key) async {
    var v = await _proxy.ptr.tableGetPermissions(fullName, key);
    if (isError(v.err)) throw v.err;
    return v.permsArr;
  }

  Future setPermissions(String prefix, mojom.Perms perms) async {
    var v = await _proxy.ptr.tableSetPermissions(fullName, prefix, perms);
    if (isError(v.err)) throw v.err;
    return;
  }

  Future deletePermissions(String prefix) async {
    var v = await _proxy.ptr.tableDeletePermissions(fullName, prefix);
    if (isError(v.err)) throw v.err;
    return;
  }
}

class ScanStreamImpl implements mojom.ScanStream {
  final StreamController<mojom.KeyValue> sc;
  ScanStreamImpl._fromStreamController(this.sc);

  onKeyValue(mojom.KeyValue keyValue) {
    sc.add(keyValue);
  }

  onDone(Error err) {
    if (isError(err)) {
      sc.addError(err);
    }
    sc.close();
  }
}
