library syncbase_table_test;

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
}
