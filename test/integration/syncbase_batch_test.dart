// Copyright 2015 The Vanadium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library syncbase_batch_test;

import 'dart:async';

import 'package:test/test.dart';

import 'package:syncbase/syncbase_client.dart';

import './utils.dart' as utils;

Future<SyncbaseDatabase> setupDatabase(SyncbaseClient c) async {
  var app = c.app(utils.uniqueName('app'));
  await app.create(utils.emptyPerms());
  var db = app.noSqlDatabase(utils.uniqueName('db'));
  await db.create(utils.emptyPerms());
  return db;
}

// TODO(sadovsky): Add more tests once we've decided which tests should exist in
// all client libraries.
runBatchTests(SyncbaseClient c) {
  test('beginBatch creates a BatchDatabase with name', () async {
    var db = await setupDatabase(c);
    var batch = await db.beginBatch(SyncbaseClient.batchOptions());
    expect(batch.name, equals(db.name));
    expect(batch.fullName, isNot(equals(db.fullName)));
  });

  test('isolation', () async {
    var db = await setupDatabase(c);
    var tableName = 'tb';
    var tb = db.table(tableName);
    await tb.create(utils.emptyPerms());

    // Table should start empty.
    expect(await utils.scan(tb, ''), equals([]));

    var batch1 = await db.beginBatch(SyncbaseClient.batchOptions());
    var btb1 = batch1.table(tableName);

    var batch2 = await db.beginBatch(SyncbaseClient.batchOptions());
    var btb2 = batch2.table(tableName);

    // Write some rows to each batch, with partial overlap.
    var batch1Kvs = [new utils.KV('a', '1'), new utils.KV('b', '1')];
    var batch2Kvs = [new utils.KV('a', '2'), new utils.KV('c', '2')];

    await utils.putMany(btb1, batch1Kvs);
    await utils.putMany(btb2, batch2Kvs);

    // Each batch should only see the rows written to it.
    expect(await utils.scan(btb1, ''), equals(batch1Kvs));
    expect(await utils.scan(btb2, ''), equals(batch2Kvs));

    // Table should still be empty since nothing has been committed.
    expect(await utils.scan(tb, ''), equals([]));

    // Commit batch1 and check that we see its rows in the non-batch table.
    await batch1.commit();
    expect(await utils.scan(tb, ''), equals(batch1Kvs));

    // batch2 should still only see the rows written to it.
    expect(await utils.scan(btb2, ''), equals(batch2Kvs));

    // Committing batch2 should fail, and the table should still only contain
    // batch1's records afterwards.
    expect(batch2.commit(), throws);
    expect(await utils.scan(tb, ''), equals(batch1Kvs));
  });
}
