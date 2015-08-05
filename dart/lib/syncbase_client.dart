library syncbase_client;

import 'dart:async';
import 'dart:typed_data' show Uint8List;

import 'package:mojo/core.dart' show MojoHandle;

import 'gen/dart-gen/mojom/lib/mojo/syncbase.mojom.dart' as mojom;
import 'src/client_base.dart' show ClientBase;

// Export struct types from syncbase.mojom.
export 'gen/dart-gen/mojom/lib/mojo/syncbase.mojom.dart'
    show BatchOptions, ExecStream, Perms, ScanStream, SyncGroupMemberInfo, SyncGroupSpec;

bool isError(mojom.Error err) {
  return err != null && err.id != '';
}

class SyncbaseClient extends ClientBase {
  final mojom.SyncbaseProxy _proxy;

  // TODO(nlacasse): This should take an integer and convert to MojoHandle
  // internally.
  SyncbaseClient(MojoHandle handle, String url)
      : _proxy = new mojom.SyncbaseProxy.unbound(),
        super(handle, url);

  // TODO(nlacasse): Consider connecting lazily.
  Future connect() async {
    return connectWithProxy(_proxy);
  }

  // TODO(nlacasse): Break this SyncbaseClient class into multiple classes, one
  // for each level.

  // TODO(nlacasse): Write some tests for this interface once syncbase runs as
  // a mojo service.  Currently we rely on dartanalyzer for correctness.

  ////////////////////////////////////////
  // Service

  Future<mojom.Perms> serviceGetPermissions() async {
    mojom.SyncbaseServiceGetPermissionsResponseParams v = await _proxy.ptr.serviceGetPermissions();
    if (isError(v.err)) throw v.err;

    // TODO(nlacasse): We need to return the version too.  Create a struct type
    // that combines perms and version?
    return v.perms;
  }

  Future serviceSetPermissions(mojom.Perms perms, String version) async {
    mojom.SyncbaseServiceSetPermissionsResponseParams v = await _proxy.ptr.serviceSetPermissions(perms, version);
    if (isError(v.err)) throw v.err;
    return;
  }

  ////////////////////////////////////////
  // App

  Future appCreate(String name, mojom.Perms perms) async {
    mojom.SyncbaseAppCreateResponseParams v = await _proxy.ptr.appCreate(name, perms);
    if (isError(v.err)) throw v.err;
    return;
  }

  Future appDelete(String name) async {
    mojom.SyncbaseAppDeleteResponseParams v = await _proxy.ptr.appDelete(name);
    if (isError(v.err)) throw v.err;
    return;
  }

  Future<bool> appExists(String name) async {
    mojom.SyncbaseAppExistsResponseParams v = await _proxy.ptr.appExists(name);
    if (isError(v.err)) throw v.err;
    return v.exists;
  }

  Future<mojom.Perms> appGetPermissions(String name) async {
    mojom.SyncbaseAppGetPermissionsResponseParams v = await _proxy.ptr.appGetPermissions(name);
    if (isError(v.err)) throw v.err;

    // TODO(nlacasse): We need to return the version too.  Create a struct type
    // that combines perms and version?
    return v.perms;
  }

  Future appSetPermissions(String name, mojom.Perms perms, String version) async {
    mojom.SyncbaseAppSetPermissionsResponseParams v = await _proxy.ptr.appSetPermissions(name, perms, version);
    if (isError(v.err)) throw v.err;
    return;
  }

  ////////////////////////////////////////
  // nosql.Database

  Future dbCreate(String name, mojom.Perms perms) async {
    mojom.SyncbaseDbCreateResponseParams v = await _proxy.ptr.dbCreate(name, perms);
    if (isError(v.err)) throw v.err;
    return;
  }

  Future dbDelete(String name) async {
    mojom.SyncbaseDbDeleteResponseParams v = await _proxy.ptr.dbDelete(name);
    if (isError(v.err)) throw v.err;
    return;
  }

