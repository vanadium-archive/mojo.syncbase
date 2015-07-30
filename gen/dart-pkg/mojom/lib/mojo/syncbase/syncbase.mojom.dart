// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library syncbase_mojom;

import 'dart:async';

import 'package:mojo/bindings.dart' as bindings;
import 'package:mojo/core.dart' as core;


class Error extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(32, 0)
  ];
  String id = null;
  int actionCode = 0;
  String msg = null;

  Error() : super(kVersions.last.size);

  static Error deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static Error decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    Error result = new Error();

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
      
      result.id = decoder0.decodeString(8, false);
    }
    if (mainDataHeader.version >= 0) {
      
      result.actionCode = decoder0.decodeUint32(16);
    }
    if (mainDataHeader.version >= 0) {
      
      result.msg = decoder0.decodeString(24, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(id, 8, false);
    
    encoder0.encodeUint32(actionCode, 16);
    
    encoder0.encodeString(msg, 24, false);
  }

  String toString() {
    return "Error("
           "id: $id" ", "
           "actionCode: $actionCode" ", "
           "msg: $msg" ")";
  }
}

class Perms extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  String json = null;

  Perms() : super(kVersions.last.size);

  static Perms deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static Perms decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    Perms result = new Perms();

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
      
      result.json = decoder0.decodeString(8, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(json, 8, false);
  }

  String toString() {
    return "Perms("
           "json: $json" ")";
  }
}

class BatchOptions extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  String hint = null;
  bool readOnly = false;

  BatchOptions() : super(kVersions.last.size);

  static BatchOptions deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static BatchOptions decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    BatchOptions result = new BatchOptions();

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
      
      result.hint = decoder0.decodeString(8, false);
    }
    if (mainDataHeader.version >= 0) {
      
      result.readOnly = decoder0.decodeBool(16, 0);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(hint, 8, false);
    
    encoder0.encodeBool(readOnly, 16, 0);
  }

  String toString() {
    return "BatchOptions("
           "hint: $hint" ", "
           "readOnly: $readOnly" ")";
  }
}

class PrefixPerms extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  String prefix = null;
  Perms perms = null;

  PrefixPerms() : super(kVersions.last.size);

  static PrefixPerms deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static PrefixPerms decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    PrefixPerms result = new PrefixPerms();

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
      
      result.prefix = decoder0.decodeString(8, false);
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(16, false);
      result.perms = Perms.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(prefix, 8, false);
    
    encoder0.encodeStruct(perms, 16, false);
  }

  String toString() {
    return "PrefixPerms("
           "prefix: $prefix" ", "
           "perms: $perms" ")";
  }
}

class SyncGroupSpec extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(48, 0)
  ];
  String description = null;
  Perms perms = null;
  List<String> prefixes = null;
  List<String> mountTables = null;
  bool isPrivate = false;

  SyncGroupSpec() : super(kVersions.last.size);

  static SyncGroupSpec deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static SyncGroupSpec decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncGroupSpec result = new SyncGroupSpec();

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
      
      result.description = decoder0.decodeString(8, false);
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(16, false);
      result.perms = Perms.decode(decoder1);
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(24, false);
      {
        var si1 = decoder1.decodeDataHeaderForPointerArray(bindings.kUnspecifiedArrayLength);
        result.prefixes = new List<String>(si1.numElements);
        for (int i1 = 0; i1 < si1.numElements; ++i1) {
          
          result.prefixes[i1] = decoder1.decodeString(bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i1, false);
        }
      }
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(32, false);
      {
        var si1 = decoder1.decodeDataHeaderForPointerArray(bindings.kUnspecifiedArrayLength);
        result.mountTables = new List<String>(si1.numElements);
        for (int i1 = 0; i1 < si1.numElements; ++i1) {
          
          result.mountTables[i1] = decoder1.decodeString(bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i1, false);
        }
      }
    }
    if (mainDataHeader.version >= 0) {
      
      result.isPrivate = decoder0.decodeBool(40, 0);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(description, 8, false);
    
    encoder0.encodeStruct(perms, 16, false);
    
    if (prefixes == null) {
      encoder0.encodeNullPointer(24, false);
    } else {
      var encoder1 = encoder0.encodePointerArray(prefixes.length, 24, bindings.kUnspecifiedArrayLength);
      for (int i0 = 0; i0 < prefixes.length; ++i0) {
        
        encoder1.encodeString(prefixes[i0], bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i0, false);
      }
    }
    
    if (mountTables == null) {
      encoder0.encodeNullPointer(32, false);
    } else {
      var encoder1 = encoder0.encodePointerArray(mountTables.length, 32, bindings.kUnspecifiedArrayLength);
      for (int i0 = 0; i0 < mountTables.length; ++i0) {
        
        encoder1.encodeString(mountTables[i0], bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i0, false);
      }
    }
    
    encoder0.encodeBool(isPrivate, 40, 0);
  }

  String toString() {
    return "SyncGroupSpec("
           "description: $description" ", "
           "perms: $perms" ", "
           "prefixes: $prefixes" ", "
           "mountTables: $mountTables" ", "
           "isPrivate: $isPrivate" ")";
  }
}

class SyncGroupMemberInfo extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  int syncPriority = 0;

  SyncGroupMemberInfo() : super(kVersions.last.size);

  static SyncGroupMemberInfo deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static SyncGroupMemberInfo decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncGroupMemberInfo result = new SyncGroupMemberInfo();

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
      
      result.syncPriority = decoder0.decodeUint8(8);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeUint8(syncPriority, 8);
  }

  String toString() {
    return "SyncGroupMemberInfo("
           "syncPriority: $syncPriority" ")";
  }
}

class SyncbaseServiceGetPermissionsParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(8, 0)
  ];

  SyncbaseServiceGetPermissionsParams() : super(kVersions.last.size);

  static SyncbaseServiceGetPermissionsParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static SyncbaseServiceGetPermissionsParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseServiceGetPermissionsParams result = new SyncbaseServiceGetPermissionsParams();

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
    return result;
  }

  void encode(bindings.Encoder encoder) {
    encoder.getStructEncoderAtOffset(kVersions.last);
  }

  String toString() {
    return "SyncbaseServiceGetPermissionsParams("")";
  }
}

class SyncbaseServiceGetPermissionsResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(32, 0)
  ];
  Error err = null;
  Perms perms = null;
  String version = null;

  SyncbaseServiceGetPermissionsResponseParams() : super(kVersions.last.size);

  static SyncbaseServiceGetPermissionsResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static SyncbaseServiceGetPermissionsResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseServiceGetPermissionsResponseParams result = new SyncbaseServiceGetPermissionsResponseParams();

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
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.err = Error.decode(decoder1);
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(16, false);
      result.perms = Perms.decode(decoder1);
    }
    if (mainDataHeader.version >= 0) {
      
      result.version = decoder0.decodeString(24, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(err, 8, false);
    
    encoder0.encodeStruct(perms, 16, false);
    
    encoder0.encodeString(version, 24, false);
  }

  String toString() {
    return "SyncbaseServiceGetPermissionsResponseParams("
           "err: $err" ", "
           "perms: $perms" ", "
           "version: $version" ")";
  }
}

class SyncbaseServiceSetPermissionsParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  Perms perms = null;
  String version = null;

  SyncbaseServiceSetPermissionsParams() : super(kVersions.last.size);

  static SyncbaseServiceSetPermissionsParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static SyncbaseServiceSetPermissionsParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseServiceSetPermissionsParams result = new SyncbaseServiceSetPermissionsParams();

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
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.perms = Perms.decode(decoder1);
    }
    if (mainDataHeader.version >= 0) {
      
      result.version = decoder0.decodeString(16, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(perms, 8, false);
    
    encoder0.encodeString(version, 16, false);
  }

  String toString() {
    return "SyncbaseServiceSetPermissionsParams("
           "perms: $perms" ", "
           "version: $version" ")";
  }
}

class SyncbaseServiceSetPermissionsResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  Error err = null;

  SyncbaseServiceSetPermissionsResponseParams() : super(kVersions.last.size);

  static SyncbaseServiceSetPermissionsResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static SyncbaseServiceSetPermissionsResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseServiceSetPermissionsResponseParams result = new SyncbaseServiceSetPermissionsResponseParams();

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
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.err = Error.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(err, 8, false);
  }

  String toString() {
    return "SyncbaseServiceSetPermissionsResponseParams("
           "err: $err" ")";
  }
}

class SyncbaseAppCreateParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  String name = null;
  Perms perms = null;

  SyncbaseAppCreateParams() : super(kVersions.last.size);

  static SyncbaseAppCreateParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static SyncbaseAppCreateParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseAppCreateParams result = new SyncbaseAppCreateParams();

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
      
      result.name = decoder0.decodeString(8, false);
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(16, false);
      result.perms = Perms.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(name, 8, false);
    
    encoder0.encodeStruct(perms, 16, false);
  }

  String toString() {
    return "SyncbaseAppCreateParams("
           "name: $name" ", "
           "perms: $perms" ")";
  }
}

class SyncbaseAppCreateResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  Error err = null;

  SyncbaseAppCreateResponseParams() : super(kVersions.last.size);

  static SyncbaseAppCreateResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static SyncbaseAppCreateResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseAppCreateResponseParams result = new SyncbaseAppCreateResponseParams();

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
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.err = Error.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(err, 8, false);
  }

  String toString() {
    return "SyncbaseAppCreateResponseParams("
           "err: $err" ")";
  }
}

class SyncbaseAppDeleteParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  String name = null;

  SyncbaseAppDeleteParams() : super(kVersions.last.size);

  static SyncbaseAppDeleteParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static SyncbaseAppDeleteParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseAppDeleteParams result = new SyncbaseAppDeleteParams();

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
      
      result.name = decoder0.decodeString(8, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(name, 8, false);
  }

  String toString() {
    return "SyncbaseAppDeleteParams("
           "name: $name" ")";
  }
}

class SyncbaseAppDeleteResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  Error err = null;

  SyncbaseAppDeleteResponseParams() : super(kVersions.last.size);

  static SyncbaseAppDeleteResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static SyncbaseAppDeleteResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseAppDeleteResponseParams result = new SyncbaseAppDeleteResponseParams();

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
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.err = Error.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(err, 8, false);
  }

  String toString() {
    return "SyncbaseAppDeleteResponseParams("
           "err: $err" ")";
  }
}

class SyncbaseAppExistsParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  String name = null;

  SyncbaseAppExistsParams() : super(kVersions.last.size);

  static SyncbaseAppExistsParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static SyncbaseAppExistsParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseAppExistsParams result = new SyncbaseAppExistsParams();

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
      
      result.name = decoder0.decodeString(8, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(name, 8, false);
  }

  String toString() {
    return "SyncbaseAppExistsParams("
           "name: $name" ")";
  }
}

class SyncbaseAppExistsResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  Error err = null;
  bool exists = false;

  SyncbaseAppExistsResponseParams() : super(kVersions.last.size);

  static SyncbaseAppExistsResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static SyncbaseAppExistsResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseAppExistsResponseParams result = new SyncbaseAppExistsResponseParams();

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
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.err = Error.decode(decoder1);
    }
    if (mainDataHeader.version >= 0) {
      
      result.exists = decoder0.decodeBool(16, 0);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(err, 8, false);
    
    encoder0.encodeBool(exists, 16, 0);
  }

  String toString() {
    return "SyncbaseAppExistsResponseParams("
           "err: $err" ", "
           "exists: $exists" ")";
  }
}

class SyncbaseAppGetPermissionsParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  String name = null;

  SyncbaseAppGetPermissionsParams() : super(kVersions.last.size);

  static SyncbaseAppGetPermissionsParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static SyncbaseAppGetPermissionsParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseAppGetPermissionsParams result = new SyncbaseAppGetPermissionsParams();

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
      
      result.name = decoder0.decodeString(8, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(name, 8, false);
  }

  String toString() {
    return "SyncbaseAppGetPermissionsParams("
           "name: $name" ")";
  }
}

class SyncbaseAppGetPermissionsResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(32, 0)
  ];
  Error err = null;
  Perms perms = null;
  String version = null;

  SyncbaseAppGetPermissionsResponseParams() : super(kVersions.last.size);

  static SyncbaseAppGetPermissionsResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static SyncbaseAppGetPermissionsResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseAppGetPermissionsResponseParams result = new SyncbaseAppGetPermissionsResponseParams();

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
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.err = Error.decode(decoder1);
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(16, false);
      result.perms = Perms.decode(decoder1);
    }
    if (mainDataHeader.version >= 0) {
      
      result.version = decoder0.decodeString(24, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(err, 8, false);
    
    encoder0.encodeStruct(perms, 16, false);
    
    encoder0.encodeString(version, 24, false);
  }

  String toString() {
    return "SyncbaseAppGetPermissionsResponseParams("
           "err: $err" ", "
           "perms: $perms" ", "
           "version: $version" ")";
  }
}

class SyncbaseAppSetPermissionsParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(32, 0)
  ];
  String name = null;
  Perms perms = null;
  String version = null;

  SyncbaseAppSetPermissionsParams() : super(kVersions.last.size);

  static SyncbaseAppSetPermissionsParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static SyncbaseAppSetPermissionsParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseAppSetPermissionsParams result = new SyncbaseAppSetPermissionsParams();

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
      
      result.name = decoder0.decodeString(8, false);
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(16, false);
      result.perms = Perms.decode(decoder1);
    }
    if (mainDataHeader.version >= 0) {
      
      result.version = decoder0.decodeString(24, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(name, 8, false);
    
    encoder0.encodeStruct(perms, 16, false);
    
    encoder0.encodeString(version, 24, false);
  }

  String toString() {
    return "SyncbaseAppSetPermissionsParams("
           "name: $name" ", "
           "perms: $perms" ", "
           "version: $version" ")";
  }
}

class SyncbaseAppSetPermissionsResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  Error err = null;

  SyncbaseAppSetPermissionsResponseParams() : super(kVersions.last.size);

  static SyncbaseAppSetPermissionsResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static SyncbaseAppSetPermissionsResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseAppSetPermissionsResponseParams result = new SyncbaseAppSetPermissionsResponseParams();

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
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.err = Error.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(err, 8, false);
  }

  String toString() {
    return "SyncbaseAppSetPermissionsResponseParams("
           "err: $err" ")";
  }
}

class SyncbaseDbCreateParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  String name = null;
  Perms perms = null;

  SyncbaseDbCreateParams() : super(kVersions.last.size);

  static SyncbaseDbCreateParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static SyncbaseDbCreateParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseDbCreateParams result = new SyncbaseDbCreateParams();

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
      
      result.name = decoder0.decodeString(8, false);
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(16, false);
      result.perms = Perms.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(name, 8, false);
    
    encoder0.encodeStruct(perms, 16, false);
  }

  String toString() {
    return "SyncbaseDbCreateParams("
           "name: $name" ", "
           "perms: $perms" ")";
  }
}

class SyncbaseDbCreateResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  Error err = null;

  SyncbaseDbCreateResponseParams() : super(kVersions.last.size);

  static SyncbaseDbCreateResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static SyncbaseDbCreateResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseDbCreateResponseParams result = new SyncbaseDbCreateResponseParams();

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
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.err = Error.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(err, 8, false);
  }

  String toString() {
    return "SyncbaseDbCreateResponseParams("
           "err: $err" ")";
  }
}

class SyncbaseDbDeleteParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  String name = null;

  SyncbaseDbDeleteParams() : super(kVersions.last.size);

  static SyncbaseDbDeleteParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static SyncbaseDbDeleteParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseDbDeleteParams result = new SyncbaseDbDeleteParams();

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
      
      result.name = decoder0.decodeString(8, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(name, 8, false);
  }

  String toString() {
    return "SyncbaseDbDeleteParams("
           "name: $name" ")";
  }
}

class SyncbaseDbDeleteResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  Error err = null;

  SyncbaseDbDeleteResponseParams() : super(kVersions.last.size);

  static SyncbaseDbDeleteResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static SyncbaseDbDeleteResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseDbDeleteResponseParams result = new SyncbaseDbDeleteResponseParams();

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
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.err = Error.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(err, 8, false);
  }

  String toString() {
    return "SyncbaseDbDeleteResponseParams("
           "err: $err" ")";
  }
}

class SyncbaseDbExistsParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  String name = null;

  SyncbaseDbExistsParams() : super(kVersions.last.size);

  static SyncbaseDbExistsParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static SyncbaseDbExistsParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseDbExistsParams result = new SyncbaseDbExistsParams();

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
      
      result.name = decoder0.decodeString(8, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(name, 8, false);
  }

  String toString() {
    return "SyncbaseDbExistsParams("
           "name: $name" ")";
  }
}

class SyncbaseDbExistsResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  Error err = null;
  bool exists = false;

  SyncbaseDbExistsResponseParams() : super(kVersions.last.size);

  static SyncbaseDbExistsResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static SyncbaseDbExistsResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseDbExistsResponseParams result = new SyncbaseDbExistsResponseParams();

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
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.err = Error.decode(decoder1);
    }
    if (mainDataHeader.version >= 0) {
      
      result.exists = decoder0.decodeBool(16, 0);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(err, 8, false);
    
    encoder0.encodeBool(exists, 16, 0);
  }

  String toString() {
    return "SyncbaseDbExistsResponseParams("
           "err: $err" ", "
           "exists: $exists" ")";
  }
}

class SyncbaseDbExecParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  String query = null;

  SyncbaseDbExecParams() : super(kVersions.last.size);

  static SyncbaseDbExecParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static SyncbaseDbExecParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseDbExecParams result = new SyncbaseDbExecParams();

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
      
      result.query = decoder0.decodeString(8, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(query, 8, false);
  }

  String toString() {
    return "SyncbaseDbExecParams("
           "query: $query" ")";
  }
}

class SyncbaseDbExecResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  Error err = null;

  SyncbaseDbExecResponseParams() : super(kVersions.last.size);

  static SyncbaseDbExecResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static SyncbaseDbExecResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseDbExecResponseParams result = new SyncbaseDbExecResponseParams();

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
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.err = Error.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(err, 8, false);
  }

  String toString() {
    return "SyncbaseDbExecResponseParams("
           "err: $err" ")";
  }
}

class SyncbaseDbBeginBatchParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  String name = null;
  BatchOptions bo = null;

  SyncbaseDbBeginBatchParams() : super(kVersions.last.size);

  static SyncbaseDbBeginBatchParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static SyncbaseDbBeginBatchParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseDbBeginBatchParams result = new SyncbaseDbBeginBatchParams();

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
      
      result.name = decoder0.decodeString(8, false);
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(16, true);
      result.bo = BatchOptions.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(name, 8, false);
    
    encoder0.encodeStruct(bo, 16, true);
  }

  String toString() {
    return "SyncbaseDbBeginBatchParams("
           "name: $name" ", "
           "bo: $bo" ")";
  }
}

class SyncbaseDbBeginBatchResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  Error err = null;
  String batchDn = null;

  SyncbaseDbBeginBatchResponseParams() : super(kVersions.last.size);

  static SyncbaseDbBeginBatchResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static SyncbaseDbBeginBatchResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseDbBeginBatchResponseParams result = new SyncbaseDbBeginBatchResponseParams();

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
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.err = Error.decode(decoder1);
    }
    if (mainDataHeader.version >= 0) {
      
      result.batchDn = decoder0.decodeString(16, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(err, 8, false);
    
    encoder0.encodeString(batchDn, 16, false);
  }

  String toString() {
    return "SyncbaseDbBeginBatchResponseParams("
           "err: $err" ", "
           "batchDn: $batchDn" ")";
  }
}

class SyncbaseDbCommitParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  String name = null;

  SyncbaseDbCommitParams() : super(kVersions.last.size);

  static SyncbaseDbCommitParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static SyncbaseDbCommitParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseDbCommitParams result = new SyncbaseDbCommitParams();

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
      
      result.name = decoder0.decodeString(8, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(name, 8, false);
  }

  String toString() {
    return "SyncbaseDbCommitParams("
           "name: $name" ")";
  }
}

class SyncbaseDbCommitResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  Error err = null;

  SyncbaseDbCommitResponseParams() : super(kVersions.last.size);

  static SyncbaseDbCommitResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static SyncbaseDbCommitResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseDbCommitResponseParams result = new SyncbaseDbCommitResponseParams();

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
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.err = Error.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(err, 8, false);
  }

  String toString() {
    return "SyncbaseDbCommitResponseParams("
           "err: $err" ")";
  }
}

class SyncbaseDbAbortParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  String name = null;

  SyncbaseDbAbortParams() : super(kVersions.last.size);

  static SyncbaseDbAbortParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static SyncbaseDbAbortParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseDbAbortParams result = new SyncbaseDbAbortParams();

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
      
      result.name = decoder0.decodeString(8, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(name, 8, false);
  }

  String toString() {
    return "SyncbaseDbAbortParams("
           "name: $name" ")";
  }
}

class SyncbaseDbAbortResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  Error err = null;

  SyncbaseDbAbortResponseParams() : super(kVersions.last.size);

  static SyncbaseDbAbortResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static SyncbaseDbAbortResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseDbAbortResponseParams result = new SyncbaseDbAbortResponseParams();

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
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.err = Error.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(err, 8, false);
  }

  String toString() {
    return "SyncbaseDbAbortResponseParams("
           "err: $err" ")";
  }
}

class SyncbaseDbGetPermissionsParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  String name = null;

  SyncbaseDbGetPermissionsParams() : super(kVersions.last.size);

  static SyncbaseDbGetPermissionsParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static SyncbaseDbGetPermissionsParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseDbGetPermissionsParams result = new SyncbaseDbGetPermissionsParams();

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
      
      result.name = decoder0.decodeString(8, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(name, 8, false);
  }

  String toString() {
    return "SyncbaseDbGetPermissionsParams("
           "name: $name" ")";
  }
}

class SyncbaseDbGetPermissionsResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(32, 0)
  ];
  Error err = null;
  Perms perms = null;
  String version = null;

  SyncbaseDbGetPermissionsResponseParams() : super(kVersions.last.size);

  static SyncbaseDbGetPermissionsResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static SyncbaseDbGetPermissionsResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseDbGetPermissionsResponseParams result = new SyncbaseDbGetPermissionsResponseParams();

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
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.err = Error.decode(decoder1);
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(16, false);
      result.perms = Perms.decode(decoder1);
    }
    if (mainDataHeader.version >= 0) {
      
      result.version = decoder0.decodeString(24, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(err, 8, false);
    
    encoder0.encodeStruct(perms, 16, false);
    
    encoder0.encodeString(version, 24, false);
  }

  String toString() {
    return "SyncbaseDbGetPermissionsResponseParams("
           "err: $err" ", "
           "perms: $perms" ", "
           "version: $version" ")";
  }
}

class SyncbaseDbSetPermissionsParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(32, 0)
  ];
  String name = null;
  Perms perms = null;
  String version = null;

  SyncbaseDbSetPermissionsParams() : super(kVersions.last.size);

  static SyncbaseDbSetPermissionsParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static SyncbaseDbSetPermissionsParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseDbSetPermissionsParams result = new SyncbaseDbSetPermissionsParams();

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
      
      result.name = decoder0.decodeString(8, false);
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(16, false);
      result.perms = Perms.decode(decoder1);
    }
    if (mainDataHeader.version >= 0) {
      
      result.version = decoder0.decodeString(24, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(name, 8, false);
    
    encoder0.encodeStruct(perms, 16, false);
    
    encoder0.encodeString(version, 24, false);
  }

  String toString() {
    return "SyncbaseDbSetPermissionsParams("
           "name: $name" ", "
           "perms: $perms" ", "
           "version: $version" ")";
  }
}

class SyncbaseDbSetPermissionsResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  Error err = null;

  SyncbaseDbSetPermissionsResponseParams() : super(kVersions.last.size);

  static SyncbaseDbSetPermissionsResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static SyncbaseDbSetPermissionsResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseDbSetPermissionsResponseParams result = new SyncbaseDbSetPermissionsResponseParams();

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
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.err = Error.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(err, 8, false);
  }

  String toString() {
    return "SyncbaseDbSetPermissionsResponseParams("
           "err: $err" ")";
  }
}

class SyncbaseDbGetSyncGroupNamesParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  String name = null;

  SyncbaseDbGetSyncGroupNamesParams() : super(kVersions.last.size);

  static SyncbaseDbGetSyncGroupNamesParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static SyncbaseDbGetSyncGroupNamesParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseDbGetSyncGroupNamesParams result = new SyncbaseDbGetSyncGroupNamesParams();

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
      
      result.name = decoder0.decodeString(8, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(name, 8, false);
  }

  String toString() {
    return "SyncbaseDbGetSyncGroupNamesParams("
           "name: $name" ")";
  }
}

class SyncbaseDbGetSyncGroupNamesResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  Error err = null;
  List<String> names = null;

  SyncbaseDbGetSyncGroupNamesResponseParams() : super(kVersions.last.size);

  static SyncbaseDbGetSyncGroupNamesResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static SyncbaseDbGetSyncGroupNamesResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseDbGetSyncGroupNamesResponseParams result = new SyncbaseDbGetSyncGroupNamesResponseParams();

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
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.err = Error.decode(decoder1);
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(16, false);
      {
        var si1 = decoder1.decodeDataHeaderForPointerArray(bindings.kUnspecifiedArrayLength);
        result.names = new List<String>(si1.numElements);
        for (int i1 = 0; i1 < si1.numElements; ++i1) {
          
          result.names[i1] = decoder1.decodeString(bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i1, false);
        }
      }
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(err, 8, false);
    
    if (names == null) {
      encoder0.encodeNullPointer(16, false);
    } else {
      var encoder1 = encoder0.encodePointerArray(names.length, 16, bindings.kUnspecifiedArrayLength);
      for (int i0 = 0; i0 < names.length; ++i0) {
        
        encoder1.encodeString(names[i0], bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i0, false);
      }
    }
  }

  String toString() {
    return "SyncbaseDbGetSyncGroupNamesResponseParams("
           "err: $err" ", "
           "names: $names" ")";
  }
}

class SyncbaseDbCreateSyncGroupParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(40, 0)
  ];
  String name = null;
  String sgName = null;
  SyncGroupSpec spec = null;
  SyncGroupMemberInfo myInfo = null;

  SyncbaseDbCreateSyncGroupParams() : super(kVersions.last.size);

  static SyncbaseDbCreateSyncGroupParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static SyncbaseDbCreateSyncGroupParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseDbCreateSyncGroupParams result = new SyncbaseDbCreateSyncGroupParams();

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
      
      result.name = decoder0.decodeString(8, false);
    }
    if (mainDataHeader.version >= 0) {
      
      result.sgName = decoder0.decodeString(16, false);
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(24, false);
      result.spec = SyncGroupSpec.decode(decoder1);
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(32, false);
      result.myInfo = SyncGroupMemberInfo.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(name, 8, false);
    
    encoder0.encodeString(sgName, 16, false);
    
    encoder0.encodeStruct(spec, 24, false);
    
    encoder0.encodeStruct(myInfo, 32, false);
  }

  String toString() {
    return "SyncbaseDbCreateSyncGroupParams("
           "name: $name" ", "
           "sgName: $sgName" ", "
           "spec: $spec" ", "
           "myInfo: $myInfo" ")";
  }
}

class SyncbaseDbCreateSyncGroupResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  Error err = null;

  SyncbaseDbCreateSyncGroupResponseParams() : super(kVersions.last.size);

  static SyncbaseDbCreateSyncGroupResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static SyncbaseDbCreateSyncGroupResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseDbCreateSyncGroupResponseParams result = new SyncbaseDbCreateSyncGroupResponseParams();

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
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.err = Error.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(err, 8, false);
  }

  String toString() {
    return "SyncbaseDbCreateSyncGroupResponseParams("
           "err: $err" ")";
  }
}

class SyncbaseDbJoinSyncGroupParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(32, 0)
  ];
  String name = null;
  String sgName = null;
  SyncGroupMemberInfo myInfo = null;

  SyncbaseDbJoinSyncGroupParams() : super(kVersions.last.size);

  static SyncbaseDbJoinSyncGroupParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static SyncbaseDbJoinSyncGroupParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseDbJoinSyncGroupParams result = new SyncbaseDbJoinSyncGroupParams();

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
      
      result.name = decoder0.decodeString(8, false);
    }
    if (mainDataHeader.version >= 0) {
      
      result.sgName = decoder0.decodeString(16, false);
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(24, false);
      result.myInfo = SyncGroupMemberInfo.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(name, 8, false);
    
    encoder0.encodeString(sgName, 16, false);
    
    encoder0.encodeStruct(myInfo, 24, false);
  }

  String toString() {
    return "SyncbaseDbJoinSyncGroupParams("
           "name: $name" ", "
           "sgName: $sgName" ", "
           "myInfo: $myInfo" ")";
  }
}

class SyncbaseDbJoinSyncGroupResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  Error err = null;

  SyncbaseDbJoinSyncGroupResponseParams() : super(kVersions.last.size);

  static SyncbaseDbJoinSyncGroupResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static SyncbaseDbJoinSyncGroupResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseDbJoinSyncGroupResponseParams result = new SyncbaseDbJoinSyncGroupResponseParams();

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
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.err = Error.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(err, 8, false);
  }

  String toString() {
    return "SyncbaseDbJoinSyncGroupResponseParams("
           "err: $err" ")";
  }
}

class SyncbaseDbLeaveSyncGroupParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  String name = null;
  String sgName = null;

  SyncbaseDbLeaveSyncGroupParams() : super(kVersions.last.size);

  static SyncbaseDbLeaveSyncGroupParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static SyncbaseDbLeaveSyncGroupParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseDbLeaveSyncGroupParams result = new SyncbaseDbLeaveSyncGroupParams();

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
      
      result.name = decoder0.decodeString(8, false);
    }
    if (mainDataHeader.version >= 0) {
      
      result.sgName = decoder0.decodeString(16, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(name, 8, false);
    
    encoder0.encodeString(sgName, 16, false);
  }

  String toString() {
    return "SyncbaseDbLeaveSyncGroupParams("
           "name: $name" ", "
           "sgName: $sgName" ")";
  }
}

class SyncbaseDbLeaveSyncGroupResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  Error err = null;

  SyncbaseDbLeaveSyncGroupResponseParams() : super(kVersions.last.size);

  static SyncbaseDbLeaveSyncGroupResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static SyncbaseDbLeaveSyncGroupResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseDbLeaveSyncGroupResponseParams result = new SyncbaseDbLeaveSyncGroupResponseParams();

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
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.err = Error.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(err, 8, false);
  }

  String toString() {
    return "SyncbaseDbLeaveSyncGroupResponseParams("
           "err: $err" ")";
  }
}

class SyncbaseDbDestroySyncGroupParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  String name = null;
  String sgName = null;

  SyncbaseDbDestroySyncGroupParams() : super(kVersions.last.size);

  static SyncbaseDbDestroySyncGroupParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static SyncbaseDbDestroySyncGroupParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseDbDestroySyncGroupParams result = new SyncbaseDbDestroySyncGroupParams();

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
      
      result.name = decoder0.decodeString(8, false);
    }
    if (mainDataHeader.version >= 0) {
      
      result.sgName = decoder0.decodeString(16, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(name, 8, false);
    
    encoder0.encodeString(sgName, 16, false);
  }

  String toString() {
    return "SyncbaseDbDestroySyncGroupParams("
           "name: $name" ", "
           "sgName: $sgName" ")";
  }
}

class SyncbaseDbDestroySyncGroupResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  Error err = null;

  SyncbaseDbDestroySyncGroupResponseParams() : super(kVersions.last.size);

  static SyncbaseDbDestroySyncGroupResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static SyncbaseDbDestroySyncGroupResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseDbDestroySyncGroupResponseParams result = new SyncbaseDbDestroySyncGroupResponseParams();

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
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.err = Error.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(err, 8, false);
  }

  String toString() {
    return "SyncbaseDbDestroySyncGroupResponseParams("
           "err: $err" ")";
  }
}

class SyncbaseDbEjectFromSyncGroupParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(32, 0)
  ];
  String name = null;
  String sgName = null;
  String member = null;

  SyncbaseDbEjectFromSyncGroupParams() : super(kVersions.last.size);

  static SyncbaseDbEjectFromSyncGroupParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static SyncbaseDbEjectFromSyncGroupParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseDbEjectFromSyncGroupParams result = new SyncbaseDbEjectFromSyncGroupParams();

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
      
      result.name = decoder0.decodeString(8, false);
    }
    if (mainDataHeader.version >= 0) {
      
      result.sgName = decoder0.decodeString(16, false);
    }
    if (mainDataHeader.version >= 0) {
      
      result.member = decoder0.decodeString(24, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(name, 8, false);
    
    encoder0.encodeString(sgName, 16, false);
    
    encoder0.encodeString(member, 24, false);
  }

  String toString() {
    return "SyncbaseDbEjectFromSyncGroupParams("
           "name: $name" ", "
           "sgName: $sgName" ", "
           "member: $member" ")";
  }
}

class SyncbaseDbEjectFromSyncGroupResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  Error err = null;

  SyncbaseDbEjectFromSyncGroupResponseParams() : super(kVersions.last.size);

  static SyncbaseDbEjectFromSyncGroupResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static SyncbaseDbEjectFromSyncGroupResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseDbEjectFromSyncGroupResponseParams result = new SyncbaseDbEjectFromSyncGroupResponseParams();

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
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.err = Error.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(err, 8, false);
  }

  String toString() {
    return "SyncbaseDbEjectFromSyncGroupResponseParams("
           "err: $err" ")";
  }
}

class SyncbaseDbGetSyncGroupSpecParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  String name = null;
  String sgName = null;

  SyncbaseDbGetSyncGroupSpecParams() : super(kVersions.last.size);

  static SyncbaseDbGetSyncGroupSpecParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static SyncbaseDbGetSyncGroupSpecParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseDbGetSyncGroupSpecParams result = new SyncbaseDbGetSyncGroupSpecParams();

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
      
      result.name = decoder0.decodeString(8, false);
    }
    if (mainDataHeader.version >= 0) {
      
      result.sgName = decoder0.decodeString(16, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(name, 8, false);
    
    encoder0.encodeString(sgName, 16, false);
  }

  String toString() {
    return "SyncbaseDbGetSyncGroupSpecParams("
           "name: $name" ", "
           "sgName: $sgName" ")";
  }
}

class SyncbaseDbGetSyncGroupSpecResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(32, 0)
  ];
  Error err = null;
  SyncGroupSpec spec = null;
  String version = null;

  SyncbaseDbGetSyncGroupSpecResponseParams() : super(kVersions.last.size);

  static SyncbaseDbGetSyncGroupSpecResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static SyncbaseDbGetSyncGroupSpecResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseDbGetSyncGroupSpecResponseParams result = new SyncbaseDbGetSyncGroupSpecResponseParams();

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
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.err = Error.decode(decoder1);
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(16, false);
      result.spec = SyncGroupSpec.decode(decoder1);
    }
    if (mainDataHeader.version >= 0) {
      
      result.version = decoder0.decodeString(24, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(err, 8, false);
    
    encoder0.encodeStruct(spec, 16, false);
    
    encoder0.encodeString(version, 24, false);
  }

  String toString() {
    return "SyncbaseDbGetSyncGroupSpecResponseParams("
           "err: $err" ", "
           "spec: $spec" ", "
           "version: $version" ")";
  }
}

class SyncbaseDbSetSyncGroupSpecParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(40, 0)
  ];
  String name = null;
  String sgName = null;
  SyncGroupSpec spec = null;
  String version = null;

  SyncbaseDbSetSyncGroupSpecParams() : super(kVersions.last.size);

  static SyncbaseDbSetSyncGroupSpecParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static SyncbaseDbSetSyncGroupSpecParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseDbSetSyncGroupSpecParams result = new SyncbaseDbSetSyncGroupSpecParams();

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
      
      result.name = decoder0.decodeString(8, false);
    }
    if (mainDataHeader.version >= 0) {
      
      result.sgName = decoder0.decodeString(16, false);
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(24, false);
      result.spec = SyncGroupSpec.decode(decoder1);
    }
    if (mainDataHeader.version >= 0) {
      
      result.version = decoder0.decodeString(32, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(name, 8, false);
    
    encoder0.encodeString(sgName, 16, false);
    
    encoder0.encodeStruct(spec, 24, false);
    
    encoder0.encodeString(version, 32, false);
  }

  String toString() {
    return "SyncbaseDbSetSyncGroupSpecParams("
           "name: $name" ", "
           "sgName: $sgName" ", "
           "spec: $spec" ", "
           "version: $version" ")";
  }
}

class SyncbaseDbSetSyncGroupSpecResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  Error err = null;

  SyncbaseDbSetSyncGroupSpecResponseParams() : super(kVersions.last.size);

  static SyncbaseDbSetSyncGroupSpecResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static SyncbaseDbSetSyncGroupSpecResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseDbSetSyncGroupSpecResponseParams result = new SyncbaseDbSetSyncGroupSpecResponseParams();

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
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.err = Error.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(err, 8, false);
  }

  String toString() {
    return "SyncbaseDbSetSyncGroupSpecResponseParams("
           "err: $err" ")";
  }
}

class SyncbaseDbGetSyncGroupMembersParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  String name = null;
  String sgName = null;

  SyncbaseDbGetSyncGroupMembersParams() : super(kVersions.last.size);

  static SyncbaseDbGetSyncGroupMembersParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static SyncbaseDbGetSyncGroupMembersParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseDbGetSyncGroupMembersParams result = new SyncbaseDbGetSyncGroupMembersParams();

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
      
      result.name = decoder0.decodeString(8, false);
    }
    if (mainDataHeader.version >= 0) {
      
      result.sgName = decoder0.decodeString(16, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(name, 8, false);
    
    encoder0.encodeString(sgName, 16, false);
  }

  String toString() {
    return "SyncbaseDbGetSyncGroupMembersParams("
           "name: $name" ", "
           "sgName: $sgName" ")";
  }
}

class SyncbaseDbGetSyncGroupMembersResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  Error err = null;
  Map<String, SyncGroupMemberInfo> infos = null;

  SyncbaseDbGetSyncGroupMembersResponseParams() : super(kVersions.last.size);

  static SyncbaseDbGetSyncGroupMembersResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static SyncbaseDbGetSyncGroupMembersResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseDbGetSyncGroupMembersResponseParams result = new SyncbaseDbGetSyncGroupMembersResponseParams();

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
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.err = Error.decode(decoder1);
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(16, false);
      {
        decoder1.decodeDataHeaderForMap();
        List<String> keys0;
        List<SyncGroupMemberInfo> values0;
        {
          
          var decoder2 = decoder1.decodePointer(bindings.ArrayDataHeader.kHeaderSize, false);
          {
            var si2 = decoder2.decodeDataHeaderForPointerArray(bindings.kUnspecifiedArrayLength);
            keys0 = new List<String>(si2.numElements);
            for (int i2 = 0; i2 < si2.numElements; ++i2) {
              
              keys0[i2] = decoder2.decodeString(bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i2, false);
            }
          }
        }
        {
          
          var decoder2 = decoder1.decodePointer(bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize, false);
          {
            var si2 = decoder2.decodeDataHeaderForPointerArray(keys0.length);
            values0 = new List<SyncGroupMemberInfo>(si2.numElements);
            for (int i2 = 0; i2 < si2.numElements; ++i2) {
              
              var decoder3 = decoder2.decodePointer(bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i2, false);
              values0[i2] = SyncGroupMemberInfo.decode(decoder3);
            }
          }
        }
        result.infos = new Map<String, SyncGroupMemberInfo>.fromIterables(
            keys0, values0);
      }
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(err, 8, false);
    
    if (infos == null) {
      encoder0.encodeNullPointer(16, false);
    } else {
      var encoder1 = encoder0.encoderForMap(16);
      int size0 = infos.length;
      var keys0 = infos.keys.toList();
      var values0 = infos.values.toList();
      
      {
        var encoder2 = encoder1.encodePointerArray(keys0.length, bindings.ArrayDataHeader.kHeaderSize, bindings.kUnspecifiedArrayLength);
        for (int i1 = 0; i1 < keys0.length; ++i1) {
          
          encoder2.encodeString(keys0[i1], bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i1, false);
        }
      }
      
      {
        var encoder2 = encoder1.encodePointerArray(values0.length, bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize, bindings.kUnspecifiedArrayLength);
        for (int i1 = 0; i1 < values0.length; ++i1) {
          
          encoder2.encodeStruct(values0[i1], bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i1, false);
        }
      }
    }
  }

  String toString() {
    return "SyncbaseDbGetSyncGroupMembersResponseParams("
           "err: $err" ", "
           "infos: $infos" ")";
  }
}

class SyncbaseTableCreateParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  String name = null;
  Perms perms = null;

  SyncbaseTableCreateParams() : super(kVersions.last.size);

  static SyncbaseTableCreateParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static SyncbaseTableCreateParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseTableCreateParams result = new SyncbaseTableCreateParams();

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
      
      result.name = decoder0.decodeString(8, false);
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(16, false);
      result.perms = Perms.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(name, 8, false);
    
    encoder0.encodeStruct(perms, 16, false);
  }

  String toString() {
    return "SyncbaseTableCreateParams("
           "name: $name" ", "
           "perms: $perms" ")";
  }
}

class SyncbaseTableCreateResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  Error err = null;

  SyncbaseTableCreateResponseParams() : super(kVersions.last.size);

  static SyncbaseTableCreateResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static SyncbaseTableCreateResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseTableCreateResponseParams result = new SyncbaseTableCreateResponseParams();

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
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.err = Error.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(err, 8, false);
  }

  String toString() {
    return "SyncbaseTableCreateResponseParams("
           "err: $err" ")";
  }
}

class SyncbaseTableDeleteParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  String name = null;

  SyncbaseTableDeleteParams() : super(kVersions.last.size);

  static SyncbaseTableDeleteParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static SyncbaseTableDeleteParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseTableDeleteParams result = new SyncbaseTableDeleteParams();

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
      
      result.name = decoder0.decodeString(8, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(name, 8, false);
  }

  String toString() {
    return "SyncbaseTableDeleteParams("
           "name: $name" ")";
  }
}

class SyncbaseTableDeleteResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  Error err = null;

  SyncbaseTableDeleteResponseParams() : super(kVersions.last.size);

  static SyncbaseTableDeleteResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static SyncbaseTableDeleteResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseTableDeleteResponseParams result = new SyncbaseTableDeleteResponseParams();

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
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.err = Error.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(err, 8, false);
  }

  String toString() {
    return "SyncbaseTableDeleteResponseParams("
           "err: $err" ")";
  }
}

class SyncbaseTableExistsParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  String name = null;

  SyncbaseTableExistsParams() : super(kVersions.last.size);

  static SyncbaseTableExistsParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static SyncbaseTableExistsParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseTableExistsParams result = new SyncbaseTableExistsParams();

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
      
      result.name = decoder0.decodeString(8, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(name, 8, false);
  }

  String toString() {
    return "SyncbaseTableExistsParams("
           "name: $name" ")";
  }
}

class SyncbaseTableExistsResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  Error err = null;
  bool exists = false;

  SyncbaseTableExistsResponseParams() : super(kVersions.last.size);

  static SyncbaseTableExistsResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static SyncbaseTableExistsResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseTableExistsResponseParams result = new SyncbaseTableExistsResponseParams();

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
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.err = Error.decode(decoder1);
    }
    if (mainDataHeader.version >= 0) {
      
      result.exists = decoder0.decodeBool(16, 0);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(err, 8, false);
    
    encoder0.encodeBool(exists, 16, 0);
  }

  String toString() {
    return "SyncbaseTableExistsResponseParams("
           "err: $err" ", "
           "exists: $exists" ")";
  }
}

class SyncbaseTableDeleteRowRangeParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(32, 0)
  ];
  String name = null;
  List<int> start = null;
  List<int> limit = null;

  SyncbaseTableDeleteRowRangeParams() : super(kVersions.last.size);

  static SyncbaseTableDeleteRowRangeParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static SyncbaseTableDeleteRowRangeParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseTableDeleteRowRangeParams result = new SyncbaseTableDeleteRowRangeParams();

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
      
      result.name = decoder0.decodeString(8, false);
    }
    if (mainDataHeader.version >= 0) {
      
      result.start = decoder0.decodeUint8Array(16, bindings.kNothingNullable, bindings.kUnspecifiedArrayLength);
    }
    if (mainDataHeader.version >= 0) {
      
      result.limit = decoder0.decodeUint8Array(24, bindings.kNothingNullable, bindings.kUnspecifiedArrayLength);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(name, 8, false);
    
    encoder0.encodeUint8Array(start, 16, bindings.kNothingNullable, bindings.kUnspecifiedArrayLength);
    
    encoder0.encodeUint8Array(limit, 24, bindings.kNothingNullable, bindings.kUnspecifiedArrayLength);
  }

  String toString() {
    return "SyncbaseTableDeleteRowRangeParams("
           "name: $name" ", "
           "start: $start" ", "
           "limit: $limit" ")";
  }
}

class SyncbaseTableDeleteRowRangeResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  Error err = null;

  SyncbaseTableDeleteRowRangeResponseParams() : super(kVersions.last.size);

  static SyncbaseTableDeleteRowRangeResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static SyncbaseTableDeleteRowRangeResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseTableDeleteRowRangeResponseParams result = new SyncbaseTableDeleteRowRangeResponseParams();

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
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.err = Error.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(err, 8, false);
  }

  String toString() {
    return "SyncbaseTableDeleteRowRangeResponseParams("
           "err: $err" ")";
  }
}

class SyncbaseTableScanParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(32, 0)
  ];
  String name = null;
  List<int> start = null;
  List<int> limit = null;

  SyncbaseTableScanParams() : super(kVersions.last.size);

  static SyncbaseTableScanParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static SyncbaseTableScanParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseTableScanParams result = new SyncbaseTableScanParams();

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
      
      result.name = decoder0.decodeString(8, false);
    }
    if (mainDataHeader.version >= 0) {
      
      result.start = decoder0.decodeUint8Array(16, bindings.kNothingNullable, bindings.kUnspecifiedArrayLength);
    }
    if (mainDataHeader.version >= 0) {
      
      result.limit = decoder0.decodeUint8Array(24, bindings.kNothingNullable, bindings.kUnspecifiedArrayLength);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(name, 8, false);
    
    encoder0.encodeUint8Array(start, 16, bindings.kNothingNullable, bindings.kUnspecifiedArrayLength);
    
    encoder0.encodeUint8Array(limit, 24, bindings.kNothingNullable, bindings.kUnspecifiedArrayLength);
  }

  String toString() {
    return "SyncbaseTableScanParams("
           "name: $name" ", "
           "start: $start" ", "
           "limit: $limit" ")";
  }
}

class SyncbaseTableScanResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  Error err = null;

  SyncbaseTableScanResponseParams() : super(kVersions.last.size);

  static SyncbaseTableScanResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static SyncbaseTableScanResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseTableScanResponseParams result = new SyncbaseTableScanResponseParams();

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
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.err = Error.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(err, 8, false);
  }

  String toString() {
    return "SyncbaseTableScanResponseParams("
           "err: $err" ")";
  }
}

class SyncbaseTableGetPermissionsParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  String name = null;
  String key = null;

  SyncbaseTableGetPermissionsParams() : super(kVersions.last.size);

  static SyncbaseTableGetPermissionsParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static SyncbaseTableGetPermissionsParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseTableGetPermissionsParams result = new SyncbaseTableGetPermissionsParams();

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
      
      result.name = decoder0.decodeString(8, false);
    }
    if (mainDataHeader.version >= 0) {
      
      result.key = decoder0.decodeString(16, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(name, 8, false);
    
    encoder0.encodeString(key, 16, false);
  }

  String toString() {
    return "SyncbaseTableGetPermissionsParams("
           "name: $name" ", "
           "key: $key" ")";
  }
}

class SyncbaseTableGetPermissionsResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  Error err = null;
  List<PrefixPerms> permsArr = null;

  SyncbaseTableGetPermissionsResponseParams() : super(kVersions.last.size);

  static SyncbaseTableGetPermissionsResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static SyncbaseTableGetPermissionsResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseTableGetPermissionsResponseParams result = new SyncbaseTableGetPermissionsResponseParams();

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
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.err = Error.decode(decoder1);
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(16, false);
      {
        var si1 = decoder1.decodeDataHeaderForPointerArray(bindings.kUnspecifiedArrayLength);
        result.permsArr = new List<PrefixPerms>(si1.numElements);
        for (int i1 = 0; i1 < si1.numElements; ++i1) {
          
          var decoder2 = decoder1.decodePointer(bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i1, false);
          result.permsArr[i1] = PrefixPerms.decode(decoder2);
        }
      }
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(err, 8, false);
    
    if (permsArr == null) {
      encoder0.encodeNullPointer(16, false);
    } else {
      var encoder1 = encoder0.encodePointerArray(permsArr.length, 16, bindings.kUnspecifiedArrayLength);
      for (int i0 = 0; i0 < permsArr.length; ++i0) {
        
        encoder1.encodeStruct(permsArr[i0], bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i0, false);
      }
    }
  }

  String toString() {
    return "SyncbaseTableGetPermissionsResponseParams("
           "err: $err" ", "
           "permsArr: $permsArr" ")";
  }
}

class SyncbaseTableSetPermissionsParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(32, 0)
  ];
  String name = null;
  String prefix = null;
  Perms perms = null;

  SyncbaseTableSetPermissionsParams() : super(kVersions.last.size);

  static SyncbaseTableSetPermissionsParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static SyncbaseTableSetPermissionsParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseTableSetPermissionsParams result = new SyncbaseTableSetPermissionsParams();

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
      
      result.name = decoder0.decodeString(8, false);
    }
    if (mainDataHeader.version >= 0) {
      
      result.prefix = decoder0.decodeString(16, false);
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(24, false);
      result.perms = Perms.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(name, 8, false);
    
    encoder0.encodeString(prefix, 16, false);
    
    encoder0.encodeStruct(perms, 24, false);
  }

  String toString() {
    return "SyncbaseTableSetPermissionsParams("
           "name: $name" ", "
           "prefix: $prefix" ", "
           "perms: $perms" ")";
  }
}

class SyncbaseTableSetPermissionsResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  Error err = null;

  SyncbaseTableSetPermissionsResponseParams() : super(kVersions.last.size);

  static SyncbaseTableSetPermissionsResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static SyncbaseTableSetPermissionsResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseTableSetPermissionsResponseParams result = new SyncbaseTableSetPermissionsResponseParams();

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
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.err = Error.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(err, 8, false);
  }

  String toString() {
    return "SyncbaseTableSetPermissionsResponseParams("
           "err: $err" ")";
  }
}

class SyncbaseTableDeletePermissionsParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  String name = null;
  String prefix = null;

  SyncbaseTableDeletePermissionsParams() : super(kVersions.last.size);

  static SyncbaseTableDeletePermissionsParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static SyncbaseTableDeletePermissionsParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseTableDeletePermissionsParams result = new SyncbaseTableDeletePermissionsParams();

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
      
      result.name = decoder0.decodeString(8, false);
    }
    if (mainDataHeader.version >= 0) {
      
      result.prefix = decoder0.decodeString(16, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(name, 8, false);
    
    encoder0.encodeString(prefix, 16, false);
  }

  String toString() {
    return "SyncbaseTableDeletePermissionsParams("
           "name: $name" ", "
           "prefix: $prefix" ")";
  }
}

class SyncbaseTableDeletePermissionsResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  Error err = null;

  SyncbaseTableDeletePermissionsResponseParams() : super(kVersions.last.size);

  static SyncbaseTableDeletePermissionsResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static SyncbaseTableDeletePermissionsResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseTableDeletePermissionsResponseParams result = new SyncbaseTableDeletePermissionsResponseParams();

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
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.err = Error.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(err, 8, false);
  }

  String toString() {
    return "SyncbaseTableDeletePermissionsResponseParams("
           "err: $err" ")";
  }
}

class SyncbaseRowExistsParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  String name = null;

  SyncbaseRowExistsParams() : super(kVersions.last.size);

  static SyncbaseRowExistsParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static SyncbaseRowExistsParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseRowExistsParams result = new SyncbaseRowExistsParams();

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
      
      result.name = decoder0.decodeString(8, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(name, 8, false);
  }

  String toString() {
    return "SyncbaseRowExistsParams("
           "name: $name" ")";
  }
}

class SyncbaseRowExistsResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  Error err = null;
  bool exists = false;

  SyncbaseRowExistsResponseParams() : super(kVersions.last.size);

  static SyncbaseRowExistsResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static SyncbaseRowExistsResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseRowExistsResponseParams result = new SyncbaseRowExistsResponseParams();

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
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.err = Error.decode(decoder1);
    }
    if (mainDataHeader.version >= 0) {
      
      result.exists = decoder0.decodeBool(16, 0);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(err, 8, false);
    
    encoder0.encodeBool(exists, 16, 0);
  }

  String toString() {
    return "SyncbaseRowExistsResponseParams("
           "err: $err" ", "
           "exists: $exists" ")";
  }
}

class SyncbaseRowGetParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  String name = null;

  SyncbaseRowGetParams() : super(kVersions.last.size);

  static SyncbaseRowGetParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static SyncbaseRowGetParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseRowGetParams result = new SyncbaseRowGetParams();

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
      
      result.name = decoder0.decodeString(8, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(name, 8, false);
  }

  String toString() {
    return "SyncbaseRowGetParams("
           "name: $name" ")";
  }
}

class SyncbaseRowGetResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  Error err = null;
  List<int> value = null;

  SyncbaseRowGetResponseParams() : super(kVersions.last.size);

  static SyncbaseRowGetResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static SyncbaseRowGetResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseRowGetResponseParams result = new SyncbaseRowGetResponseParams();

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
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.err = Error.decode(decoder1);
    }
    if (mainDataHeader.version >= 0) {
      
      result.value = decoder0.decodeUint8Array(16, bindings.kNothingNullable, bindings.kUnspecifiedArrayLength);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(err, 8, false);
    
    encoder0.encodeUint8Array(value, 16, bindings.kNothingNullable, bindings.kUnspecifiedArrayLength);
  }

  String toString() {
    return "SyncbaseRowGetResponseParams("
           "err: $err" ", "
           "value: $value" ")";
  }
}

class SyncbaseRowPutParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  String name = null;
  List<int> value = null;

  SyncbaseRowPutParams() : super(kVersions.last.size);

  static SyncbaseRowPutParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static SyncbaseRowPutParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseRowPutParams result = new SyncbaseRowPutParams();

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
      
      result.name = decoder0.decodeString(8, false);
    }
    if (mainDataHeader.version >= 0) {
      
      result.value = decoder0.decodeUint8Array(16, bindings.kNothingNullable, bindings.kUnspecifiedArrayLength);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(name, 8, false);
    
    encoder0.encodeUint8Array(value, 16, bindings.kNothingNullable, bindings.kUnspecifiedArrayLength);
  }

  String toString() {
    return "SyncbaseRowPutParams("
           "name: $name" ", "
           "value: $value" ")";
  }
}

class SyncbaseRowPutResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  Error err = null;

  SyncbaseRowPutResponseParams() : super(kVersions.last.size);

  static SyncbaseRowPutResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static SyncbaseRowPutResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseRowPutResponseParams result = new SyncbaseRowPutResponseParams();

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
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.err = Error.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(err, 8, false);
  }

  String toString() {
    return "SyncbaseRowPutResponseParams("
           "err: $err" ")";
  }
}

class SyncbaseRowDeleteParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  String name = null;

  SyncbaseRowDeleteParams() : super(kVersions.last.size);

  static SyncbaseRowDeleteParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static SyncbaseRowDeleteParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseRowDeleteParams result = new SyncbaseRowDeleteParams();

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
      
      result.name = decoder0.decodeString(8, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(name, 8, false);
  }

  String toString() {
    return "SyncbaseRowDeleteParams("
           "name: $name" ")";
  }
}

class SyncbaseRowDeleteResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  Error err = null;

  SyncbaseRowDeleteResponseParams() : super(kVersions.last.size);

  static SyncbaseRowDeleteResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static SyncbaseRowDeleteResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseRowDeleteResponseParams result = new SyncbaseRowDeleteResponseParams();

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
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.err = Error.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(err, 8, false);
  }

  String toString() {
    return "SyncbaseRowDeleteResponseParams("
           "err: $err" ")";
  }
}

const int kSyncbase_serviceGetPermissions_name = 0;
const int kSyncbase_serviceSetPermissions_name = 1;
const int kSyncbase_appCreate_name = 2;
const int kSyncbase_appDelete_name = 3;
const int kSyncbase_appExists_name = 4;
const int kSyncbase_appGetPermissions_name = 5;
const int kSyncbase_appSetPermissions_name = 6;
const int kSyncbase_dbCreate_name = 7;
const int kSyncbase_dbDelete_name = 8;
const int kSyncbase_dbExists_name = 9;
const int kSyncbase_dbExec_name = 10;
const int kSyncbase_dbBeginBatch_name = 11;
const int kSyncbase_dbCommit_name = 12;
const int kSyncbase_dbAbort_name = 13;
const int kSyncbase_dbGetPermissions_name = 14;
const int kSyncbase_dbSetPermissions_name = 15;
const int kSyncbase_dbGetSyncGroupNames_name = 16;
const int kSyncbase_dbCreateSyncGroup_name = 17;
const int kSyncbase_dbJoinSyncGroup_name = 18;
const int kSyncbase_dbLeaveSyncGroup_name = 19;
const int kSyncbase_dbDestroySyncGroup_name = 20;
const int kSyncbase_dbEjectFromSyncGroup_name = 21;
const int kSyncbase_dbGetSyncGroupSpec_name = 22;
const int kSyncbase_dbSetSyncGroupSpec_name = 23;
const int kSyncbase_dbGetSyncGroupMembers_name = 24;
const int kSyncbase_tableCreate_name = 25;
const int kSyncbase_tableDelete_name = 26;
const int kSyncbase_tableExists_name = 27;
const int kSyncbase_tableDeleteRowRange_name = 28;
const int kSyncbase_tableScan_name = 29;
const int kSyncbase_tableGetPermissions_name = 30;
const int kSyncbase_tableSetPermissions_name = 31;
const int kSyncbase_tableDeletePermissions_name = 32;
const int kSyncbase_rowExists_name = 33;
const int kSyncbase_rowGet_name = 34;
const int kSyncbase_rowPut_name = 35;
const int kSyncbase_rowDelete_name = 36;

const String SyncbaseName =
      'mojo::syncbase::Syncbase';

abstract class Syncbase {
  Future<SyncbaseServiceGetPermissionsResponseParams> serviceGetPermissions([Function responseFactory = null]);
  Future<SyncbaseServiceSetPermissionsResponseParams> serviceSetPermissions(Perms perms,String version,[Function responseFactory = null]);
  Future<SyncbaseAppCreateResponseParams> appCreate(String name,Perms perms,[Function responseFactory = null]);
  Future<SyncbaseAppDeleteResponseParams> appDelete(String name,[Function responseFactory = null]);
  Future<SyncbaseAppExistsResponseParams> appExists(String name,[Function responseFactory = null]);
  Future<SyncbaseAppGetPermissionsResponseParams> appGetPermissions(String name,[Function responseFactory = null]);
  Future<SyncbaseAppSetPermissionsResponseParams> appSetPermissions(String name,Perms perms,String version,[Function responseFactory = null]);
  Future<SyncbaseDbCreateResponseParams> dbCreate(String name,Perms perms,[Function responseFactory = null]);
  Future<SyncbaseDbDeleteResponseParams> dbDelete(String name,[Function responseFactory = null]);
  Future<SyncbaseDbExistsResponseParams> dbExists(String name,[Function responseFactory = null]);
  Future<SyncbaseDbExecResponseParams> dbExec(String query,[Function responseFactory = null]);
  Future<SyncbaseDbBeginBatchResponseParams> dbBeginBatch(String name,BatchOptions bo,[Function responseFactory = null]);
  Future<SyncbaseDbCommitResponseParams> dbCommit(String name,[Function responseFactory = null]);
  Future<SyncbaseDbAbortResponseParams> dbAbort(String name,[Function responseFactory = null]);
  Future<SyncbaseDbGetPermissionsResponseParams> dbGetPermissions(String name,[Function responseFactory = null]);
  Future<SyncbaseDbSetPermissionsResponseParams> dbSetPermissions(String name,Perms perms,String version,[Function responseFactory = null]);
  Future<SyncbaseDbGetSyncGroupNamesResponseParams> dbGetSyncGroupNames(String name,[Function responseFactory = null]);
  Future<SyncbaseDbCreateSyncGroupResponseParams> dbCreateSyncGroup(String name,String sgName,SyncGroupSpec spec,SyncGroupMemberInfo myInfo,[Function responseFactory = null]);
  Future<SyncbaseDbJoinSyncGroupResponseParams> dbJoinSyncGroup(String name,String sgName,SyncGroupMemberInfo myInfo,[Function responseFactory = null]);
  Future<SyncbaseDbLeaveSyncGroupResponseParams> dbLeaveSyncGroup(String name,String sgName,[Function responseFactory = null]);
  Future<SyncbaseDbDestroySyncGroupResponseParams> dbDestroySyncGroup(String name,String sgName,[Function responseFactory = null]);
  Future<SyncbaseDbEjectFromSyncGroupResponseParams> dbEjectFromSyncGroup(String name,String sgName,String member,[Function responseFactory = null]);
  Future<SyncbaseDbGetSyncGroupSpecResponseParams> dbGetSyncGroupSpec(String name,String sgName,[Function responseFactory = null]);
  Future<SyncbaseDbSetSyncGroupSpecResponseParams> dbSetSyncGroupSpec(String name,String sgName,SyncGroupSpec spec,String version,[Function responseFactory = null]);
  Future<SyncbaseDbGetSyncGroupMembersResponseParams> dbGetSyncGroupMembers(String name,String sgName,[Function responseFactory = null]);
  Future<SyncbaseTableCreateResponseParams> tableCreate(String name,Perms perms,[Function responseFactory = null]);
  Future<SyncbaseTableDeleteResponseParams> tableDelete(String name,[Function responseFactory = null]);
  Future<SyncbaseTableExistsResponseParams> tableExists(String name,[Function responseFactory = null]);
  Future<SyncbaseTableDeleteRowRangeResponseParams> tableDeleteRowRange(String name,List<int> start,List<int> limit,[Function responseFactory = null]);
  Future<SyncbaseTableScanResponseParams> tableScan(String name,List<int> start,List<int> limit,[Function responseFactory = null]);
  Future<SyncbaseTableGetPermissionsResponseParams> tableGetPermissions(String name,String key,[Function responseFactory = null]);
  Future<SyncbaseTableSetPermissionsResponseParams> tableSetPermissions(String name,String prefix,Perms perms,[Function responseFactory = null]);
  Future<SyncbaseTableDeletePermissionsResponseParams> tableDeletePermissions(String name,String prefix,[Function responseFactory = null]);
  Future<SyncbaseRowExistsResponseParams> rowExists(String name,[Function responseFactory = null]);
  Future<SyncbaseRowGetResponseParams> rowGet(String name,[Function responseFactory = null]);
  Future<SyncbaseRowPutResponseParams> rowPut(String name,List<int> value,[Function responseFactory = null]);
  Future<SyncbaseRowDeleteResponseParams> rowDelete(String name,[Function responseFactory = null]);

}


