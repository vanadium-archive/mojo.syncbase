// Copyright 2015 The Vanadium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library syncbase_batch_test;

import 'dart:async';
import 'dart:convert' show UTF8;

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

  test('runInBatch', () async {
    var d = await setupDatabase(c);
    var tableName = 'tb';
    var tb = d.table(tableName);
    await tb.create(utils.emptyPerms());

    var retries = 0;
    await runInBatch(d, SyncbaseClient.batchOptions(),
        (SyncbaseBatchDatabase b) async {
      ++retries;
      // Read foo. It does not exist.
      expect(b.table(tableName).get("foo-${retries}"), throws);
      // If we need to fail, write to foo in a separate concurrent batch. This
      // is always written on every attempt.
      if (retries < 2) {
        await d.table(tableName).put("foo-${retries}", UTF8.encode('foo'));
      }
      // Write to bar.
      await b.table(tableName).put("bar-${retries}", UTF8.encode('bar'));
    });
    // First try failed, second succeeded.
    expect(retries, equals(2));
    expect(await utils.scan(tb, ''),
        equals([new utils.KV('bar-2', 'bar'), new utils.KV('foo-1', 'foo')]));
  });

  test('runInBatchReadOnly', () async {
    var d = await setupDatabase(c);
    var tableName = 'tb';
    var tb = d.table(tableName);
    await tb.create(utils.emptyPerms());

    await d.table(tableName).put("foo", UTF8.encode('foo'));
    var retries = 0;
    await runInBatch(d, SyncbaseClient.batchOptions(readOnly: true),
        (SyncbaseBatchDatabase b) async {
      ++retries;
      // Read foo.
      var before = await b.table(tableName).get("foo");
      // Write to foo in a separate concurrent batch. This is always written
      // on every iteration. It should not cause a retry since readonly
      // batches are not committed.
      await d.table(tableName).put("foo", UTF8.encode('oof'));
      // Read foo again. Batch should not see the changed value.
      expect(await b.table(tableName).get("foo"), equals(before));
      // Try writing to bar. This should fail since the batch is readonly.
      expect(b.table(tableName).put("bar", UTF8.encode('bar')), throws);
    });
    // Single uncommitted iteration.
    expect(retries, equals(1));
    expect(await utils.scan(tb, ''), equals([new utils.KV('foo', 'oof')]));
  });
}
