// Copyright 2015 The Vanadium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of syncbase_client;

// TODO(sadovsky): Add listDatabases method.
class SyncbaseApp extends NamedResource {
  // NOTE(sadovsky): For the Mojo Syncbase service, we only store names from app
  // down - i.e. there is no service name.
  SyncbaseApp._internal(_proxy, relativeName)
      : super._internal(_proxy, null, relativeName);

  // noSqlDatabase returns a noSqlDatabase with the given relativeName.
  SyncbaseNoSqlDatabase noSqlDatabase(String relativeName) {
    return new SyncbaseNoSqlDatabase._internal(_proxy, fullName, relativeName);
  }

  Future create(mojom.Perms perms) async {
    var v = await _proxy.ptr.appCreate(fullName, perms);
    if (isError(v.err)) throw v.err;
  }

  Future destroy() async {
    var v = await _proxy.ptr.appDestroy(fullName);
    if (isError(v.err)) throw v.err;
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
  }
}
