// Copyright 2015 The Vanadium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library syncbase_client;

import 'dart:async';
import 'dart:convert' show UTF8;

import 'package:mojo/bindings.dart' as bindings;
import 'package:ether/src/naming/util.dart' as naming;
import 'package:ether/src/testing_instrumentation.dart' as testing;

import 'gen/dart-gen/mojom/lib/mojo/syncbase.mojom.dart' as mojom;

// Export struct types from syncbase.mojom.
export 'gen/dart-gen/mojom/lib/mojo/syncbase.mojom.dart'
    show
        BatchOptions,
        Perms,
        SyncGroupMemberInfo,
        SyncGroupPrefix,
        SyncGroupSpec,
        WatchChange;

part 'src/app.dart';
part 'src/named_resource.dart';
part 'src/stream_flow_control.dart';
part 'src/util.dart';
part 'src/nosql/database.dart';
part 'src/nosql/row.dart';
part 'src/nosql/rowrange.dart';
part 'src/nosql/syncgroup.dart';
part 'src/nosql/table.dart';
part 'src/nosql/watch_change_types.dart';

typedef void ConnectToServiceFn(String url, bindings.ProxyBase proxy);

bool isError(mojom.Error err) {
  return err != null && err.id != '';
}

// TODO(sadovsky): Add listApps method.
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

  // app returns the app with the given name.
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

  // Helper methods that wrap the generated constructors for mojom types. The
  // generated constructors take zero arguments, so they are difficult to use.

  static mojom.BatchOptions batchOptions(
      {String hint: null, bool readOnly: false}) {
    return new mojom.BatchOptions()
      ..hint = hint
      ..readOnly = readOnly;
  }

  static mojom.Perms perms([String json = '{}']) {
    return new mojom.Perms()..json = json;
  }

  static mojom.SyncGroupMemberInfo syncGroupMemberInfo({int syncPriority: 0}) {
    return new mojom.SyncGroupMemberInfo()..syncPriority = syncPriority;
  }

  // TODO(aghassemi): Here and elsewhere, make required parameters actually
  // required (rather than optional).
  static mojom.SyncGroupPrefix syncGroupPrefix(
      {String tableName, String rowPrefix}) {
    return new mojom.SyncGroupPrefix()
      ..tableName = tableName
      ..rowPrefix = rowPrefix;
  }

  static mojom.SyncGroupSpec syncGroupSpec(
      {String description: '',
      bool isPrivate: false,
      mojom.Perms perms,
      List<String> prefixes,
      List<String> mountTables}) {
    if (prefixes == null) {
      throw new ArgumentError('prefixes must be specified');
    }
    return new mojom.SyncGroupSpec()
      ..description = description
      ..isPrivate = isPrivate
      ..perms = perms ?? SyncbaseClient.perms()
      ..prefixes = prefixes
      ..mountTables = mountTables ?? [];
  }

  static mojom.WatchChange watchChange(
      {String tableName,
      String rowKey,
      List<int> valueBytes,
      List<int> resumeMarker,
      int changeType,
      bool fromSync: false,
      bool continued: false}) {
    if (tableName == null) {
      throw new ArgumentError('tableName must be specified');
    }
    if (rowKey == null) {
      throw new ArgumentError('rowKey must be specified');
    }
    if (resumeMarker == null) {
      throw new ArgumentError('resumeMarker must be specified');
    }
    if (changeType == null) {
      throw new ArgumentError('changeType must be specified');
    }
    return new mojom.WatchChange()
      ..tableName = tableName
      ..rowKey = rowKey
      ..valueBytes = valueBytes ?? []
      ..resumeMarker = resumeMarker
      ..changeType = changeType
      ..fromSync = fromSync
      ..continued = continued;
  }
}
