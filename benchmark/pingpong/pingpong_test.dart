// Copyright 2016 The Vanadium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library pingpong_test;

import 'dart:async';
import 'dart:convert' show UTF8;
import 'dart:math' as math;

import 'package:syncbase/syncbase_client.dart' as sc;

const String mtName = '/ns.dev.v.io:8101/tmp/benchmark/pingpong';
const String appName = 'app';
const String dbName = 'db';
const String tbName = 'tb';
const String syncPrefix = 'prefix';
const String sgSuffix = 'sg';
const String syncTimeSuffix = 'synctime';

const String openPermsJson =
    '{"Admin":{"In":["..."]},"Write":{"In":["..."]},"Read":{"In":["..."]},"Resolve":{"In":["..."]},"Debug":{"In":["..."]}}';
sc.Perms openPerms = sc.SyncbaseClient.perms(openPermsJson);

enum PingPongPattern {
  pingPong, // The Creator and first Joiner ping pong with each other.
  roundRobin, // Creator pings each peer in turn.
  reverseRobin, // Creator pings each peer in turn in reverse order.
  cycle, // Every peer pings the next peer in line.
  reverseCycle, // Every peer pings the previous peer in line.
  pingRandom, // Peers randomly select who to ping next.
  pingCreator, // The Creator ping pongs with all peers simultaneously.
  pingAll, // All peers ping pong with all other peers simultaneously.
}

PingPongPattern parsePattern(String pattern) {
  switch (pattern) {
    case 'PingPong':
      return PingPongPattern.pingPong;
    case 'RoundRobin':
      return PingPongPattern.roundRobin;
    case 'ReverseRobin':
      return PingPongPattern.reverseRobin;
    case 'Cycle':
      return PingPongPattern.cycle;
    case 'ReverseCycle':
      return PingPongPattern.reverseCycle;
    case 'PingRandom':
      return PingPongPattern.pingRandom;
    case 'PingCreator':
      return PingPongPattern.pingCreator;
    case 'PingAll':
      return PingPongPattern.pingAll;
    default:
      assert(false);
      return null;
  }
}

