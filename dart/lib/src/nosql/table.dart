// Copyright 2015 The Vanadium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of syncbase_client;

class SyncbaseTable extends NamedResource {
  SyncbaseTable._internal(_proxy, _parentFullName, relativeName)
      : super._internal(_proxy, _parentFullName, relativeName,
            naming.join(_parentFullName, escape(relativeName)));

  // row returns a row with the given key.
  SyncbaseRow row(String key) {
    return new SyncbaseRow._internal(_proxy, fullName, key);
  }

  Future create(mojom.Perms perms) async {
    var v = await _proxy.ptr.tableCreate(fullName, perms);
    if (isError(v.err)) throw v.err;
  }

  Future destroy() async {
    var v = await _proxy.ptr.tableDestroy(fullName);
    if (isError(v.err)) throw v.err;
  }

  Future<bool> exists() async {
    var v = await _proxy.ptr.tableExists(fullName);
    if (isError(v.err)) throw v.err;
    return v.exists;
  }

  Future<mojom.Perms> getPermissions() async {
    var v = await _proxy.ptr.tableGetPermissions(fullName);
    if (isError(v.err)) throw v.err;
    return v.perms;
  }

  Future setPermissions(mojom.Perms perms) async {
    var v = await _proxy.ptr.tableSetPermissions(fullName, perms);
    if (isError(v.err)) throw v.err;
  }

  Future<List<int>> get(String key) async {
    return this.row(key).get();
  }

  Future put(String key, List<int> value) async {
    return this.row(key).put(value);
  }

  Future delete(String key) async {
    return this.row(key).delete();
  }

  Future deleteRange(RowRange range) async {
    var v =
        await _proxy.ptr.tableDeleteRange(fullName, range.start, range.limit);
    if (isError(v.err)) throw v.err;
  }

  Stream<mojom.KeyValue> scan(RowRange range) {
    StreamController<mojom.KeyValue> sc = new StreamController();

    mojom.ScanStreamStub stub = new mojom.ScanStreamStub.unbound();
    stub.impl = new ScanStreamImpl._fromStreamController(sc);

    // Call tableScan asynchronously.
    _proxy.ptr.tableScan(fullName, range.start, range.limit, stub).then((v) {
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

  Future<List<mojom.PrefixPerms>> getPrefixPermissions(String key) async {
    var v = await _proxy.ptr.tableGetPrefixPermissions(fullName, key);
    if (isError(v.err)) throw v.err;
    return v.permsArr;
  }

  Future setPrefixPermissions(String prefix, mojom.Perms perms) async {
    var v = await _proxy.ptr.tableSetPrefixPermissions(fullName, prefix, perms);
    if (isError(v.err)) throw v.err;
  }

  Future deletePrefixPermissions(String prefix) async {
    var v = await _proxy.ptr.tableDeletePrefixPermissions(fullName, prefix);
    if (isError(v.err)) throw v.err;
  }
}

class ScanStreamImpl extends Object
    with StreamFlowControl
    implements mojom.ScanStream {
  final StreamController<mojom.KeyValue> sc;

  ScanStreamImpl._fromStreamController(this.sc) {
    initFlowControl(this.sc);
  }

  Future onKeyValue(mojom.KeyValue keyValue, [Function newAck = null]) {
    // NOTE(aghassemi): We need to make newAck optional to match mojo's
    // define class, but newAck is always provided by mojo when called.
    if (newAck == null) {
      throw new ArgumentError('newAck can not be null');
    }

    sc.add(keyValue);

    // Only ack after we get unlocked.
    // If we are not locked, onNextUnlock returns immediately.
    return onNextUnlock().then((_) => newAck());
  }

  // Called by the mojom proxy when the Go function call returns.
  onDone(mojom.Error err) {
    if (isError(err)) {
      sc.addError(err);
    }
    sc.close();
  }
}
