// Copyright 2015 The Vanadium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of syncbase_client;

// NamedResource is a base class for Syncbase layers with names.
class NamedResource {
  final ClientContext _ctx;
  final String _parentFullName;
  final String name;
  final String fullName;

  NamedResource._internal(
      ClientContext _ctx, String _parentFullName, String name, String fullName)
      : this._ctx = _ctx,
        this._parentFullName = _parentFullName,
        this.name = name,
        this.fullName = fullName {}
}