// The Ping Pong Benchmark will run with a different configuration depending on
// the arguments given. The results will be printed to stdout.
Future runPingPongTest(List<String> args, sc.SyncbaseClient c) async {
  // TODO(alexfandrianto): There are a variety of extra conditions we can add.
  // For example, we can add background activity, extra syncgroups, or load.
  // We can even take down some of the peers.

  // Read args.
  // 0: handle
  // 1: testID. Unique test ID to differentiate between test runs.
  // 2: peerID. Your ID for this benchmark. 0 is the creator.
  // 3: numPeers. The number of peers participating in this benchmark.
  // 4: pattern. The way that Ping Pong will be executed.
  // 5: numTimes. The number of times we will run through the pattern.
  String testID = args[1];
  int peerID = int.parse(args[2]);
  int numPeers = int.parse(args[3]);
  PingPongPattern pattern = parsePattern(args[4]);
  int numTimes = int.parse(args[5]);

  // Set up the basics of the app, db, and table.
  sc.SyncbaseApp app = c.app(appName);
  if (!(await app.exists())) {
    await app.create(openPerms);
  }
  sc.SyncbaseDatabase db = app.noSqlDatabase(dbName);
  if (!(await db.exists())) {
    await db.create(openPerms);
  }
  sc.SyncbaseTable tb = db.table(tbName);
  if (!(await tb.exists())) {
    await tb.create(openPerms);
  }

  // Devices will find each other at this sgName.
  // Note: We can also accomplish this via discovery, but for simplicity, we
  // will use a common location on the global mount table.
  String sgName = '${mtName}/${testID}/s0/%%sync/sg';

  sc.SyncbaseSyncgroup sg = db.syncgroup(sgName);
  var syncInfo = sc.SyncbaseClient.syncgroupMemberInfo(syncPriority: 3);

  // Create the syncgroup or join it, as needed.
  // Note: It is slightly preferable to start the creator earlier than the other
  // peers in order to avoid racing join vs create.
  if (peerID == 0) {
    print('Creating Syncgroup ${sgName} as peer 0.');
    var syncSpec = sc.SyncbaseClient.syncgroupSpec(
        [sc.SyncbaseClient.syncgroupPrefix(tbName, syncPrefix)],
        description: 'test syncgroup',
        perms: openPerms,
        mountTables: [mtName]);

    // TODO(alexfandrianto): Why does this syncgroup create appear to take about
    // 1 minute before succeeding?
    // https://github.com/vanadium/issues/issues/1158
    await sg.create(syncSpec, syncInfo);
  } else {
    print('Joining Syncgroup ${sgName} as peer ${peerID}.');
    await sg.join(syncInfo);
  }

  // After entering the syncgroup, we should watch the table.
  print('Ready to time sync!');
  // TODO(alexfandrianto): We should add a now resume marker constant.
  // https://github.com/vanadium/issues/issues/1155
  Stream<sc.WatchChange> watchStream =
      db.watch(tbName, syncPrefix, UTF8.encode('now'));

  // During this phase, there will be numPeers * (numPeers - 1) watch updates.
  // Everybody will write a value to everyone else.
  Completer initialCompleter = new Completer();
  int count = 0;
  int limit = numPeers * (numPeers - 1);

  // Note: Dart only allows 1 listener for this kind of stream. Thus, we'll also
  // have a doneCompleter for the test. It is accompanied by a few extra stats
  // that will determine when the benchmark is complete.
  Completer doneCompleter = new Completer();

  // numSent tracks the number of times you've sent to a peer.
  List<int> numSent = new List<int>.filled(numPeers, 0);
  // numUpdates tracks the number of watch updates received so far.
  // Sme patterns get more updates than other patterns.
  int numUpdates = 0;

  // Prepare the watch stream's combined listener.
  // Phase 1 will involve syncing times to other devices using syncTimeSuffix.
  // Phase 2 involves the actual test where peers follow the ping pong pattern.
  watchStream.listen((sc.WatchChange wc) async {
    assert(wc.changeType == sc.WatchChangeTypes.put);
    if (doneCompleter.isCompleted) {
      return;
    }

    String key = wc.rowKey;
    String value = UTF8.decode(wc.valueBytes);
    int senderID = senderFromKey(key);
    int targetID = targetFromKey(key);
    String suffix = suffixFromKey(key);
    print(
        '${senderID} => ${targetID}. Key ${key} and Value ${new DateTime.fromMillisecondsSinceEpoch(int.parse(value))}');
    if (suffix == syncTimeSuffix) {
      count++;

      // We should make sure that this is a key that we need to care about.
      // Main Questions: Is the target me? Should I respond?
      if (targetID == peerID) {
        if (senderID < peerID) {
          await _writeTime(tb, peerID, senderID, syncTimeSuffix);
        }
      }

      // This phase completes once we receive all the watch updates.
      if (count == limit) {
        initialCompleter.complete();
      }
    } else {
      numUpdates++;

      // If enough rounds have passed, complete!
      if (_completedTimes(pattern, numPeers, numUpdates) >= numTimes) {
        doneCompleter.complete();
        return;
      }

      if (targetID == peerID) {
        // After receiving something, the patterns ensure that it is this peer's
        // turn to write next. It must find its target and the iteration number.
        int newTarget = _computeTarget(pattern, senderID, targetID, numPeers);
        int iteration =
            _computeIteration(pattern, newTarget, numSent, numUpdates);

        if (iteration > numTimes) {
          // TODO(alexfandrianto): Is abruptly stopping like this problematic?
          // We could just increase numTimes, right?
          return; // don't write again
        }
        String suffix = '${iteration}';

        numSent[newTarget]++;
        _writeTime(tb, peerID, newTarget, suffix); // do not await this
      }
    }
  });

  // Phase 1: Synchronize clocks by having everyone send data to each other.
  // Strategy: Send to those with a higher index than you.
  // Send a response to those with a lower index than you.
  for (int i = peerID + 1; i < numPeers; i++) {
    await _writeTime(tb, peerID, i, syncTimeSuffix);
  }

  await initialCompleter.future;
  print('Done with initial setup!');

  // The remaining ping pongs had better finish within 2 seconds.
  // Or else we have other problems.
  await new Future.delayed(new Duration(seconds: 2));

  // Phase 2: Initiate the ping pong pattern.
  // The creator (peer 0) will usually be the sole initiator, though this can
  // depend on the pattern selected.
  print('Initial Writes...');
  DateTime startTime = new DateTime.now();
  for (int i = 0; i < numPeers; i++) {
    if (_isInitialTarget(pattern, peerID, i, numPeers)) {
      numSent[i]++;
      _writeTime(tb, peerID, i, '0'); // do not await this
    }
  }

  await doneCompleter.future;

  // Benchmark complete! Print out the benchmark stats.
  DateTime endTime = new DateTime.now();
  print('Benchmark complete!');
  print('Peer ${peerID} started at ${startTime} and ended at ${endTime}.');
  int deltaMs = endTime.difference(startTime).inMilliseconds;
  print('Completed ${numTimes} in ${deltaMs}. Avg: ${deltaMs / numTimes}');

  // Give 2 more seconds to allow final syncs to occur...
  // If this doesn't complete in 2 seconds, we have major problems.
  await new Future.delayed(new Duration(seconds: 2));
}

