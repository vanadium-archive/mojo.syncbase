library syncbase_client;

import 'dart:async';

import 'package:mojo/core.dart' show MojoHandle;

import 'gen/dart-gen/mojom/lib/mojo/syncbase.mojom.dart' as mojom;
import 'src/client_base.dart' show ClientBase;

class SyncbaseClient extends ClientBase {
  final mojom.SyncbaseProxy _proxy;

  SyncbaseClient(MojoHandle handle, String url) :
    _proxy = new mojom.SyncbaseProxy.unbound(),
    super(handle, url);

  Future connect() async {
    return connectWithProxy(_proxy);
  }

  // TODO(nlacasse): Test this function with working syncbase mojo service.
  Future<bool> appExists(String name) async {
    mojom.SyncbaseAppExistsResponseParams v = await _proxy.ptr.appExists(name);
    if (v.err.id != '') {
      throw v.err;
    }
    return v.exists;
  }

  // TODO(nlacasse): Implement more methods here.
}