  Future<bool> dbExists(String name) async {
    mojom.SyncbaseDbExistsResponseParams v = await _proxy.ptr.dbExists(name);
    if (isError(v.err)) throw v.err;
    return v.exists;
  }

  Future dbExec(String name, String query, mojom.ExecStream stream) async {
    mojom.SyncbaseDbExecResponseParams v = await _proxy.ptr.dbExec(name, query, stream);
    if (isError(v.err)) throw v.err;
    return;
  }

  Future<mojom.Perms> dbGetPermissions(String name) async {
    mojom.SyncbaseDbGetPermissionsResponseParams v = await _proxy.ptr.dbGetPermissions(name);
    if (isError(v.err)) throw v.err;

    // TODO(nlacasse): We need to return the version too.  Create a struct type
    // that combines perms and version?
    return v.perms;
  }

  Future<String> dbBeginBatch(String name, mojom.BatchOptions opts) async {
    mojom.SyncbaseDbBeginBatchResponseParams v = await _proxy.ptr.dbBeginBatch(name, opts);
    if (isError(v.err)) throw v.err;
    return v.batchDn;
  }

  Future dbCommit(String name) async {
    mojom.SyncbaseDbCommitResponseParams v = await _proxy.ptr.dbCommit(name);
    if (isError(v.err)) throw v.err;
    return;
  }

  Future dbAbort(String name) async {
    mojom.SyncbaseDbAbortResponseParams v = await _proxy.ptr.dbAbort(name);
    if (isError(v.err)) throw v.err;
    return;
  }

  Future dbSetPermissions(String name, mojom.Perms perms, String version) async {
    mojom.SyncbaseDbSetPermissionsResponseParams v = await _proxy.ptr.dbSetPermissions(name, perms, version);
    if (isError(v.err)) throw v.err;
    return;
  }

  ////////////////////////////////////////
  // nosql.Database:SyncGroupManager

  Future<List<String>> dbGetSyncGroupNames(String name) async {
    mojom.SyncbaseDbGetSyncGroupNamesResponseParams v = await _proxy.ptr.dbGetSyncGroupNames(name);
    if (isError(v.err)) throw v.err;
    return v.names;
  }

  Future dbCreateSyncGroup(
      String name, String sgName, mojom.SyncGroupSpec spec, mojom.SyncGroupMemberInfo myInfo) async {
    mojom.SyncbaseDbCreateSyncGroupResponseParams v = await _proxy.ptr.dbCreateSyncGroup(name, sgName, spec, myInfo);
    if (isError(v.err)) throw v.err;
    return;
  }

  Future dbJoinSyncGroup(String name, String sgName, mojom.SyncGroupMemberInfo myInfo) async {
    mojom.SyncbaseDbJoinSyncGroupResponseParams v = await _proxy.ptr.dbJoinSyncGroup(name, sgName, myInfo);
    if (isError(v.err)) throw v.err;
    return;
  }

  Future dbLeaveSyncGroup(String name, String sgName) async {
    mojom.SyncbaseDbLeaveSyncGroupResponseParams v = await _proxy.ptr.dbLeaveSyncGroup(name, sgName);
    if (isError(v.err)) throw v.err;
    return;
  }

  Future dbDestroySyncGroup(String name, String sgName) async {
    mojom.SyncbaseDbDestroySyncGroupResponseParams v = await _proxy.ptr.dbDestroySyncGroup(name, sgName);
    if (isError(v.err)) throw v.err;
    return;
  }

  Future dbEjectFromSyncGroup(String name, String sgName, String memberName) async {
    mojom.SyncbaseDbEjectFromSyncGroupResponseParams v =
        await _proxy.ptr.dbEjectFromSyncGroup(name, sgName, memberName);
    if (isError(v.err)) throw v.err;
    return;
  }

  Future<mojom.SyncGroupSpec> dbGetSyncGroupSpec(String name, String sgName) async {
    mojom.SyncbaseDbGetSyncGroupSpecResponseParams v = await _proxy.ptr.dbGetSyncGroupSpec(name, sgName);
    if (isError(v.err)) throw v.err;

    // TODO(nlacasse): We need to return the version too.  Create a struct type
    // that combines spec and version?
    return v.spec;
  }

