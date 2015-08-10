part of syncbase_client;

class SyncbaseSyncGroup {
  final String name;
  final String _dbName;
  final mojom.SyncbaseProxy _proxy;

  SyncbaseSyncGroup._internal(this._proxy, this._dbName, this.name);

  Future create(
      mojom.SyncGroupSpec spec, mojom.SyncGroupMemberInfo myInfo) async {
    var v = await _proxy.ptr.dbCreateSyncGroup(_dbName, name, spec, myInfo);
    if (isError(v.err)) throw v.err;
    return;
  }

  Future join(mojom.SyncGroupMemberInfo myInfo) async {
    var v = await _proxy.ptr.dbJoinSyncGroup(_dbName, name, myInfo);
    if (isError(v.err)) throw v.err;
    return;
  }

  Future leave() async {
    var v = await _proxy.ptr.dbLeaveSyncGroup(_dbName, name);
    if (isError(v.err)) throw v.err;
    return;
  }

  Future destroy() async {
    var v = await _proxy.ptr.dbDestroySyncGroup(_dbName, name);
    if (isError(v.err)) throw v.err;
    return;
  }

  Future eject(String memberName) async {
    var v = await _proxy.ptr.dbEjectFromSyncGroup(_dbName, name, memberName);
    if (isError(v.err)) throw v.err;
    return;
  }

  Future<mojom.SyncGroupSpec> getSpec() async {
    var v = await _proxy.ptr.dbGetSyncGroupSpec(_dbName, name);
    if (isError(v.err)) throw v.err;

    // TODO(nlacasse): We need to return the version too.  Create a struct type
    // that combines spec and version?
    return v.spec;
  }

  Future setSpec(mojom.SyncGroupSpec spec, String version) async {
    var v = await _proxy.ptr.dbSetSyncGroupSpec(_dbName, name, spec, version);
    if (isError(v.err)) throw v.err;
    return;
  }

  Future<Map<String, mojom.SyncGroupMemberInfo>> getMembers() async {
    var v = await _proxy.ptr.dbGetSyncGroupMembers(_dbName, name);
    if (isError(v.err)) throw v.err;
    return v.infos;
  }
}
