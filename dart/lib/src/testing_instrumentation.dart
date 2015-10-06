// Copyright 2015 The Vanadium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// This library facilitates communication between implementation and test code.
// This avoids the need for a complex dependency injection setup just to test
// specific bits of implementation.
library testing_instrumentation;

// Set to true by test runner; implementation should check this variable before
// touching other state in this module.
bool isTesting = false;

// Testing instrumentation for database watch implementation.
abstract class DatabaseWatch {
  // Allows database watch implementation to communicate how many changes
  // it has received from the server.
  static Counter onChangeCounter = new Counter._internal();
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
