library syncbase_table_test;

import 'dart:convert' show UTF8;

import 'package:test/test.dart';

import 'package:ether/syncbase_client.dart' show SyncbaseClient;

import './utils.dart' as utils;

runTableTests(SyncbaseClient c) {
  test('getting a handle to a table', () {
    var app = c.app(utils.uniqueName('app'));
    var db = app.noSqlDatabase(utils.uniqueName('db'));
    var tableName = utils.uniqueName('table');
    var table = db.table(tableName);
    expect(table.relativeName, equals(tableName));
    expect(table.fullName, equals(db.fullName + '/' + tableName));
  });

  test('creating and deleting a table', () async {
    var app = c.app(utils.uniqueName('app'));
    await app.create(utils.emptyPerms());
    var db = app.noSqlDatabase(utils.uniqueName('db'));
    await db.create(utils.emptyPerms());

    var table = db.table(utils.uniqueName('table'));

    expect(await table.exists(), equals(false));
    await table.create(utils.emptyPerms());
    expect(await table.exists(), equals(true));
    await table.delete();
    expect(await table.exists(), equals(false));
  });

  test('scanning rows', () async {
    var app = c.app(utils.uniqueName('app'));
    await app.create(utils.emptyPerms());
    var db = app.noSqlDatabase(utils.uniqueName('db'));
    await db.create(utils.emptyPerms());
    var table = db.table(utils.uniqueName('table'));
    await table.create(utils.emptyPerms());

    // Put some rows.
    var rowNames = [utils.uniqueName('rowA'), utils.uniqueName('rowB')];

    for (var rowName in rowNames) {
      var row = table.row(rowName);
      await row.put(UTF8.encode(utils.uniqueName('value')));
    }

    // Scan!
    var stream = table.scan(UTF8.encode(''), UTF8.encode('z'));

    var gotRows = await stream.toList();
    expect(gotRows, hasLength(rowNames.length));
    expect(gotRows[0].key, equals(rowNames[0]));
    expect(gotRows[1].key, equals(rowNames[1]));

    // TODO(nlacasse): Write tests that check that 'start' and 'limit' are
    // working properly.
  });
}
