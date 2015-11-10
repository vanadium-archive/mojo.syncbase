// Copyright 2015 The Vanadium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of syncbase_client;

// StreamFlowControl is a mixin that exposes methods initFlowControl() and
// onNextUnlock(), enabling mixers to add flow control to their stream
// controllers.
class StreamFlowControl {
  // We are in "locked" state if and only if _mutex is not null.
  // We start out locked, until we gain our first subscriber.
  Completer _mutex = new Completer();

  // Initializes flow control by adding listeners to the stream controller.
  // The mixer's constructor should call this method. (Mixins can't have
  // constructors.)
  initFlowControl(StreamController sc) {
    // Unlock when gaining our first subscriber.
    sc.onListen = _unlock;
    // Lock when losing our last subscriber.
    sc.onCancel = _lock;
    // Lock when paused.
    sc.onPause = _lock;
    // Unlock when resumed.
    sc.onResume = _unlock;
  }

  // Returns a future that completes immediately if we are unlocked, or as soon
  // as we become unlocked otherwise.
  // Mixers can use this method to decide when to ack, i.e. when to tell the
  // server to continue sending events.
  Future onNextUnlock() {
    if (_mutex == null) {
      // We are not locked; return a completed future.
      return new Future.value();
    }
    return _mutex.future;
  }

  // Locks the stream controller.
  // When locked, the server cannot send us any more change events.
  // This happens because we don't ack the server's change events when locked.
  _lock() {
    if (_mutex == null) {
      _mutex = new Completer();
    }
  }

  // Unlocks the stream controller.
  // When unlocked, the server can send us more change events.
  // This happens because we ack the server's change events when unlocked.
  _unlock() {
    if (_mutex != null) {
      _mutex.complete();
      _mutex = null;
    }
  }
}
