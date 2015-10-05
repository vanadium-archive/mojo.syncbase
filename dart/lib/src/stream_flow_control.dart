// Copyright 2015 The Vanadium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of syncbase_client;

// StreamFlowControl is a mixin that exposes methods setupFlowControl() and
// onNextUnlock() to allow mixers add flow control to their stream controllers.
class StreamFlowControl {
  // We are in "locked" state if and only if _mutex is not null.
  // We are locked by default until we gain the first subscriber.
  Future _mutex = new Completer();

  // Setup flow control by adding listeners to the stream controller.
  // Mixin classes can't have constructors, so this is just a method that should
  // be called from mixer's constructor.
  setupFlowControl(StreamController sc) {
    // Unlock when gaining the first subscriber.
    sc.onListen = _unlock;
    // Lock when losing the last subscriber.
    sc.onCancel = _lock;
    // Lock when paused.
    sc.onPause = _lock;
    // Unlock when resumed.
    sc.onResume = _unlock;
  }

  // Returns a future that either completes immediately if we are not locked or
  // if we are locked, it gets completed as soon as we get unlocked.
  // Mixers can use this method to decide when to ack, telling the server to
  // continue sending events.
  Future onNextUnlock() {
    if (_mutex == null) {
      // We are not locked, return a completed future.
      return new Future.value();
    }
    return _mutex.future;
  }

  // Locks the stream controller.
  // When locked, server does not sent us change events anymore until we unlock.
  // This happens because we don't send back an ack to the server when locked.
  _lock() {
    if (_mutex == null) {
      _mutex = new Completer();
    }
  }

  // Unlcoks the stream controller.
  // When unlocked, server can send up more change events.
  // This happens because we send back an ack to the server when unlocked after
  // every change we receive instructing the server to send more.
  _unlock() {
    if (_mutex != null) {
      _mutex.complete();
      _mutex = null;
    }
  }
}
