// Copyright 2015 The Vanadium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of syncbase_client;

// NamedResource is the superclass of resources with names.
class NamedResource {
  final String fullName;
  final String relativeName;
  final mojom.SyncbaseProxy _proxy;

  NamedResource._internal(
      mojom.SyncbaseProxy _proxy, String _parentFullName, String relativeName)
      : this._proxy = _proxy,
        this.relativeName = relativeName,
        this.fullName = (_parentFullName == null
                ? ''
                : (_parentFullName + '/\$/')) +
            relativeName {}
}
