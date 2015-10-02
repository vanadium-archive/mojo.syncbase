// Copyright 2015 The Vanadium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of syncbase_client;

class SyncbaseRow extends NamedResource {
  final String key;

  SyncbaseRow._internal(_proxy, _parentFullName, key)
      : super._internal(_proxy, _parentFullName, key,
          naming.join(_parentFullName, escape(key))),
        this.key = key;

  Future<bool> exists() async {
    var v = await _proxy.ptr.rowExists(fullName);
    if (isError(v.err)) throw v.err;
    return v.exists;
  }

  Future<List<int>> get() async {
    var v = await _proxy.ptr.rowGet(fullName);
    if (isError(v.err)) throw v.err;
    return v.value;
  }

  Future put(List<int> value) async {
    var v = await _proxy.ptr.rowPut(fullName, value);
    if (isError(v.err)) throw v.err;
  }

  Future delete() async {
    var v = await _proxy.ptr.rowDelete(fullName);
    if (isError(v.err)) throw v.err;
  }
}
