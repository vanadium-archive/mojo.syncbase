// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library echo_mojom;

import 'dart:async';

import 'package:mojo/bindings.dart' as bindings;
import 'package:mojo/core.dart' as core;


class EchoEchoStringParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  String value = null;

  EchoEchoStringParams() : super(kVersions.last.size);

  static EchoEchoStringParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static EchoEchoStringParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    EchoEchoStringParams result = new EchoEchoStringParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      result.value = decoder0.decodeString(8, true);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(value, 8, true);
  }

  String toString() {
    return "EchoEchoStringParams("
           "value: $value" ")";
  }
}

class EchoEchoStringResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  String value = null;

  EchoEchoStringResponseParams() : super(kVersions.last.size);

  static EchoEchoStringResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static EchoEchoStringResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    EchoEchoStringResponseParams result = new EchoEchoStringResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      result.value = decoder0.decodeString(8, true);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(value, 8, true);
  }

  String toString() {
    return "EchoEchoStringResponseParams("
           "value: $value" ")";
  }
}

const int kEcho_echoString_name = 0;

const String EchoName =
      'mojo::examples::Echo';

abstract class Echo {
  Future<EchoEchoStringResponseParams> echoString(String value,[Function responseFactory = null]);

}


class EchoProxyImpl extends bindings.Proxy {
  EchoProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  EchoProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  EchoProxyImpl.unbound() : super.unbound();

  static EchoProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For EchoProxyImpl"));
    return new EchoProxyImpl.fromEndpoint(endpoint);
  }

  String get name => EchoName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kEcho_echoString_name:
        var r = EchoEchoStringResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          throw 'Message had unknown request Id: ${message.header.requestId}';
        }
        completerMap.remove(message.header.requestId);
        assert(!c.isCompleted);
        c.complete(r);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }

  String toString() {
    var superString = super.toString();
    return "EchoProxyImpl($superString)";
  }
}


class _EchoProxyCalls implements Echo {
  EchoProxyImpl _proxyImpl;

  _EchoProxyCalls(this._proxyImpl);
    Future<EchoEchoStringResponseParams> echoString(String value,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new EchoEchoStringParams();
      params.value = value;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kEcho_echoString_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
}


class EchoProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  Echo ptr;
  final String name = EchoName;

  EchoProxy(EchoProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _EchoProxyCalls(proxyImpl);

  EchoProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new EchoProxyImpl.fromEndpoint(endpoint) {
    ptr = new _EchoProxyCalls(impl);
  }

  EchoProxy.fromHandle(core.MojoHandle handle) :
      impl = new EchoProxyImpl.fromHandle(handle) {
    ptr = new _EchoProxyCalls(impl);
  }

  EchoProxy.unbound() :
      impl = new EchoProxyImpl.unbound() {
    ptr = new _EchoProxyCalls(impl);
  }

  static EchoProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For EchoProxy"));
    return new EchoProxy.fromEndpoint(endpoint);
  }

  Future close({bool immediate: false}) => impl.close(immediate: immediate);

  int get version => impl.version;

  Future<int> queryVersion() => impl.queryVersion();

  void requireVersion(int requiredVersion) {
    impl.requireVersion(requiredVersion);
  }

  String toString() {
    return "EchoProxy($impl)";
  }
}


class EchoStub extends bindings.Stub {
  Echo _impl = null;

  EchoStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [this._impl])
      : super.fromEndpoint(endpoint);

  EchoStub.fromHandle(core.MojoHandle handle, [this._impl])
      : super.fromHandle(handle);

  EchoStub.unbound() : super.unbound();

  static EchoStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For EchoStub"));
    return new EchoStub.fromEndpoint(endpoint);
  }

  static const String name = EchoName;


  EchoEchoStringResponseParams _EchoEchoStringResponseParamsFactory(String value) {
    var result = new EchoEchoStringResponseParams();
    result.value = value;
    return result;
  }

  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    if (bindings.ControlMessageHandler.isControlMessage(message)) {
      return bindings.ControlMessageHandler.handleMessage(this,
                                                          0,
                                                          message);
    }
    assert(_impl != null);
    switch (message.header.type) {
      case kEcho_echoString_name:
        var params = EchoEchoStringParams.deserialize(
            message.payload);
        return _impl.echoString(params.value,_EchoEchoStringResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kEcho_echoString_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  Echo get impl => _impl;
  set impl(Echo d) {
    assert(_impl == null);
    _impl = d;
  }

  String toString() {
    var superString = super.toString();
    return "EchoStub($superString)";
  }

  int get version => 0;
}


