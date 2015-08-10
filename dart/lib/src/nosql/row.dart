part of syncbase_client;

class SyncbaseRow extends NamedResource {
  SyncbaseRow._internal(_proxy, _parentFullName, relativeName)
      : super._internal(_proxy, _parentFullName, relativeName);

  Future<bool> exists() async {
    var v = await _proxy.ptr.rowExists(fullName);
    if (isError(v.err)) throw v.err;
    return v.exists;
  }

  Future<Uint8List> get() async {
    var v = await _proxy.ptr.rowGet(fullName);
    if (isError(v.err)) throw v.err;
    return v.value;
  }

  Future put(Uint8List value) async {
    var v = await _proxy.ptr.rowPut(fullName, value);
    if (isError(v.err)) throw v.err;
    return;
  }

  Future delete() async {
    var v = await _proxy.ptr.rowDelete(fullName);
    if (isError(v.err)) throw v.err;
    return;
  }
}