  Future dbSetSyncGroupSpec(String name, String sgName, mojom.SyncGroupSpec spec, String version) async {
    mojom.SyncbaseDbSetSyncGroupSpecResponseParams v = await _proxy.ptr.dbSetSyncGroupSpec(name, sgName, spec, version);
    if (isError(v.err)) throw v.err;
    return;
  }

  Future<Map<String, mojom.SyncGroupMemberInfo>> dbGetSyncGroupMembers(String name, String sgName) async {
    mojom.SyncbaseDbGetSyncGroupMembersResponseParams v = await _proxy.ptr.dbGetSyncGroupMembers(name, sgName);
    if (isError(v.err)) throw v.err;
    return v.infos;
  }

  ////////////////////////////////////////
  // nosql.Table

  Future tableCreate(String name, mojom.Perms perms) async {
    mojom.SyncbaseTableCreateResponseParams v = await _proxy.ptr.tableCreate(name, perms);
    if (isError(v.err)) throw v.err;
    return;
  }

  Future tableDelete(String name) async {
    mojom.SyncbaseTableDeleteResponseParams v = await _proxy.ptr.tableDelete(name);
    if (isError(v.err)) throw v.err;
    return;
  }

  Future<bool> tableExists(String name) async {
    mojom.SyncbaseTableExistsResponseParams v = await _proxy.ptr.tableExists(name);
    if (isError(v.err)) throw v.err;
    return v.exists;
  }

  Future tableDeleteRowRange(String name, Uint8List start, Uint8List limit) async {
    mojom.SyncbaseTableDeleteRowRangeResponseParams v = await _proxy.ptr.tableDeleteRowRange(name, start, limit);
    if (isError(v.err)) throw v.err;
    return;
  }

  Future tableScan(String name, Uint8List start, Uint8List limit, mojom.ScanStream stream) async {
    mojom.SyncbaseTableScanResponseParams v = await _proxy.ptr.tableScan(name, start, limit, stream);
    if (isError(v.err)) throw v.err;
    return;
  }

  Future<List<mojom.PrefixPerms>> tableGetPermissions(String name, String key) async {
    mojom.SyncbaseTableGetPermissionsResponseParams v = await _proxy.ptr.tableGetPermissions(name, key);
    if (isError(v.err)) throw v.err;
    return v.permsArr;
  }

  Future tableSetPermissions(String name, String prefix, mojom.Perms perms) async {
    mojom.SyncbaseTableSetPermissionsResponseParams v = await _proxy.ptr.tableSetPermissions(name, prefix, perms);
    if (isError(v.err)) throw v.err;
    return;
  }

  Future tableDeletePermissions(String name, String prefix) async {
    mojom.SyncbaseTableDeletePermissionsResponseParams v = await _proxy.ptr.tableDeletePermissions(name, prefix);
    if (isError(v.err)) throw v.err;
    return;
  }

  ////////////////////////////////////////
  // nosql.Row

  Future<bool> rowExists(String name) async {
    mojom.SyncbaseRowExistsResponseParams v = await _proxy.ptr.rowExists(name);
    if (isError(v.err)) throw v.err;
    return v.exists;
  }

  Future<Uint8List> rowGet(String name) async {
    mojom.SyncbaseRowGetResponseParams v = await _proxy.ptr.rowGet(name);
    if (isError(v.err)) throw v.err;
    return v.value;
  }

  Future rowPut(String name, Uint8List value) async {
    mojom.SyncbaseRowPutResponseParams v = await _proxy.ptr.rowPut(name, value);
    if (isError(v.err)) throw v.err;
    return;
  }

  Future rowDelete(String name) async {
    mojom.SyncbaseRowDeleteResponseParams v = await _proxy.ptr.rowDelete(name);
    if (isError(v.err)) throw v.err;
    return;
  }
}
