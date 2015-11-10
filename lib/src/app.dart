// Copyright 2015 The Vanadium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of syncbase_client;

class SyncbaseApp extends NamedResource {
  // NOTE(sadovsky): For the Mojo Syncbase service, we only store names from app
  // down - i.e. there is no service name.
  SyncbaseApp._internal(_ctx, relativeName)
      : super._internal(_ctx, null, relativeName, escape(relativeName));

  // noSqlDatabase returns a noSqlDatabase with the given relativeName.
  SyncbaseNoSqlDatabase noSqlDatabase(String relativeName) {
    return new SyncbaseNoSqlDatabase._internal(
        _ctx, fullName, relativeName, '');
  }

  Future create(mojom.Perms perms) async {
    var v = await _ctx.syncbase.appCreate(fullName, perms);
    if (isError(v.err)) throw v.err;
  }

  Future destroy() async {
    var v = await _ctx.syncbase.appDestroy(fullName);
    if (isError(v.err)) throw v.err;
  }

  Future<bool> exists() async {
    var v = await _ctx.syncbase.appExists(fullName);
    if (isError(v.err)) throw v.err;
    return v.exists;
  }

  Future<mojom.Perms> getPermissions() async {
    var v = await _ctx.syncbase.appGetPermissions(fullName);
    if (isError(v.err)) throw v.err;
    // TODO(nlacasse): We need to return the version too.  Create a struct type
    // that combines perms and version?
    return v.perms;
  }

  Future<List<String>> listDatabases() async {
    var v = await _ctx.syncbase.appListDatabases(fullName);
    if (isError(v.err)) throw v.err;
    return v.databases;
  }

  Future setPermissions(mojom.Perms perms, String version) async {
    var v = await _ctx.syncbase.appSetPermissions(fullName, perms, version);
    if (isError(v.err)) throw v.err;
  }
}
