// Copyright 2015 The Vanadium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of syncbase_client;

// NamedResource is the superclass of resources with names.
class NamedResource {
  final mojom.SyncbaseProxy _proxy;
  final String _parentFullName;
  final String name;
  final String fullName;

  NamedResource._internal(mojom.SyncbaseProxy _proxy, String _parentFullName,
      String name, String fullName)
      : this._proxy = _proxy,
        this._parentFullName = _parentFullName,
        this.name = name,
        this.fullName = fullName {}
}
