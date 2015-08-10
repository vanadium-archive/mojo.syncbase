part of syncbase_client;

class SyncbaseApp extends NamedResource {
  SyncbaseApp._internal(_proxy, fullName)
      : super._internal(_proxy, '', fullName);

  // noSqlDatabase returns the noSqlDatabase with the given relativeName.
  // relativeName must not contain slashes.
  SyncbaseNoSqlDatabase noSqlDatabase(String relativeName) {
    return new SyncbaseNoSqlDatabase._internal(_proxy, fullName, relativeName);
  }

  Future create(mojom.Perms perms) async {
    var v = await _proxy.ptr.appCreate(fullName, perms);
    if (isError(v.err)) throw v.err;
    return;
  }

  Future delete() async {
    var v = await _proxy.ptr.appDelete(fullName);
    if (isError(v.err)) throw v.err;
    return;
  }

  Future<bool> exists() async {
    var v = await _proxy.ptr.appExists(fullName);
    if (isError(v.err)) throw v.err;
    return v.exists;
  }

  Future<mojom.Perms> getPermissions() async {
    var v = await _proxy.ptr.appGetPermissions(fullName);
    if (isError(v.err)) throw v.err;

    // TODO(nlacasse): We need to return the version too.  Create a struct type
    // that combines perms and version?
    return v.perms;
  }

  Future setPermissions(mojom.Perms perms, String version) async {
    var v = await _proxy.ptr.appSetPermissions(fullName, perms, version);
    if (isError(v.err)) throw v.err;
    return;
  }
}