bool _isInitialTarget(
    PingPongPattern pattern, int senderID, int targetID, int numPeers) {
  if (senderID == targetID) {
    return false;
  }
  switch (pattern) {
    case PingPongPattern.pingPong:
    case PingPongPattern.roundRobin:
    case PingPongPattern.cycle:
    case PingPongPattern.pingRandom: // It's hard to pick just 1 peer randomly.
      // PingRandom compromises by always picking peer 1.
      return senderID == 0 && targetID == 1;
    case PingPongPattern.reverseRobin:
    case PingPongPattern.reverseCycle:
      return senderID == 0 && targetID == numPeers - 1;
    case PingPongPattern.pingCreator:
      return senderID == 0; // send to everyone
    case PingPongPattern.pingAll:
      return senderID <
          targetID; // go for higher indexes to ensure everyone gets pinged.
    default:
      assert(false);
      return null;
  }
}

int _computeTarget(
    PingPongPattern pattern, int senderID, int targetID, int numPeers) {
  switch (pattern) {
    case PingPongPattern.pingPong:
    case PingPongPattern.pingCreator:
    case PingPongPattern.pingAll:
      return senderID; // Just Ping/Pong back.
    case PingPongPattern.roundRobin:
      if (targetID == 0) {
        // Need to Ping a new person.
        int newTarget = (senderID + 1) % numPeers;
        return newTarget == 0 ? 1 : newTarget;
      }
      return senderID; // Pong back to 0.
    case PingPongPattern.reverseRobin:
      if (targetID == 0) {
        // Need to Ping a new person.
        int newTarget = senderID - 1;
        return newTarget == 0 ? numPeers - 1 : newTarget;
      }
      return senderID; // Pong back to 0.
    case PingPongPattern.cycle:
      return (targetID + 1) % numPeers;
    case PingPongPattern.reverseCycle:
      return (targetID - 1) % numPeers;
    case PingPongPattern.pingRandom:
      int newTarget;
      while (newTarget == null || newTarget == targetID) {
        // cannot target self
        newTarget = new math.Random().nextInt(numPeers);
      }
      return newTarget;
    default:
      assert(false);
      return null;
  }
}

int _computeIteration(PingPongPattern pattern, int newTargetID,
    List<int> numSent, int numUpdates) {
  switch (pattern) {
    case PingPongPattern.pingPong:
    case PingPongPattern.roundRobin:
    case PingPongPattern.reverseRobin:
      return numUpdates ~/ 2;
    case PingPongPattern.cycle:
    case PingPongPattern.reverseCycle:
    case PingPongPattern.pingRandom:
      return numUpdates ~/ numSent.length;
    case PingPongPattern.pingCreator:
    case PingPongPattern.pingAll:
      return numSent[
          newTargetID]; // The iteration is the number of times you've sent.
    default:
      assert(false);
      return null;
  }
}

int _completedTimes(PingPongPattern pattern, int numPeers, int numUpdates) {
  switch (pattern) {
    case PingPongPattern.pingPong:
    case PingPongPattern.roundRobin:
    case PingPongPattern.reverseRobin:
      return numUpdates ~/ 2;
    case PingPongPattern.cycle:
    case PingPongPattern.reverseCycle:
    case PingPongPattern.pingRandom:
      return numUpdates ~/ numPeers;
    case PingPongPattern.pingCreator:
      return numUpdates ~/ (2 * numPeers);
    case PingPongPattern.pingAll:
      return numUpdates ~/ (numPeers * (numPeers - 1));
    default:
      assert(false);
      return null;
  }
}

int senderFromKey(String key) => int.parse(key.split('/')[1]);
int targetFromKey(String key) => int.parse(key.split('/')[2]);
String suffixFromKey(String key) => key.split('/')[3];

Future _writeTime(
    sc.SyncbaseTable tb, int peerID, int targetID, String suffix) async {
  DateTime time = new DateTime.now(); // This should be DevModeGetTime.
  String timeStr = '${time.millisecondsSinceEpoch}';
  await tb.put(_computeKey(peerID, targetID, suffix), UTF8.encode(timeStr));
}

String _computeKey(int peerID, int targetID, String suffix) {
  return '${syncPrefix}/${peerID}/${targetID}/${suffix}';
}
