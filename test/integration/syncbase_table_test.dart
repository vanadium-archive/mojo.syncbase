// Copyright 2015 The Vanadium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library syncbase_table_test;

import 'dart:convert' show UTF8;

import 'package:test/test.dart';

import 'package:syncbase/syncbase_client.dart' show SyncbaseClient, RowRange;

import './utils.dart' as utils;

runTableTests(SyncbaseClient c) {
  test('getting a handle to a table', () {
    var app = c.app(utils.uniqueName('app'));
    var db = app.noSqlDatabase(utils.uniqueName('db'));
    var tableName = utils.uniqueName('table');
    var table = db.table(tableName);
    expect(table.name, equals(tableName));
    expect(table.fullName, equals(db.fullName + '/' + tableName));
  });

  test('creating and destroying a table', () async {
    var app = c.app(utils.uniqueName('app'));
    await app.create(utils.emptyPerms());
    var db = app.noSqlDatabase(utils.uniqueName('db'));
    await db.create(utils.emptyPerms());

    var table = db.table(utils.uniqueName('table'));

    expect(await table.exists(), equals(false));
    await table.create(utils.emptyPerms());
    expect(await table.exists(), equals(true));
    await table.destroy();
    expect(await table.exists(), equals(false));
  });

  test('putting, getting and deleting values', () async {
    var app = c.app(utils.uniqueName('app'));
    await app.create(utils.emptyPerms());
    var db = app.noSqlDatabase(utils.uniqueName('db'));
    await db.create(utils.emptyPerms());
    var table = db.table(utils.uniqueName('table'));
    await table.create(utils.emptyPerms());
    var rowKey = utils.uniqueName('row');
    var row = table.row(rowKey);

    expect(await row.exists(), equals(false));

    var value1 = UTF8.encode('foo');
    await table.put(rowKey, value1);

    expect(await row.exists(), equals(true));
    expect(await table.get(rowKey), equals(value1));

    var value2 = UTF8.encode('bar');
    await table.put(rowKey, value2);

    expect(await row.exists(), equals(true));
    expect(await table.get(rowKey), equals(value2));

    await row.delete();
    expect(await row.exists(), equals(false));
  });

  test('scanning rows', () async {
    var app = c.app(utils.uniqueName('app'));
    await app.create(utils.emptyPerms());
    var db = app.noSqlDatabase(utils.uniqueName('db'));
    await db.create(utils.emptyPerms());
    var table = db.table(utils.uniqueName('table'));
    await table.create(utils.emptyPerms());

    // Put some rows.
    var rowKeys = [
      utils.uniqueName('bar'),
      utils.uniqueName('fooA'),
      utils.uniqueName('fooB'),
    ];

    for (var rowKey in rowKeys) {
      var row = table.row(rowKey);
      await row.put(UTF8.encode(utils.uniqueName('value')));
    }

    // Scan for foo prefix only
    var range = new RowRange.prefix('foo');
    var stream = table.scan(range);

    var gotRows = await stream.toList();
    expect(gotRows, hasLength(2));
    expect(gotRows[0].key, equals(rowKeys[1]));
    expect(gotRows[1].key, equals(rowKeys[2]));

    // Scan for a single row
    range = new RowRange.singleRow(rowKeys[0]);
    stream = table.scan(range);

    gotRows = await stream.toList();
    expect(gotRows, hasLength(1));
    expect(gotRows[0].key, equals(rowKeys[0]));

    // Scan for everything
    range = new RowRange.prefix('');
    stream = table.scan(range);

    gotRows = await stream.toList();
    expect(gotRows, hasLength(3));
    expect(gotRows[0].key, equals(rowKeys[0]));
    expect(gotRows[1].key, equals(rowKeys[1]));
    expect(gotRows[2].key, equals(rowKeys[2]));
  });

  test('deleting a range of rows', () async {
    var app = c.app(utils.uniqueName('app'));
    await app.create(utils.emptyPerms());
    var db = app.noSqlDatabase(utils.uniqueName('db'));
    await db.create(utils.emptyPerms());
    var table = db.table(utils.uniqueName('table'));
    await table.create(utils.emptyPerms());

    // Put some rows.
    var rowKeys = [
      utils.uniqueName('toDeleteA'),
      utils.uniqueName('toDeleteB'),
      utils.uniqueName('notToDelete'),
    ];

    for (var rowKey in rowKeys) {
      var row = table.row(rowKey);
      await row.put(UTF8.encode(utils.uniqueName('value')));
    }

    await table.deleteRange(new RowRange.prefix('toDelete'));

    // toDeleteA and toDeleteB should not exist anymore.
    expect(await table.row(rowKeys[0]).exists(), equals(false));
    expect(await table.row(rowKeys[1]).exists(), equals(false));

    // notToDelete should still exist.
    expect(await table.row(rowKeys[2]).exists(), equals(true));
  });
}
