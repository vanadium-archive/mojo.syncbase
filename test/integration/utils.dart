// Copyright 2015 The Vanadium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library utils;

import 'dart:async';

import 'dart:convert' show UTF8;

import 'package:syncbase/syncbase_client.dart';

// Returns an empty Perms object.
Perms emptyPerms() => SyncbaseClient.perms();

// Returns the current timestamp in ms since epoch.
int timestamp() => new DateTime.now().millisecondsSinceEpoch;

int _nameCounter = timestamp();

// Returns a new unique name.
String uniqueName(String type) {
  type ??= 'unknown';
  _nameCounter++;
  return type + '_' + _nameCounter.toString();
}

class KV {
  final String k, v;
  const KV(this.k, this.v);

  // https://www.dartlang.org/docs/dart-up-and-running/ch03.html#implementing-map-keys
  int get hashCode {
    int result = 17;
    result = 37 * result + k.hashCode;
    result = 37 * result + v.hashCode;
    return result;
  }

  bool operator ==(other) {
    if (other is! KV) return false;
    KV kv = other;
    return (kv.k == k && kv.v == v);
  }
}

putMany(SyncbaseTable tb, Iterable<KV> kvs) async {
  await Future.forEach(kvs, (kv) => tb.put(kv.k, UTF8.encode(kv.v)));
}

Future<Iterable<KV>> scan(SyncbaseTable tb, String prefix) async {
  var rows = await tb.scan(new RowRange.prefix(prefix)).toList();
  return rows.map((x) => new KV(x.key, UTF8.decode(x.value)));
}
