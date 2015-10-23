// Copyright 2015 The Vanadium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of syncbase_client;

// UnclosedStubsManager allows different layers to keep track of the Mojo stubs
// that need to be closed when the Syncbase client is closed.
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
          'Does not exist. Please ensure it is registered before calling close.');
    }
    stub.close();
  }

  Future closeAll({immediate: false}) {
    return Future.wait(_stubs.map((s) => s.close(immediate: immediate)));
  }
}
