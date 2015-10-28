// Copyright 2015 The Vanadium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library syncbase_client;

import 'dart:async';
import 'dart:convert' show UTF8;

import 'package:mojo/bindings.dart' as bindings;
import 'package:syncbase/src/naming/util.dart' as naming;
import 'package:syncbase/src/testing_instrumentation.dart' as testing;

import 'gen/dart-gen/mojom/lib/mojo/syncbase.mojom.dart' as mojom;

// Export struct types from syncbase.mojom.
export 'gen/dart-gen/mojom/lib/mojo/syncbase.mojom.dart'
    show
        BatchOptions,
        KeyValue,
        Perms,
        SyncgroupMemberInfo,
        SyncgroupPrefix,
        SyncgroupSpec,
        WatchChange;

part 'src/app.dart';
part 'src/client_context.dart';
part 'src/named_resource.dart';
part 'src/stream_flow_control.dart';
part 'src/unclosed_stubs_manager.dart';
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
  final ClientContext _ctx;

  SyncbaseClient(ConnectToServiceFn cts, String url)
      : _ctx = new ClientContext._internal(new mojom.SyncbaseProxy.unbound(),
            new UnclosedStubsManager._internal()) {
    print('connecting to $url');
    cts(url, _ctx.proxy);
    print('connected');
  }

  // Closes the connection to the syncbase server.
  Future close({bool immediate: false}) {
    return Future.wait([
      _ctx.unclosedStubsManager.closeAll(immediate: immediate),
      _ctx.proxy.close(immediate: immediate)
    ]);
  }

  // app returns the app with the given name.
  SyncbaseApp app(String name) => new SyncbaseApp._internal(_ctx, name);

  Future<mojom.Perms> getPermissions() async {
    var v = await _ctx.syncbase.serviceGetPermissions();
    if (isError(v.err)) throw v.err;
    // TODO(nlacasse): We need to return the version too.  Create a struct type
    // that combines perms and version?
    return v.perms;
  }

  Future<List<SyncbaseApp>> listApps() async {
    var v = await _ctx.syncbase.serviceListApps();
    if (isError(v.err)) throw v.err;

    return v.apps.map((appName) => this.app(appName)).toList();
  }

  Future setPermissions(mojom.Perms perms, String version) async {
    var v = await _ctx.syncbase.serviceSetPermissions(perms, version);
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

  static mojom.SyncgroupMemberInfo syncgroupMemberInfo({int syncPriority: 0}) {
    return new mojom.SyncgroupMemberInfo()..syncPriority = syncPriority;
  }

  static mojom.SyncgroupPrefix syncgroupPrefix(
      String tableName, String rowPrefix) {
    return new mojom.SyncgroupPrefix()
      ..tableName = tableName
      ..rowPrefix = rowPrefix;
  }

  static mojom.SyncgroupSpec syncgroupSpec(List<mojom.SyncgroupPrefix> prefixes,
      {String description: '',
      bool isPrivate: false,
      mojom.Perms perms: null,
      List<String> mountTables: null}) {
    if (prefixes == null) {
      throw new ArgumentError('prefixes must be specified');
    }
    return new mojom.SyncgroupSpec()
      ..description = description
      ..isPrivate = isPrivate
      ..perms = perms ?? SyncbaseClient.perms()
      ..prefixes = prefixes
      ..mountTables = mountTables ?? [];
  }

  static mojom.WatchChange watchChange(
      String tableName, String rowKey, List<int> resumeMarker, int changeType,
      {List<int> valueBytes: null,
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
