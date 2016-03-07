// Copyright 2015 The Vanadium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of syncbase_client;

class SyncbaseBatchDatabase extends AbstractDatabase {
  SyncbaseBatchDatabase._internal(
      _ctx, _parentFullName, relativeName, batchSuffix)
      : super._internal(_ctx, _parentFullName, relativeName, batchSuffix);

  Future commit() async {
    var v = await _ctx.syncbase.dbCommit(fullName);
    if (isError(v.err)) throw v.err;
  }

  Future abort() async {
    var v = await _ctx.syncbase.dbAbort(fullName);
    if (isError(v.err)) throw v.err;
  }
}

typedef Future RunInBatchFunction(SyncbaseBatchDatabase b);

Future runInBatch(
    SyncbaseDatabase db, mojom.BatchOptions bo, RunInBatchFunction fn) async {
  Future attempt() async {
    var b = await db.beginBatch(bo);
    try {
      await fn(b);
    } catch (err) {
      try {
        await b.abort();
      } catch (ignoredErr) {}
      throw err; // throw fn error, not abort error
    }
    if (bo.readOnly) {
      await b.abort();
    } else {
      // TODO(sadovsky): commit() can fail for a number of reasons, e.g. RPC
      // failure or ErrConcurrentTransaction. Depending on the cause of
      // failure, it may be desirable to retry the commit() and/or to call
      // abort().
      await b.commit();
    }
  }

  Future retryLoop(int i) async {
    try {
      await attempt();
    } catch (err) {
      // TODO(sadovsky): Only retry if err is ErrConcurrentTransaction.
      if (i < 2) {
        await retryLoop(i + 1);
      } else {
        throw err;
      }
    }
  }

  await retryLoop(0);
}
