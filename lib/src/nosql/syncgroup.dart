// Copyright 2015 The Vanadium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of syncbase_client;

class SyncbaseSyncgroup {
  final String name;
  final String _dbName;
  final ClientContext _ctx;

  SyncbaseSyncgroup._internal(this._ctx, this._dbName, this.name);

  Future create(
      mojom.SyncgroupSpec spec, mojom.SyncgroupMemberInfo myInfo) async {
    var v = await _ctx.syncbase.dbCreateSyncgroup(_dbName, name, spec, myInfo);
    if (isError(v.err)) throw v.err;
  }

  Future join(mojom.SyncgroupMemberInfo myInfo) async {
    var v = await _ctx.syncbase.dbJoinSyncgroup(_dbName, name, myInfo);
    if (isError(v.err)) throw v.err;
  }

  Future leave() async {
    var v = await _ctx.syncbase.dbLeaveSyncgroup(_dbName, name);
    if (isError(v.err)) throw v.err;
  }

  Future destroy() async {
    var v = await _ctx.syncbase.dbDestroySyncgroup(_dbName, name);
    if (isError(v.err)) throw v.err;
  }

  Future eject(String memberName) async {
    var v = await _ctx.syncbase.dbEjectFromSyncgroup(_dbName, name, memberName);
    if (isError(v.err)) throw v.err;
  }

  Future<mojom.SyncgroupSpec> getSpec() async {
    var v = await _ctx.syncbase.dbGetSyncgroupSpec(_dbName, name);
    if (isError(v.err)) throw v.err;
    // TODO(nlacasse): We need to return the version too.  Create a struct type
    // that combines spec and version?
    return v.spec;
  }

  Future setSpec(mojom.SyncgroupSpec spec, String version) async {
    var v =
        await _ctx.syncbase.dbSetSyncgroupSpec(_dbName, name, spec, version);
    if (isError(v.err)) throw v.err;
  }

  Future<Map<String, mojom.SyncgroupMemberInfo>> getMembers() async {
    var v = await _ctx.syncbase.dbGetSyncgroupMembers(_dbName, name);
    if (isError(v.err)) throw v.err;
    return v.infos;
  }
}
