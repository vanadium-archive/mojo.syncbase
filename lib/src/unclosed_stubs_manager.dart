// Copyright 2015 The Vanadium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of syncbase_client;

// UnclosedStubsManager is used to track Mojo stubs to close when the Syncbase
// client is closed.
class UnclosedStubsManager {
  List _stubs = [];

  UnclosedStubsManager._internal();

  register(stub) {
    _stubs.add(stub);
  }

  close(stub) {
    bool exists = _stubs.remove(stub);
    if (!exists) {
      throw new ArgumentError.value(stub, 'stub',
          'Stub has not been registered, or has already been closed.');
    }
    stub.close();
  }

  Future closeAll({immediate: false}) {
    return Future.wait(_stubs.map((s) => s.close(immediate: immediate)));
  }
}
