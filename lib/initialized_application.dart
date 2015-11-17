// Copyright 2015 The Vanadium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// TODO(sadovsky): This doesn't belong here. Find it a better home.
library initialized_application;

import 'dart:async';

import 'package:mojo/application.dart' show Application;
import 'package:mojo/core.dart' show MojoHandle;

// InitializedApplication is an Application with a future 'initialized' that is
// resolved after the 'initialize' method finishes.
class InitializedApplication extends Application {
  final Completer _initializeCompleter = new Completer();
  Future get initialized => _initializeCompleter.future;

  List<String> _args;
  List<String> get args => _args;

  InitializedApplication.fromHandle(int handle)
      : super.fromHandle(new MojoHandle(handle));

  void initialize(List<String> args, String url) {
    _args = args;
    _initializeCompleter.complete();
  }
}
