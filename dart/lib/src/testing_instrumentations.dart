// Copyright 2015 The Vanadium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// This library provides some globals that can be accessed from tests and
// implementation code so they can communicate certain private states to each
// other enabling otherwise hard-to-do end-to-end tests.
// Although mocking is a preferred approach, to allow mocking of private classes
// deep in the stack, we would need to implement a full dependency injection
// solution since Dart does not allow mocking libraries and files merely based
// on import path.
library testing_instrumentations;

// To be set to true by test runner, any implementation code that needs to
// instrument for testing, must check this first.
bool isTesting = false;

// Testing instrumentations for Database Watch implementation.
abstract class DatabaseWatch {
  // Allows Database Watch implementation to communicate how many changes
  // it has received from the server.
  static _Counter onChangeCounter = new Counter._internal();
}

// A generic counter.
class Counter {
  num count = 0;
  Counter._internal();

  increment() {
    count++;
  }
  reset() {
    count = 0;
  }
}
