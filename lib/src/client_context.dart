// Copyright 2015 The Vanadium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of syncbase_client;

// ClientContext holds references to objects that other layers need from the
// SyncbaseClient, e.g. the Mojo proxy and stub manager.
class ClientContext {
  // Handle to the Syncbase Mojo proxy.
  mojom.SyncbaseProxy proxy;

  // Just a convenience getter for the Mojo proxy's Syncbase pointer.
  mojom.Syncbase get syncbase => proxy.ptr;

  // Handle to the unclosed stubs manager. Used by layers that need to track
  // Mojo stubs that need to be closed when the Syncbase client is closed.
  UnclosedStubsManager unclosedStubsManager;

  ClientContext._internal(this.proxy, this.unclosedStubsManager);
}
