// Copyright 2015 The Vanadium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of syncbase_client;

// ClientContext holds references to objects that other layers need from
// SyncbaseClient.
class ClientContext {
  // Handle to the Syncbase Mojo proxy.
  mojom.SyncbaseProxy proxy;

  // Convenience getter for the Mojo proxy's Syncbase pointer.
  mojom.Syncbase get syncbase => proxy.ptr;

  // Used to track Mojo stubs to close when the Syncbase client is closed.
  UnclosedStubsManager unclosedStubsManager;

  ClientContext._internal(this.proxy, this.unclosedStubsManager);
}
