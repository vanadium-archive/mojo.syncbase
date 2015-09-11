// Copyright 2015 The Vanadium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library syncbase_client;

import 'dart:async';
import 'dart:convert' show UTF8;

import 'package:mojo/bindings.dart' as bindings;

import 'gen/dart-gen/mojom/lib/mojo/syncbase.mojom.dart' as mojom;

// Export struct types from syncbase.mojom.
// TODO(nlacasse): Create wrapper around Perms, and possibly other struct
// constructors, since the default constructors are not user-friendly.  They
// take zero arguments, so all fields must be populated with assignments.
export 'gen/dart-gen/mojom/lib/mojo/syncbase.mojom.dart'
    show BatchOptions, Perms, SyncGroupMemberInfo, SyncGroupSpec;

part 'src/app.dart';
part 'src/named_resource.dart';
part 'src/nosql/database.dart';
part 'src/nosql/row.dart';
part 'src/nosql/rowrange.dart';
part 'src/nosql/syncgroup.dart';
part 'src/nosql/table.dart';

typedef void ConnectToServiceFn(String url, bindings.ProxyBase proxy);

bool isError(mojom.Error err) {
  return err != null && err.id != '';
}

class SyncbaseClient {
  final mojom.SyncbaseProxy _proxy;

  SyncbaseClient(ConnectToServiceFn cts, String url)
      : _proxy = new mojom.SyncbaseProxy.unbound() {
    print('connecting to $url');
    cts(url, _proxy);
    print('connected');
  }

  // Closes the connection to the syncbase server.
  // TODO(nlacasse): Is this necessary?
  Future close({bool immediate: false}) {
    return _proxy.close(immediate: immediate);
  }

  // app returns the app with the given name, which should not contain slashes.
  SyncbaseApp app(String name) => new SyncbaseApp._internal(_proxy, name);

  Future<mojom.Perms> getPermissions() async {
    var v = await _proxy.ptr.serviceGetPermissions();
    if (isError(v.err)) throw v.err;
    // TODO(nlacasse): We need to return the version too.  Create a struct type
    // that combines perms and version?
    return v.perms;
  }

  Future setPermissions(mojom.Perms perms, String version) async {
    var v = await _proxy.ptr.serviceSetPermissions(perms, version);
    if (isError(v.err)) throw v.err;
  }
}