class SyncbaseProxyImpl extends bindings.Proxy {
  SyncbaseProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  SyncbaseProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  SyncbaseProxyImpl.unbound() : super.unbound();

  static SyncbaseProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For SyncbaseProxyImpl"));
    return new SyncbaseProxyImpl.fromEndpoint(endpoint);
  }

  String get name => SyncbaseName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kSyncbase_serviceGetPermissions_name:
        var r = SyncbaseServiceGetPermissionsResponseParams.deserialize(
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
      case kSyncbase_serviceSetPermissions_name:
        var r = SyncbaseServiceSetPermissionsResponseParams.deserialize(
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
      case kSyncbase_appCreate_name:
        var r = SyncbaseAppCreateResponseParams.deserialize(
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
      case kSyncbase_appDelete_name:
        var r = SyncbaseAppDeleteResponseParams.deserialize(
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
      case kSyncbase_appExists_name:
        var r = SyncbaseAppExistsResponseParams.deserialize(
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
      case kSyncbase_appGetPermissions_name:
        var r = SyncbaseAppGetPermissionsResponseParams.deserialize(
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
      case kSyncbase_appSetPermissions_name:
        var r = SyncbaseAppSetPermissionsResponseParams.deserialize(
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
      case kSyncbase_dbCreate_name:
        var r = SyncbaseDbCreateResponseParams.deserialize(
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
      case kSyncbase_dbDelete_name:
        var r = SyncbaseDbDeleteResponseParams.deserialize(
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
      case kSyncbase_dbExists_name:
        var r = SyncbaseDbExistsResponseParams.deserialize(
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
      case kSyncbase_dbExec_name:
        var r = SyncbaseDbExecResponseParams.deserialize(
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
      case kSyncbase_dbBeginBatch_name:
        var r = SyncbaseDbBeginBatchResponseParams.deserialize(
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
      case kSyncbase_dbCommit_name:
        var r = SyncbaseDbCommitResponseParams.deserialize(
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
      case kSyncbase_dbAbort_name:
        var r = SyncbaseDbAbortResponseParams.deserialize(
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
      case kSyncbase_dbGetPermissions_name:
        var r = SyncbaseDbGetPermissionsResponseParams.deserialize(
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
      case kSyncbase_dbSetPermissions_name:
        var r = SyncbaseDbSetPermissionsResponseParams.deserialize(
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
      case kSyncbase_dbGetSyncGroupNames_name:
        var r = SyncbaseDbGetSyncGroupNamesResponseParams.deserialize(
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
      case kSyncbase_dbCreateSyncGroup_name:
        var r = SyncbaseDbCreateSyncGroupResponseParams.deserialize(
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
      case kSyncbase_dbJoinSyncGroup_name:
        var r = SyncbaseDbJoinSyncGroupResponseParams.deserialize(
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
      case kSyncbase_dbLeaveSyncGroup_name:
        var r = SyncbaseDbLeaveSyncGroupResponseParams.deserialize(
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
      case kSyncbase_dbDestroySyncGroup_name:
        var r = SyncbaseDbDestroySyncGroupResponseParams.deserialize(
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
      case kSyncbase_dbEjectFromSyncGroup_name:
        var r = SyncbaseDbEjectFromSyncGroupResponseParams.deserialize(
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
      case kSyncbase_dbGetSyncGroupSpec_name:
        var r = SyncbaseDbGetSyncGroupSpecResponseParams.deserialize(
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
      case kSyncbase_dbSetSyncGroupSpec_name:
        var r = SyncbaseDbSetSyncGroupSpecResponseParams.deserialize(
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
      case kSyncbase_dbGetSyncGroupMembers_name:
        var r = SyncbaseDbGetSyncGroupMembersResponseParams.deserialize(
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
      case kSyncbase_tableCreate_name:
        var r = SyncbaseTableCreateResponseParams.deserialize(
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
      case kSyncbase_tableDelete_name:
        var r = SyncbaseTableDeleteResponseParams.deserialize(
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
      case kSyncbase_tableExists_name:
        var r = SyncbaseTableExistsResponseParams.deserialize(
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
      case kSyncbase_tableDeleteRowRange_name:
        var r = SyncbaseTableDeleteRowRangeResponseParams.deserialize(
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
      case kSyncbase_tableScan_name:
        var r = SyncbaseTableScanResponseParams.deserialize(
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
      case kSyncbase_tableGetPermissions_name:
        var r = SyncbaseTableGetPermissionsResponseParams.deserialize(
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
      case kSyncbase_tableSetPermissions_name:
        var r = SyncbaseTableSetPermissionsResponseParams.deserialize(
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
      case kSyncbase_tableDeletePermissions_name:
        var r = SyncbaseTableDeletePermissionsResponseParams.deserialize(
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
      case kSyncbase_rowExists_name:
        var r = SyncbaseRowExistsResponseParams.deserialize(
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
      case kSyncbase_rowGet_name:
        var r = SyncbaseRowGetResponseParams.deserialize(
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
      case kSyncbase_rowPut_name:
        var r = SyncbaseRowPutResponseParams.deserialize(
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
      case kSyncbase_rowDelete_name:
        var r = SyncbaseRowDeleteResponseParams.deserialize(
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
    return "SyncbaseProxyImpl($superString)";
  }
}


class _SyncbaseProxyCalls implements Syncbase {
  SyncbaseProxyImpl _proxyImpl;

  _SyncbaseProxyCalls(this._proxyImpl);
    Future<SyncbaseServiceGetPermissionsResponseParams> serviceGetPermissions([Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new SyncbaseServiceGetPermissionsParams();
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kSyncbase_serviceGetPermissions_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    Future<SyncbaseServiceSetPermissionsResponseParams> serviceSetPermissions(Perms perms,String version,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new SyncbaseServiceSetPermissionsParams();
      params.perms = perms;
      params.version = version;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kSyncbase_serviceSetPermissions_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    Future<SyncbaseAppCreateResponseParams> appCreate(String name,Perms perms,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new SyncbaseAppCreateParams();
      params.name = name;
      params.perms = perms;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kSyncbase_appCreate_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    Future<SyncbaseAppDeleteResponseParams> appDelete(String name,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new SyncbaseAppDeleteParams();
      params.name = name;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kSyncbase_appDelete_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    Future<SyncbaseAppExistsResponseParams> appExists(String name,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new SyncbaseAppExistsParams();
      params.name = name;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kSyncbase_appExists_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    Future<SyncbaseAppGetPermissionsResponseParams> appGetPermissions(String name,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new SyncbaseAppGetPermissionsParams();
      params.name = name;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kSyncbase_appGetPermissions_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    Future<SyncbaseAppSetPermissionsResponseParams> appSetPermissions(String name,Perms perms,String version,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new SyncbaseAppSetPermissionsParams();
      params.name = name;
      params.perms = perms;
      params.version = version;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kSyncbase_appSetPermissions_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    Future<SyncbaseDbCreateResponseParams> dbCreate(String name,Perms perms,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new SyncbaseDbCreateParams();
      params.name = name;
      params.perms = perms;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kSyncbase_dbCreate_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    Future<SyncbaseDbDeleteResponseParams> dbDelete(String name,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new SyncbaseDbDeleteParams();
      params.name = name;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kSyncbase_dbDelete_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    Future<SyncbaseDbExistsResponseParams> dbExists(String name,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new SyncbaseDbExistsParams();
      params.name = name;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kSyncbase_dbExists_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    Future<SyncbaseDbExecResponseParams> dbExec(String query,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new SyncbaseDbExecParams();
      params.query = query;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kSyncbase_dbExec_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    Future<SyncbaseDbBeginBatchResponseParams> dbBeginBatch(String name,BatchOptions bo,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new SyncbaseDbBeginBatchParams();
      params.name = name;
      params.bo = bo;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kSyncbase_dbBeginBatch_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    Future<SyncbaseDbCommitResponseParams> dbCommit(String name,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new SyncbaseDbCommitParams();
      params.name = name;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kSyncbase_dbCommit_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    Future<SyncbaseDbAbortResponseParams> dbAbort(String name,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new SyncbaseDbAbortParams();
      params.name = name;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kSyncbase_dbAbort_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    Future<SyncbaseDbGetPermissionsResponseParams> dbGetPermissions(String name,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new SyncbaseDbGetPermissionsParams();
      params.name = name;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kSyncbase_dbGetPermissions_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    Future<SyncbaseDbSetPermissionsResponseParams> dbSetPermissions(String name,Perms perms,String version,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new SyncbaseDbSetPermissionsParams();
      params.name = name;
      params.perms = perms;
      params.version = version;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kSyncbase_dbSetPermissions_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    Future<SyncbaseDbGetSyncGroupNamesResponseParams> dbGetSyncGroupNames(String name,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new SyncbaseDbGetSyncGroupNamesParams();
      params.name = name;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kSyncbase_dbGetSyncGroupNames_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    Future<SyncbaseDbCreateSyncGroupResponseParams> dbCreateSyncGroup(String name,String sgName,SyncGroupSpec spec,SyncGroupMemberInfo myInfo,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new SyncbaseDbCreateSyncGroupParams();
      params.name = name;
      params.sgName = sgName;
      params.spec = spec;
      params.myInfo = myInfo;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kSyncbase_dbCreateSyncGroup_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    Future<SyncbaseDbJoinSyncGroupResponseParams> dbJoinSyncGroup(String name,String sgName,SyncGroupMemberInfo myInfo,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new SyncbaseDbJoinSyncGroupParams();
      params.name = name;
      params.sgName = sgName;
      params.myInfo = myInfo;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kSyncbase_dbJoinSyncGroup_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    Future<SyncbaseDbLeaveSyncGroupResponseParams> dbLeaveSyncGroup(String name,String sgName,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new SyncbaseDbLeaveSyncGroupParams();
      params.name = name;
      params.sgName = sgName;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kSyncbase_dbLeaveSyncGroup_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    Future<SyncbaseDbDestroySyncGroupResponseParams> dbDestroySyncGroup(String name,String sgName,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new SyncbaseDbDestroySyncGroupParams();
      params.name = name;
      params.sgName = sgName;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kSyncbase_dbDestroySyncGroup_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    Future<SyncbaseDbEjectFromSyncGroupResponseParams> dbEjectFromSyncGroup(String name,String sgName,String member,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new SyncbaseDbEjectFromSyncGroupParams();
      params.name = name;
      params.sgName = sgName;
      params.member = member;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kSyncbase_dbEjectFromSyncGroup_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    Future<SyncbaseDbGetSyncGroupSpecResponseParams> dbGetSyncGroupSpec(String name,String sgName,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new SyncbaseDbGetSyncGroupSpecParams();
      params.name = name;
      params.sgName = sgName;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kSyncbase_dbGetSyncGroupSpec_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    Future<SyncbaseDbSetSyncGroupSpecResponseParams> dbSetSyncGroupSpec(String name,String sgName,SyncGroupSpec spec,String version,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new SyncbaseDbSetSyncGroupSpecParams();
      params.name = name;
      params.sgName = sgName;
      params.spec = spec;
      params.version = version;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kSyncbase_dbSetSyncGroupSpec_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    Future<SyncbaseDbGetSyncGroupMembersResponseParams> dbGetSyncGroupMembers(String name,String sgName,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new SyncbaseDbGetSyncGroupMembersParams();
      params.name = name;
      params.sgName = sgName;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kSyncbase_dbGetSyncGroupMembers_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    Future<SyncbaseTableCreateResponseParams> tableCreate(String name,Perms perms,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new SyncbaseTableCreateParams();
      params.name = name;
      params.perms = perms;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kSyncbase_tableCreate_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    Future<SyncbaseTableDeleteResponseParams> tableDelete(String name,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new SyncbaseTableDeleteParams();
      params.name = name;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kSyncbase_tableDelete_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    Future<SyncbaseTableExistsResponseParams> tableExists(String name,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new SyncbaseTableExistsParams();
      params.name = name;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kSyncbase_tableExists_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    Future<SyncbaseTableDeleteRowRangeResponseParams> tableDeleteRowRange(String name,List<int> start,List<int> limit,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new SyncbaseTableDeleteRowRangeParams();
      params.name = name;
      params.start = start;
      params.limit = limit;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kSyncbase_tableDeleteRowRange_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    Future<SyncbaseTableScanResponseParams> tableScan(String name,List<int> start,List<int> limit,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new SyncbaseTableScanParams();
      params.name = name;
      params.start = start;
      params.limit = limit;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kSyncbase_tableScan_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    Future<SyncbaseTableGetPermissionsResponseParams> tableGetPermissions(String name,String key,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new SyncbaseTableGetPermissionsParams();
      params.name = name;
      params.key = key;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kSyncbase_tableGetPermissions_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    Future<SyncbaseTableSetPermissionsResponseParams> tableSetPermissions(String name,String prefix,Perms perms,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new SyncbaseTableSetPermissionsParams();
      params.name = name;
      params.prefix = prefix;
      params.perms = perms;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kSyncbase_tableSetPermissions_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    Future<SyncbaseTableDeletePermissionsResponseParams> tableDeletePermissions(String name,String prefix,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new SyncbaseTableDeletePermissionsParams();
      params.name = name;
      params.prefix = prefix;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kSyncbase_tableDeletePermissions_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    Future<SyncbaseRowExistsResponseParams> rowExists(String name,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new SyncbaseRowExistsParams();
      params.name = name;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kSyncbase_rowExists_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    Future<SyncbaseRowGetResponseParams> rowGet(String name,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new SyncbaseRowGetParams();
      params.name = name;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kSyncbase_rowGet_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    Future<SyncbaseRowPutResponseParams> rowPut(String name,List<int> value,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new SyncbaseRowPutParams();
      params.name = name;
      params.value = value;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kSyncbase_rowPut_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    Future<SyncbaseRowDeleteResponseParams> rowDelete(String name,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new SyncbaseRowDeleteParams();
      params.name = name;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kSyncbase_rowDelete_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
}


class SyncbaseProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  Syncbase ptr;
  final String name = SyncbaseName;

  SyncbaseProxy(SyncbaseProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _SyncbaseProxyCalls(proxyImpl);

  SyncbaseProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new SyncbaseProxyImpl.fromEndpoint(endpoint) {
    ptr = new _SyncbaseProxyCalls(impl);
  }

  SyncbaseProxy.fromHandle(core.MojoHandle handle) :
      impl = new SyncbaseProxyImpl.fromHandle(handle) {
    ptr = new _SyncbaseProxyCalls(impl);
  }

  SyncbaseProxy.unbound() :
      impl = new SyncbaseProxyImpl.unbound() {
    ptr = new _SyncbaseProxyCalls(impl);
  }

  static SyncbaseProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For SyncbaseProxy"));
    return new SyncbaseProxy.fromEndpoint(endpoint);
  }

  Future close({bool immediate: false}) => impl.close(immediate: immediate);

  int get version => impl.version;

  Future<int> queryVersion() => impl.queryVersion();

  void requireVersion(int requiredVersion) {
    impl.requireVersion(requiredVersion);
  }

  String toString() {
    return "SyncbaseProxy($impl)";
  }
}


class SyncbaseStub extends bindings.Stub {
  Syncbase _impl = null;

  SyncbaseStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [this._impl])
      : super.fromEndpoint(endpoint);

  SyncbaseStub.fromHandle(core.MojoHandle handle, [this._impl])
      : super.fromHandle(handle);

  SyncbaseStub.unbound() : super.unbound();

  static SyncbaseStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For SyncbaseStub"));
    return new SyncbaseStub.fromEndpoint(endpoint);
  }

  static const String name = SyncbaseName;


  SyncbaseServiceGetPermissionsResponseParams _SyncbaseServiceGetPermissionsResponseParamsFactory(Error err, Perms perms, String version) {
    var result = new SyncbaseServiceGetPermissionsResponseParams();
    result.err = err;
    result.perms = perms;
    result.version = version;
    return result;
  }
  SyncbaseServiceSetPermissionsResponseParams _SyncbaseServiceSetPermissionsResponseParamsFactory(Error err) {
    var result = new SyncbaseServiceSetPermissionsResponseParams();
    result.err = err;
    return result;
  }
  SyncbaseAppCreateResponseParams _SyncbaseAppCreateResponseParamsFactory(Error err) {
    var result = new SyncbaseAppCreateResponseParams();
    result.err = err;
    return result;
  }
  SyncbaseAppDeleteResponseParams _SyncbaseAppDeleteResponseParamsFactory(Error err) {
    var result = new SyncbaseAppDeleteResponseParams();
    result.err = err;
    return result;
  }
  SyncbaseAppExistsResponseParams _SyncbaseAppExistsResponseParamsFactory(Error err, bool exists) {
    var result = new SyncbaseAppExistsResponseParams();
    result.err = err;
    result.exists = exists;
    return result;
  }
  SyncbaseAppGetPermissionsResponseParams _SyncbaseAppGetPermissionsResponseParamsFactory(Error err, Perms perms, String version) {
    var result = new SyncbaseAppGetPermissionsResponseParams();
    result.err = err;
    result.perms = perms;
    result.version = version;
    return result;
  }
  SyncbaseAppSetPermissionsResponseParams _SyncbaseAppSetPermissionsResponseParamsFactory(Error err) {
    var result = new SyncbaseAppSetPermissionsResponseParams();
    result.err = err;
    return result;
  }
  SyncbaseDbCreateResponseParams _SyncbaseDbCreateResponseParamsFactory(Error err) {
    var result = new SyncbaseDbCreateResponseParams();
    result.err = err;
    return result;
  }
  SyncbaseDbDeleteResponseParams _SyncbaseDbDeleteResponseParamsFactory(Error err) {
    var result = new SyncbaseDbDeleteResponseParams();
    result.err = err;
    return result;
  }
  SyncbaseDbExistsResponseParams _SyncbaseDbExistsResponseParamsFactory(Error err, bool exists) {
    var result = new SyncbaseDbExistsResponseParams();
    result.err = err;
    result.exists = exists;
    return result;
  }
  SyncbaseDbExecResponseParams _SyncbaseDbExecResponseParamsFactory(Error err) {
    var result = new SyncbaseDbExecResponseParams();
    result.err = err;
    return result;
  }
  SyncbaseDbBeginBatchResponseParams _SyncbaseDbBeginBatchResponseParamsFactory(Error err, String batchDn) {
    var result = new SyncbaseDbBeginBatchResponseParams();
    result.err = err;
    result.batchDn = batchDn;
    return result;
  }
  SyncbaseDbCommitResponseParams _SyncbaseDbCommitResponseParamsFactory(Error err) {
    var result = new SyncbaseDbCommitResponseParams();
    result.err = err;
    return result;
  }
  SyncbaseDbAbortResponseParams _SyncbaseDbAbortResponseParamsFactory(Error err) {
    var result = new SyncbaseDbAbortResponseParams();
    result.err = err;
    return result;
  }
  SyncbaseDbGetPermissionsResponseParams _SyncbaseDbGetPermissionsResponseParamsFactory(Error err, Perms perms, String version) {
    var result = new SyncbaseDbGetPermissionsResponseParams();
    result.err = err;
    result.perms = perms;
    result.version = version;
    return result;
  }
  SyncbaseDbSetPermissionsResponseParams _SyncbaseDbSetPermissionsResponseParamsFactory(Error err) {
    var result = new SyncbaseDbSetPermissionsResponseParams();
    result.err = err;
    return result;
  }
  SyncbaseDbGetSyncGroupNamesResponseParams _SyncbaseDbGetSyncGroupNamesResponseParamsFactory(Error err, List<String> names) {
    var result = new SyncbaseDbGetSyncGroupNamesResponseParams();
    result.err = err;
    result.names = names;
    return result;
  }
  SyncbaseDbCreateSyncGroupResponseParams _SyncbaseDbCreateSyncGroupResponseParamsFactory(Error err) {
    var result = new SyncbaseDbCreateSyncGroupResponseParams();
    result.err = err;
    return result;
  }
  SyncbaseDbJoinSyncGroupResponseParams _SyncbaseDbJoinSyncGroupResponseParamsFactory(Error err) {
    var result = new SyncbaseDbJoinSyncGroupResponseParams();
    result.err = err;
    return result;
  }
  SyncbaseDbLeaveSyncGroupResponseParams _SyncbaseDbLeaveSyncGroupResponseParamsFactory(Error err) {
    var result = new SyncbaseDbLeaveSyncGroupResponseParams();
    result.err = err;
    return result;
  }
  SyncbaseDbDestroySyncGroupResponseParams _SyncbaseDbDestroySyncGroupResponseParamsFactory(Error err) {
    var result = new SyncbaseDbDestroySyncGroupResponseParams();
    result.err = err;
    return result;
  }
  SyncbaseDbEjectFromSyncGroupResponseParams _SyncbaseDbEjectFromSyncGroupResponseParamsFactory(Error err) {
    var result = new SyncbaseDbEjectFromSyncGroupResponseParams();
    result.err = err;
    return result;
  }
  SyncbaseDbGetSyncGroupSpecResponseParams _SyncbaseDbGetSyncGroupSpecResponseParamsFactory(Error err, SyncGroupSpec spec, String version) {
    var result = new SyncbaseDbGetSyncGroupSpecResponseParams();
    result.err = err;
    result.spec = spec;
    result.version = version;
    return result;
  }
  SyncbaseDbSetSyncGroupSpecResponseParams _SyncbaseDbSetSyncGroupSpecResponseParamsFactory(Error err) {
    var result = new SyncbaseDbSetSyncGroupSpecResponseParams();
    result.err = err;
    return result;
  }
  SyncbaseDbGetSyncGroupMembersResponseParams _SyncbaseDbGetSyncGroupMembersResponseParamsFactory(Error err, Map<String, SyncGroupMemberInfo> infos) {
    var result = new SyncbaseDbGetSyncGroupMembersResponseParams();
    result.err = err;
    result.infos = infos;
    return result;
  }
  SyncbaseTableCreateResponseParams _SyncbaseTableCreateResponseParamsFactory(Error err) {
    var result = new SyncbaseTableCreateResponseParams();
    result.err = err;
    return result;
  }
  SyncbaseTableDeleteResponseParams _SyncbaseTableDeleteResponseParamsFactory(Error err) {
    var result = new SyncbaseTableDeleteResponseParams();
    result.err = err;
    return result;
  }
  SyncbaseTableExistsResponseParams _SyncbaseTableExistsResponseParamsFactory(Error err, bool exists) {
    var result = new SyncbaseTableExistsResponseParams();
    result.err = err;
    result.exists = exists;
    return result;
  }
  SyncbaseTableDeleteRowRangeResponseParams _SyncbaseTableDeleteRowRangeResponseParamsFactory(Error err) {
    var result = new SyncbaseTableDeleteRowRangeResponseParams();
    result.err = err;
    return result;
  }
  SyncbaseTableScanResponseParams _SyncbaseTableScanResponseParamsFactory(Error err) {
    var result = new SyncbaseTableScanResponseParams();
    result.err = err;
    return result;
  }
  SyncbaseTableGetPermissionsResponseParams _SyncbaseTableGetPermissionsResponseParamsFactory(Error err, List<PrefixPerms> permsArr) {
    var result = new SyncbaseTableGetPermissionsResponseParams();
    result.err = err;
    result.permsArr = permsArr;
    return result;
  }
  SyncbaseTableSetPermissionsResponseParams _SyncbaseTableSetPermissionsResponseParamsFactory(Error err) {
    var result = new SyncbaseTableSetPermissionsResponseParams();
    result.err = err;
    return result;
  }
  SyncbaseTableDeletePermissionsResponseParams _SyncbaseTableDeletePermissionsResponseParamsFactory(Error err) {
    var result = new SyncbaseTableDeletePermissionsResponseParams();
    result.err = err;
    return result;
  }
  SyncbaseRowExistsResponseParams _SyncbaseRowExistsResponseParamsFactory(Error err, bool exists) {
    var result = new SyncbaseRowExistsResponseParams();
    result.err = err;
    result.exists = exists;
    return result;
  }
  SyncbaseRowGetResponseParams _SyncbaseRowGetResponseParamsFactory(Error err, List<int> value) {
    var result = new SyncbaseRowGetResponseParams();
    result.err = err;
    result.value = value;
    return result;
  }
  SyncbaseRowPutResponseParams _SyncbaseRowPutResponseParamsFactory(Error err) {
    var result = new SyncbaseRowPutResponseParams();
    result.err = err;
    return result;
  }
  SyncbaseRowDeleteResponseParams _SyncbaseRowDeleteResponseParamsFactory(Error err) {
    var result = new SyncbaseRowDeleteResponseParams();
    result.err = err;
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
      case kSyncbase_serviceGetPermissions_name:
        var params = SyncbaseServiceGetPermissionsParams.deserialize(
            message.payload);
        return _impl.serviceGetPermissions(_SyncbaseServiceGetPermissionsResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kSyncbase_serviceGetPermissions_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kSyncbase_serviceSetPermissions_name:
        var params = SyncbaseServiceSetPermissionsParams.deserialize(
            message.payload);
        return _impl.serviceSetPermissions(params.perms,params.version,_SyncbaseServiceSetPermissionsResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kSyncbase_serviceSetPermissions_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kSyncbase_appCreate_name:
        var params = SyncbaseAppCreateParams.deserialize(
            message.payload);
        return _impl.appCreate(params.name,params.perms,_SyncbaseAppCreateResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kSyncbase_appCreate_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kSyncbase_appDelete_name:
        var params = SyncbaseAppDeleteParams.deserialize(
            message.payload);
        return _impl.appDelete(params.name,_SyncbaseAppDeleteResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kSyncbase_appDelete_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kSyncbase_appExists_name:
        var params = SyncbaseAppExistsParams.deserialize(
            message.payload);
        return _impl.appExists(params.name,_SyncbaseAppExistsResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kSyncbase_appExists_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kSyncbase_appGetPermissions_name:
        var params = SyncbaseAppGetPermissionsParams.deserialize(
            message.payload);
        return _impl.appGetPermissions(params.name,_SyncbaseAppGetPermissionsResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kSyncbase_appGetPermissions_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kSyncbase_appSetPermissions_name:
        var params = SyncbaseAppSetPermissionsParams.deserialize(
            message.payload);
        return _impl.appSetPermissions(params.name,params.perms,params.version,_SyncbaseAppSetPermissionsResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kSyncbase_appSetPermissions_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kSyncbase_dbCreate_name:
        var params = SyncbaseDbCreateParams.deserialize(
            message.payload);
        return _impl.dbCreate(params.name,params.perms,_SyncbaseDbCreateResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kSyncbase_dbCreate_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kSyncbase_dbDelete_name:
        var params = SyncbaseDbDeleteParams.deserialize(
            message.payload);
        return _impl.dbDelete(params.name,_SyncbaseDbDeleteResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kSyncbase_dbDelete_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kSyncbase_dbExists_name:
        var params = SyncbaseDbExistsParams.deserialize(
            message.payload);
        return _impl.dbExists(params.name,_SyncbaseDbExistsResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kSyncbase_dbExists_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kSyncbase_dbExec_name:
        var params = SyncbaseDbExecParams.deserialize(
            message.payload);
        return _impl.dbExec(params.query,_SyncbaseDbExecResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kSyncbase_dbExec_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kSyncbase_dbBeginBatch_name:
        var params = SyncbaseDbBeginBatchParams.deserialize(
            message.payload);
        return _impl.dbBeginBatch(params.name,params.bo,_SyncbaseDbBeginBatchResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kSyncbase_dbBeginBatch_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kSyncbase_dbCommit_name:
        var params = SyncbaseDbCommitParams.deserialize(
            message.payload);
        return _impl.dbCommit(params.name,_SyncbaseDbCommitResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kSyncbase_dbCommit_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kSyncbase_dbAbort_name:
        var params = SyncbaseDbAbortParams.deserialize(
            message.payload);
        return _impl.dbAbort(params.name,_SyncbaseDbAbortResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kSyncbase_dbAbort_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kSyncbase_dbGetPermissions_name:
        var params = SyncbaseDbGetPermissionsParams.deserialize(
            message.payload);
        return _impl.dbGetPermissions(params.name,_SyncbaseDbGetPermissionsResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kSyncbase_dbGetPermissions_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kSyncbase_dbSetPermissions_name:
        var params = SyncbaseDbSetPermissionsParams.deserialize(
            message.payload);
        return _impl.dbSetPermissions(params.name,params.perms,params.version,_SyncbaseDbSetPermissionsResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kSyncbase_dbSetPermissions_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kSyncbase_dbGetSyncGroupNames_name:
        var params = SyncbaseDbGetSyncGroupNamesParams.deserialize(
            message.payload);
        return _impl.dbGetSyncGroupNames(params.name,_SyncbaseDbGetSyncGroupNamesResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kSyncbase_dbGetSyncGroupNames_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kSyncbase_dbCreateSyncGroup_name:
        var params = SyncbaseDbCreateSyncGroupParams.deserialize(
            message.payload);
        return _impl.dbCreateSyncGroup(params.name,params.sgName,params.spec,params.myInfo,_SyncbaseDbCreateSyncGroupResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kSyncbase_dbCreateSyncGroup_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kSyncbase_dbJoinSyncGroup_name:
        var params = SyncbaseDbJoinSyncGroupParams.deserialize(
            message.payload);
        return _impl.dbJoinSyncGroup(params.name,params.sgName,params.myInfo,_SyncbaseDbJoinSyncGroupResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kSyncbase_dbJoinSyncGroup_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kSyncbase_dbLeaveSyncGroup_name:
        var params = SyncbaseDbLeaveSyncGroupParams.deserialize(
            message.payload);
        return _impl.dbLeaveSyncGroup(params.name,params.sgName,_SyncbaseDbLeaveSyncGroupResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kSyncbase_dbLeaveSyncGroup_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kSyncbase_dbDestroySyncGroup_name:
        var params = SyncbaseDbDestroySyncGroupParams.deserialize(
            message.payload);
        return _impl.dbDestroySyncGroup(params.name,params.sgName,_SyncbaseDbDestroySyncGroupResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kSyncbase_dbDestroySyncGroup_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kSyncbase_dbEjectFromSyncGroup_name:
        var params = SyncbaseDbEjectFromSyncGroupParams.deserialize(
            message.payload);
        return _impl.dbEjectFromSyncGroup(params.name,params.sgName,params.member,_SyncbaseDbEjectFromSyncGroupResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kSyncbase_dbEjectFromSyncGroup_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kSyncbase_dbGetSyncGroupSpec_name:
        var params = SyncbaseDbGetSyncGroupSpecParams.deserialize(
            message.payload);
        return _impl.dbGetSyncGroupSpec(params.name,params.sgName,_SyncbaseDbGetSyncGroupSpecResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kSyncbase_dbGetSyncGroupSpec_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kSyncbase_dbSetSyncGroupSpec_name:
        var params = SyncbaseDbSetSyncGroupSpecParams.deserialize(
            message.payload);
        return _impl.dbSetSyncGroupSpec(params.name,params.sgName,params.spec,params.version,_SyncbaseDbSetSyncGroupSpecResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kSyncbase_dbSetSyncGroupSpec_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kSyncbase_dbGetSyncGroupMembers_name:
        var params = SyncbaseDbGetSyncGroupMembersParams.deserialize(
            message.payload);
        return _impl.dbGetSyncGroupMembers(params.name,params.sgName,_SyncbaseDbGetSyncGroupMembersResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kSyncbase_dbGetSyncGroupMembers_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kSyncbase_tableCreate_name:
        var params = SyncbaseTableCreateParams.deserialize(
            message.payload);
        return _impl.tableCreate(params.name,params.perms,_SyncbaseTableCreateResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kSyncbase_tableCreate_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kSyncbase_tableDelete_name:
        var params = SyncbaseTableDeleteParams.deserialize(
            message.payload);
        return _impl.tableDelete(params.name,_SyncbaseTableDeleteResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kSyncbase_tableDelete_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kSyncbase_tableExists_name:
        var params = SyncbaseTableExistsParams.deserialize(
            message.payload);
        return _impl.tableExists(params.name,_SyncbaseTableExistsResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kSyncbase_tableExists_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kSyncbase_tableDeleteRowRange_name:
        var params = SyncbaseTableDeleteRowRangeParams.deserialize(
            message.payload);
        return _impl.tableDeleteRowRange(params.name,params.start,params.limit,_SyncbaseTableDeleteRowRangeResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kSyncbase_tableDeleteRowRange_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kSyncbase_tableScan_name:
        var params = SyncbaseTableScanParams.deserialize(
            message.payload);
        return _impl.tableScan(params.name,params.start,params.limit,_SyncbaseTableScanResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kSyncbase_tableScan_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kSyncbase_tableGetPermissions_name:
        var params = SyncbaseTableGetPermissionsParams.deserialize(
            message.payload);
        return _impl.tableGetPermissions(params.name,params.key,_SyncbaseTableGetPermissionsResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kSyncbase_tableGetPermissions_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kSyncbase_tableSetPermissions_name:
        var params = SyncbaseTableSetPermissionsParams.deserialize(
            message.payload);
        return _impl.tableSetPermissions(params.name,params.prefix,params.perms,_SyncbaseTableSetPermissionsResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kSyncbase_tableSetPermissions_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kSyncbase_tableDeletePermissions_name:
        var params = SyncbaseTableDeletePermissionsParams.deserialize(
            message.payload);
        return _impl.tableDeletePermissions(params.name,params.prefix,_SyncbaseTableDeletePermissionsResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kSyncbase_tableDeletePermissions_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kSyncbase_rowExists_name:
        var params = SyncbaseRowExistsParams.deserialize(
            message.payload);
        return _impl.rowExists(params.name,_SyncbaseRowExistsResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kSyncbase_rowExists_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kSyncbase_rowGet_name:
        var params = SyncbaseRowGetParams.deserialize(
            message.payload);
        return _impl.rowGet(params.name,_SyncbaseRowGetResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kSyncbase_rowGet_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kSyncbase_rowPut_name:
        var params = SyncbaseRowPutParams.deserialize(
            message.payload);
        return _impl.rowPut(params.name,params.value,_SyncbaseRowPutResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kSyncbase_rowPut_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kSyncbase_rowDelete_name:
        var params = SyncbaseRowDeleteParams.deserialize(
            message.payload);
        return _impl.rowDelete(params.name,_SyncbaseRowDeleteResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kSyncbase_rowDelete_name,
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

  Syncbase get impl => _impl;
  set impl(Syncbase d) {
    assert(_impl == null);
    _impl = d;
  }

  String toString() {
    var superString = super.toString();
    return "SyncbaseStub($superString)";
  }

  int get version => 0;
}


