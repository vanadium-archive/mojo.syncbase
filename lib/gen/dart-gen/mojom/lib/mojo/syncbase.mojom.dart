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
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
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

  Map toJson() {
    Map map = new Map();
    map["id"] = id;
    map["actionCode"] = actionCode;
    map["msg"] = msg;
    return map;
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
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
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

  Map toJson() {
    Map map = new Map();
    map["json"] = json;
    return map;
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
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
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

  Map toJson() {
    Map map = new Map();
    map["hint"] = hint;
    map["readOnly"] = readOnly;
    return map;
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
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
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

  Map toJson() {
    Map map = new Map();
    map["prefix"] = prefix;
    map["perms"] = perms;
    return map;
  }
}


class SyncgroupPrefix extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  String tableName = null;
  String rowPrefix = null;

  SyncgroupPrefix() : super(kVersions.last.size);

  static SyncgroupPrefix deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static SyncgroupPrefix decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncgroupPrefix result = new SyncgroupPrefix();

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
      
      result.tableName = decoder0.decodeString(8, false);
    }
    if (mainDataHeader.version >= 0) {
      
      result.rowPrefix = decoder0.decodeString(16, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(tableName, 8, false);
    
    encoder0.encodeString(rowPrefix, 16, false);
  }

  String toString() {
    return "SyncgroupPrefix("
           "tableName: $tableName" ", "
           "rowPrefix: $rowPrefix" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["tableName"] = tableName;
    map["rowPrefix"] = rowPrefix;
    return map;
  }
}


class SyncgroupSpec extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(48, 0)
  ];
  String description = null;
  Perms perms = null;
  List<SyncgroupPrefix> prefixes = null;
  List<String> mountTables = null;
  bool isPrivate = false;

  SyncgroupSpec() : super(kVersions.last.size);

  static SyncgroupSpec deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static SyncgroupSpec decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncgroupSpec result = new SyncgroupSpec();

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
        result.prefixes = new List<SyncgroupPrefix>(si1.numElements);
        for (int i1 = 0; i1 < si1.numElements; ++i1) {
          
          var decoder2 = decoder1.decodePointer(bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i1, false);
          result.prefixes[i1] = SyncgroupPrefix.decode(decoder2);
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
        
        encoder1.encodeStruct(prefixes[i0], bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i0, false);
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
    return "SyncgroupSpec("
           "description: $description" ", "
           "perms: $perms" ", "
           "prefixes: $prefixes" ", "
           "mountTables: $mountTables" ", "
           "isPrivate: $isPrivate" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["description"] = description;
    map["perms"] = perms;
    map["prefixes"] = prefixes;
    map["mountTables"] = mountTables;
    map["isPrivate"] = isPrivate;
    return map;
  }
}


class SyncgroupMemberInfo extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  int syncPriority = 0;

  SyncgroupMemberInfo() : super(kVersions.last.size);

  static SyncgroupMemberInfo deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static SyncgroupMemberInfo decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncgroupMemberInfo result = new SyncgroupMemberInfo();

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
    return "SyncgroupMemberInfo("
           "syncPriority: $syncPriority" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["syncPriority"] = syncPriority;
    return map;
  }
}


class Result extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  List<List<int>> values = null;

  Result() : super(kVersions.last.size);

  static Result deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static Result decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    Result result = new Result();

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
      {
        var si1 = decoder1.decodeDataHeaderForPointerArray(bindings.kUnspecifiedArrayLength);
        result.values = new List<List<int>>(si1.numElements);
        for (int i1 = 0; i1 < si1.numElements; ++i1) {
          
          result.values[i1] = decoder1.decodeUint8Array(bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i1, bindings.kNothingNullable, bindings.kUnspecifiedArrayLength);
        }
      }
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    if (values == null) {
      encoder0.encodeNullPointer(8, false);
    } else {
      var encoder1 = encoder0.encodePointerArray(values.length, 8, bindings.kUnspecifiedArrayLength);
      for (int i0 = 0; i0 < values.length; ++i0) {
        
        encoder1.encodeUint8Array(values[i0], bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i0, bindings.kNothingNullable, bindings.kUnspecifiedArrayLength);
      }
    }
  }

  String toString() {
    return "Result("
           "values: $values" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["values"] = values;
    return map;
  }
}


class KeyValue extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  String key = null;
  List<int> value = null;

  KeyValue() : super(kVersions.last.size);

  static KeyValue deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static KeyValue decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    KeyValue result = new KeyValue();

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
      
      result.key = decoder0.decodeString(8, false);
    }
    if (mainDataHeader.version >= 0) {
      
      result.value = decoder0.decodeUint8Array(16, bindings.kNothingNullable, bindings.kUnspecifiedArrayLength);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(key, 8, false);
    
    encoder0.encodeUint8Array(value, 16, bindings.kNothingNullable, bindings.kUnspecifiedArrayLength);
  }

  String toString() {
    return "KeyValue("
           "key: $key" ", "
           "value: $value" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["key"] = key;
    map["value"] = value;
    return map;
  }
}


class WatchChange extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(48, 0)
  ];
  String tableName = null;
  String rowKey = null;
  int changeType = 0;
  bool fromSync = false;
  bool continued = false;
  List<int> valueBytes = null;
  List<int> resumeMarker = null;

  WatchChange() : super(kVersions.last.size);

  static WatchChange deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static WatchChange decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    WatchChange result = new WatchChange();

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
      
      result.tableName = decoder0.decodeString(8, false);
    }
    if (mainDataHeader.version >= 0) {
      
      result.rowKey = decoder0.decodeString(16, false);
    }
    if (mainDataHeader.version >= 0) {
      
      result.changeType = decoder0.decodeUint32(24);
    }
    if (mainDataHeader.version >= 0) {
      
      result.fromSync = decoder0.decodeBool(28, 0);
    }
    if (mainDataHeader.version >= 0) {
      
      result.continued = decoder0.decodeBool(28, 1);
    }
    if (mainDataHeader.version >= 0) {
      
      result.valueBytes = decoder0.decodeUint8Array(32, bindings.kNothingNullable, bindings.kUnspecifiedArrayLength);
    }
    if (mainDataHeader.version >= 0) {
      
      result.resumeMarker = decoder0.decodeUint8Array(40, bindings.kNothingNullable, bindings.kUnspecifiedArrayLength);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(tableName, 8, false);
    
    encoder0.encodeString(rowKey, 16, false);
    
    encoder0.encodeUint32(changeType, 24);
    
    encoder0.encodeBool(fromSync, 28, 0);
    
    encoder0.encodeBool(continued, 28, 1);
    
    encoder0.encodeUint8Array(valueBytes, 32, bindings.kNothingNullable, bindings.kUnspecifiedArrayLength);
    
    encoder0.encodeUint8Array(resumeMarker, 40, bindings.kNothingNullable, bindings.kUnspecifiedArrayLength);
  }

  String toString() {
    return "WatchChange("
           "tableName: $tableName" ", "
           "rowKey: $rowKey" ", "
           "changeType: $changeType" ", "
           "fromSync: $fromSync" ", "
           "continued: $continued" ", "
           "valueBytes: $valueBytes" ", "
           "resumeMarker: $resumeMarker" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["tableName"] = tableName;
    map["rowKey"] = rowKey;
    map["changeType"] = changeType;
    map["fromSync"] = fromSync;
    map["continued"] = continued;
    map["valueBytes"] = valueBytes;
    map["resumeMarker"] = resumeMarker;
    return map;
  }
}


class GlobRequest extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  String pattern = null;
  List<int> resumeMarker = null;

  GlobRequest() : super(kVersions.last.size);

  static GlobRequest deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static GlobRequest decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    GlobRequest result = new GlobRequest();

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
      
      result.pattern = decoder0.decodeString(8, false);
    }
    if (mainDataHeader.version >= 0) {
      
      result.resumeMarker = decoder0.decodeUint8Array(16, bindings.kNothingNullable, bindings.kUnspecifiedArrayLength);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(pattern, 8, false);
    
    encoder0.encodeUint8Array(resumeMarker, 16, bindings.kNothingNullable, bindings.kUnspecifiedArrayLength);
  }

  String toString() {
    return "GlobRequest("
           "pattern: $pattern" ", "
           "resumeMarker: $resumeMarker" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["pattern"] = pattern;
    map["resumeMarker"] = resumeMarker;
    return map;
  }
}


class ExecStreamOnResultParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  Result result = null;

  ExecStreamOnResultParams() : super(kVersions.last.size);

  static ExecStreamOnResultParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static ExecStreamOnResultParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ExecStreamOnResultParams result = new ExecStreamOnResultParams();

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
      result.result = Result.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(result, 8, false);
  }

  String toString() {
    return "ExecStreamOnResultParams("
           "result: $result" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["result"] = result;
    return map;
  }
}


class ExecStreamOnResultResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(8, 0)
  ];

  ExecStreamOnResultResponseParams() : super(kVersions.last.size);

  static ExecStreamOnResultResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static ExecStreamOnResultResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ExecStreamOnResultResponseParams result = new ExecStreamOnResultResponseParams();

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
    return "ExecStreamOnResultResponseParams("")";
  }

  Map toJson() {
    Map map = new Map();
    return map;
  }
}


class ExecStreamOnDoneParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  Error err = null;

  ExecStreamOnDoneParams() : super(kVersions.last.size);

  static ExecStreamOnDoneParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static ExecStreamOnDoneParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ExecStreamOnDoneParams result = new ExecStreamOnDoneParams();

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
    return "ExecStreamOnDoneParams("
           "err: $err" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["err"] = err;
    return map;
  }
}


class ScanStreamOnKeyValueParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  KeyValue keyValue = null;

  ScanStreamOnKeyValueParams() : super(kVersions.last.size);

  static ScanStreamOnKeyValueParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static ScanStreamOnKeyValueParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ScanStreamOnKeyValueParams result = new ScanStreamOnKeyValueParams();

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
      result.keyValue = KeyValue.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(keyValue, 8, false);
  }

  String toString() {
    return "ScanStreamOnKeyValueParams("
           "keyValue: $keyValue" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["keyValue"] = keyValue;
    return map;
  }
}


class ScanStreamOnKeyValueResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(8, 0)
  ];

  ScanStreamOnKeyValueResponseParams() : super(kVersions.last.size);

  static ScanStreamOnKeyValueResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static ScanStreamOnKeyValueResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ScanStreamOnKeyValueResponseParams result = new ScanStreamOnKeyValueResponseParams();

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
    return "ScanStreamOnKeyValueResponseParams("")";
  }

  Map toJson() {
    Map map = new Map();
    return map;
  }
}


class ScanStreamOnDoneParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  Error err = null;

  ScanStreamOnDoneParams() : super(kVersions.last.size);

  static ScanStreamOnDoneParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static ScanStreamOnDoneParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ScanStreamOnDoneParams result = new ScanStreamOnDoneParams();

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
    return "ScanStreamOnDoneParams("
           "err: $err" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["err"] = err;
    return map;
  }
}


class WatchGlobStreamOnChangeParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  WatchChange change = null;

  WatchGlobStreamOnChangeParams() : super(kVersions.last.size);

  static WatchGlobStreamOnChangeParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static WatchGlobStreamOnChangeParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    WatchGlobStreamOnChangeParams result = new WatchGlobStreamOnChangeParams();

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
      result.change = WatchChange.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(change, 8, false);
  }

  String toString() {
    return "WatchGlobStreamOnChangeParams("
           "change: $change" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["change"] = change;
    return map;
  }
}


class WatchGlobStreamOnChangeResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(8, 0)
  ];

  WatchGlobStreamOnChangeResponseParams() : super(kVersions.last.size);

  static WatchGlobStreamOnChangeResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static WatchGlobStreamOnChangeResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    WatchGlobStreamOnChangeResponseParams result = new WatchGlobStreamOnChangeResponseParams();

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
    return "WatchGlobStreamOnChangeResponseParams("")";
  }

  Map toJson() {
    Map map = new Map();
    return map;
  }
}


class WatchGlobStreamOnErrorParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  Error err = null;

  WatchGlobStreamOnErrorParams() : super(kVersions.last.size);

  static WatchGlobStreamOnErrorParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static WatchGlobStreamOnErrorParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    WatchGlobStreamOnErrorParams result = new WatchGlobStreamOnErrorParams();

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
    return "WatchGlobStreamOnErrorParams("
           "err: $err" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["err"] = err;
    return map;
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
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
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

  Map toJson() {
    Map map = new Map();
    return map;
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
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
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

  Map toJson() {
    Map map = new Map();
    map["err"] = err;
    map["perms"] = perms;
    map["version"] = version;
    return map;
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
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
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

  Map toJson() {
    Map map = new Map();
    map["perms"] = perms;
    map["version"] = version;
    return map;
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
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
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

  Map toJson() {
    Map map = new Map();
    map["err"] = err;
    return map;
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
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
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

  Map toJson() {
    Map map = new Map();
    map["name"] = name;
    map["perms"] = perms;
    return map;
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
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
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

  Map toJson() {
    Map map = new Map();
    map["err"] = err;
    return map;
  }
}


class SyncbaseAppDestroyParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  String name = null;

  SyncbaseAppDestroyParams() : super(kVersions.last.size);

  static SyncbaseAppDestroyParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static SyncbaseAppDestroyParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseAppDestroyParams result = new SyncbaseAppDestroyParams();

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
    return "SyncbaseAppDestroyParams("
           "name: $name" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["name"] = name;
    return map;
  }
}


class SyncbaseAppDestroyResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  Error err = null;

  SyncbaseAppDestroyResponseParams() : super(kVersions.last.size);

  static SyncbaseAppDestroyResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static SyncbaseAppDestroyResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseAppDestroyResponseParams result = new SyncbaseAppDestroyResponseParams();

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
    return "SyncbaseAppDestroyResponseParams("
           "err: $err" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["err"] = err;
    return map;
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
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
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

  Map toJson() {
    Map map = new Map();
    map["name"] = name;
    return map;
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
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
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

  Map toJson() {
    Map map = new Map();
    map["err"] = err;
    map["exists"] = exists;
    return map;
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
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
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

  Map toJson() {
    Map map = new Map();
    map["name"] = name;
    return map;
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
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
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

  Map toJson() {
    Map map = new Map();
    map["err"] = err;
    map["perms"] = perms;
    map["version"] = version;
    return map;
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
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
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

  Map toJson() {
    Map map = new Map();
    map["name"] = name;
    map["perms"] = perms;
    map["version"] = version;
    return map;
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
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
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

  Map toJson() {
    Map map = new Map();
    map["err"] = err;
    return map;
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
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
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

  Map toJson() {
    Map map = new Map();
    map["name"] = name;
    map["perms"] = perms;
    return map;
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
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
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

  Map toJson() {
    Map map = new Map();
    map["err"] = err;
    return map;
  }
}


class SyncbaseDbDestroyParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  String name = null;

  SyncbaseDbDestroyParams() : super(kVersions.last.size);

  static SyncbaseDbDestroyParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static SyncbaseDbDestroyParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseDbDestroyParams result = new SyncbaseDbDestroyParams();

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
    return "SyncbaseDbDestroyParams("
           "name: $name" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["name"] = name;
    return map;
  }
}


class SyncbaseDbDestroyResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  Error err = null;

  SyncbaseDbDestroyResponseParams() : super(kVersions.last.size);

  static SyncbaseDbDestroyResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static SyncbaseDbDestroyResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseDbDestroyResponseParams result = new SyncbaseDbDestroyResponseParams();

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
    return "SyncbaseDbDestroyResponseParams("
           "err: $err" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["err"] = err;
    return map;
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
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
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

  Map toJson() {
    Map map = new Map();
    map["name"] = name;
    return map;
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
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
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

  Map toJson() {
    Map map = new Map();
    map["err"] = err;
    map["exists"] = exists;
    return map;
  }
}


class SyncbaseDbExecParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(32, 0)
  ];
  String name = null;
  String query = null;
  Object stream = null;

  SyncbaseDbExecParams() : super(kVersions.last.size);

  static SyncbaseDbExecParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
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
      
      result.name = decoder0.decodeString(8, false);
    }
    if (mainDataHeader.version >= 0) {
      
      result.query = decoder0.decodeString(16, false);
    }
    if (mainDataHeader.version >= 0) {
      
      result.stream = decoder0.decodeServiceInterface(24, false, ExecStreamProxy.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(name, 8, false);
    
    encoder0.encodeString(query, 16, false);
    
    encoder0.encodeInterface(stream, 24, false);
  }

  String toString() {
    return "SyncbaseDbExecParams("
           "name: $name" ", "
           "query: $query" ", "
           "stream: $stream" ")";
  }

  Map toJson() {
    throw new bindings.MojoCodecError(
        'Object containing handles cannot be encoded to JSON.');
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
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
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

  Map toJson() {
    Map map = new Map();
    map["err"] = err;
    return map;
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
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
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

  Map toJson() {
    Map map = new Map();
    map["name"] = name;
    map["bo"] = bo;
    return map;
  }
}


class SyncbaseDbBeginBatchResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  Error err = null;
  String batchSuffix = null;

  SyncbaseDbBeginBatchResponseParams() : super(kVersions.last.size);

  static SyncbaseDbBeginBatchResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
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
      
      result.batchSuffix = decoder0.decodeString(16, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(err, 8, false);
    
    encoder0.encodeString(batchSuffix, 16, false);
  }

  String toString() {
    return "SyncbaseDbBeginBatchResponseParams("
           "err: $err" ", "
           "batchSuffix: $batchSuffix" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["err"] = err;
    map["batchSuffix"] = batchSuffix;
    return map;
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
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
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

  Map toJson() {
    Map map = new Map();
    map["name"] = name;
    return map;
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
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
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

  Map toJson() {
    Map map = new Map();
    map["err"] = err;
    return map;
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
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
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

  Map toJson() {
    Map map = new Map();
    map["name"] = name;
    return map;
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
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
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

  Map toJson() {
    Map map = new Map();
    map["err"] = err;
    return map;
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
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
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

  Map toJson() {
    Map map = new Map();
    map["name"] = name;
    return map;
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
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
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

  Map toJson() {
    Map map = new Map();
    map["err"] = err;
    map["perms"] = perms;
    map["version"] = version;
    return map;
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
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
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

  Map toJson() {
    Map map = new Map();
    map["name"] = name;
    map["perms"] = perms;
    map["version"] = version;
    return map;
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
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
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

  Map toJson() {
    Map map = new Map();
    map["err"] = err;
    return map;
  }
}


class SyncbaseDbWatchGlobParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(32, 0)
  ];
  String name = null;
  GlobRequest req = null;
  Object stream = null;

  SyncbaseDbWatchGlobParams() : super(kVersions.last.size);

  static SyncbaseDbWatchGlobParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static SyncbaseDbWatchGlobParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseDbWatchGlobParams result = new SyncbaseDbWatchGlobParams();

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
      result.req = GlobRequest.decode(decoder1);
    }
    if (mainDataHeader.version >= 0) {
      
      result.stream = decoder0.decodeServiceInterface(24, false, WatchGlobStreamProxy.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(name, 8, false);
    
    encoder0.encodeStruct(req, 16, false);
    
    encoder0.encodeInterface(stream, 24, false);
  }

  String toString() {
    return "SyncbaseDbWatchGlobParams("
           "name: $name" ", "
           "req: $req" ", "
           "stream: $stream" ")";
  }

  Map toJson() {
    throw new bindings.MojoCodecError(
        'Object containing handles cannot be encoded to JSON.');
  }
}


class SyncbaseDbWatchGlobResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  Error err = null;

  SyncbaseDbWatchGlobResponseParams() : super(kVersions.last.size);

  static SyncbaseDbWatchGlobResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static SyncbaseDbWatchGlobResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseDbWatchGlobResponseParams result = new SyncbaseDbWatchGlobResponseParams();

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
    return "SyncbaseDbWatchGlobResponseParams("
           "err: $err" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["err"] = err;
    return map;
  }
}


class SyncbaseDbGetResumeMarkerParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  String name = null;

  SyncbaseDbGetResumeMarkerParams() : super(kVersions.last.size);

  static SyncbaseDbGetResumeMarkerParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static SyncbaseDbGetResumeMarkerParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseDbGetResumeMarkerParams result = new SyncbaseDbGetResumeMarkerParams();

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
    return "SyncbaseDbGetResumeMarkerParams("
           "name: $name" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["name"] = name;
    return map;
  }
}


class SyncbaseDbGetResumeMarkerResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  Error err = null;
  List<int> resumeMarker = null;

  SyncbaseDbGetResumeMarkerResponseParams() : super(kVersions.last.size);

  static SyncbaseDbGetResumeMarkerResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static SyncbaseDbGetResumeMarkerResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseDbGetResumeMarkerResponseParams result = new SyncbaseDbGetResumeMarkerResponseParams();

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
      
      result.resumeMarker = decoder0.decodeUint8Array(16, bindings.kNothingNullable, bindings.kUnspecifiedArrayLength);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(err, 8, false);
    
    encoder0.encodeUint8Array(resumeMarker, 16, bindings.kNothingNullable, bindings.kUnspecifiedArrayLength);
  }

  String toString() {
    return "SyncbaseDbGetResumeMarkerResponseParams("
           "err: $err" ", "
           "resumeMarker: $resumeMarker" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["err"] = err;
    map["resumeMarker"] = resumeMarker;
    return map;
  }
}


class SyncbaseDbListTablesParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  String name = null;

  SyncbaseDbListTablesParams() : super(kVersions.last.size);

  static SyncbaseDbListTablesParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static SyncbaseDbListTablesParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseDbListTablesParams result = new SyncbaseDbListTablesParams();

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
    return "SyncbaseDbListTablesParams("
           "name: $name" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["name"] = name;
    return map;
  }
}


class SyncbaseDbListTablesResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  Error err = null;
  List<String> tables = null;

  SyncbaseDbListTablesResponseParams() : super(kVersions.last.size);

  static SyncbaseDbListTablesResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static SyncbaseDbListTablesResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseDbListTablesResponseParams result = new SyncbaseDbListTablesResponseParams();

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
        result.tables = new List<String>(si1.numElements);
        for (int i1 = 0; i1 < si1.numElements; ++i1) {
          
          result.tables[i1] = decoder1.decodeString(bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i1, false);
        }
      }
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(err, 8, false);
    
    if (tables == null) {
      encoder0.encodeNullPointer(16, false);
    } else {
      var encoder1 = encoder0.encodePointerArray(tables.length, 16, bindings.kUnspecifiedArrayLength);
      for (int i0 = 0; i0 < tables.length; ++i0) {
        
        encoder1.encodeString(tables[i0], bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i0, false);
      }
    }
  }

  String toString() {
    return "SyncbaseDbListTablesResponseParams("
           "err: $err" ", "
           "tables: $tables" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["err"] = err;
    map["tables"] = tables;
    return map;
  }
}


class SyncbaseDbGetSyncgroupNamesParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  String name = null;

  SyncbaseDbGetSyncgroupNamesParams() : super(kVersions.last.size);

  static SyncbaseDbGetSyncgroupNamesParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static SyncbaseDbGetSyncgroupNamesParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseDbGetSyncgroupNamesParams result = new SyncbaseDbGetSyncgroupNamesParams();

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
    return "SyncbaseDbGetSyncgroupNamesParams("
           "name: $name" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["name"] = name;
    return map;
  }
}


class SyncbaseDbGetSyncgroupNamesResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  Error err = null;
  List<String> names = null;

  SyncbaseDbGetSyncgroupNamesResponseParams() : super(kVersions.last.size);

  static SyncbaseDbGetSyncgroupNamesResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static SyncbaseDbGetSyncgroupNamesResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseDbGetSyncgroupNamesResponseParams result = new SyncbaseDbGetSyncgroupNamesResponseParams();

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
    return "SyncbaseDbGetSyncgroupNamesResponseParams("
           "err: $err" ", "
           "names: $names" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["err"] = err;
    map["names"] = names;
    return map;
  }
}


class SyncbaseDbCreateSyncgroupParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(40, 0)
  ];
  String name = null;
  String sgName = null;
  SyncgroupSpec spec = null;
  SyncgroupMemberInfo myInfo = null;

  SyncbaseDbCreateSyncgroupParams() : super(kVersions.last.size);

  static SyncbaseDbCreateSyncgroupParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static SyncbaseDbCreateSyncgroupParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseDbCreateSyncgroupParams result = new SyncbaseDbCreateSyncgroupParams();

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
      result.spec = SyncgroupSpec.decode(decoder1);
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(32, false);
      result.myInfo = SyncgroupMemberInfo.decode(decoder1);
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
    return "SyncbaseDbCreateSyncgroupParams("
           "name: $name" ", "
           "sgName: $sgName" ", "
           "spec: $spec" ", "
           "myInfo: $myInfo" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["name"] = name;
    map["sgName"] = sgName;
    map["spec"] = spec;
    map["myInfo"] = myInfo;
    return map;
  }
}


class SyncbaseDbCreateSyncgroupResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  Error err = null;

  SyncbaseDbCreateSyncgroupResponseParams() : super(kVersions.last.size);

  static SyncbaseDbCreateSyncgroupResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static SyncbaseDbCreateSyncgroupResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseDbCreateSyncgroupResponseParams result = new SyncbaseDbCreateSyncgroupResponseParams();

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
    return "SyncbaseDbCreateSyncgroupResponseParams("
           "err: $err" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["err"] = err;
    return map;
  }
}


class SyncbaseDbJoinSyncgroupParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(32, 0)
  ];
  String name = null;
  String sgName = null;
  SyncgroupMemberInfo myInfo = null;

  SyncbaseDbJoinSyncgroupParams() : super(kVersions.last.size);

  static SyncbaseDbJoinSyncgroupParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static SyncbaseDbJoinSyncgroupParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseDbJoinSyncgroupParams result = new SyncbaseDbJoinSyncgroupParams();

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
      result.myInfo = SyncgroupMemberInfo.decode(decoder1);
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
    return "SyncbaseDbJoinSyncgroupParams("
           "name: $name" ", "
           "sgName: $sgName" ", "
           "myInfo: $myInfo" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["name"] = name;
    map["sgName"] = sgName;
    map["myInfo"] = myInfo;
    return map;
  }
}


class SyncbaseDbJoinSyncgroupResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  Error err = null;
  SyncgroupSpec spec = null;

  SyncbaseDbJoinSyncgroupResponseParams() : super(kVersions.last.size);

  static SyncbaseDbJoinSyncgroupResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static SyncbaseDbJoinSyncgroupResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseDbJoinSyncgroupResponseParams result = new SyncbaseDbJoinSyncgroupResponseParams();

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
      result.spec = SyncgroupSpec.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(err, 8, false);
    
    encoder0.encodeStruct(spec, 16, false);
  }

  String toString() {
    return "SyncbaseDbJoinSyncgroupResponseParams("
           "err: $err" ", "
           "spec: $spec" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["err"] = err;
    map["spec"] = spec;
    return map;
  }
}


class SyncbaseDbLeaveSyncgroupParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  String name = null;
  String sgName = null;

  SyncbaseDbLeaveSyncgroupParams() : super(kVersions.last.size);

  static SyncbaseDbLeaveSyncgroupParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static SyncbaseDbLeaveSyncgroupParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseDbLeaveSyncgroupParams result = new SyncbaseDbLeaveSyncgroupParams();

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
    return "SyncbaseDbLeaveSyncgroupParams("
           "name: $name" ", "
           "sgName: $sgName" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["name"] = name;
    map["sgName"] = sgName;
    return map;
  }
}


class SyncbaseDbLeaveSyncgroupResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  Error err = null;

  SyncbaseDbLeaveSyncgroupResponseParams() : super(kVersions.last.size);

  static SyncbaseDbLeaveSyncgroupResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static SyncbaseDbLeaveSyncgroupResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseDbLeaveSyncgroupResponseParams result = new SyncbaseDbLeaveSyncgroupResponseParams();

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
    return "SyncbaseDbLeaveSyncgroupResponseParams("
           "err: $err" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["err"] = err;
    return map;
  }
}


class SyncbaseDbDestroySyncgroupParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  String name = null;
  String sgName = null;

  SyncbaseDbDestroySyncgroupParams() : super(kVersions.last.size);

  static SyncbaseDbDestroySyncgroupParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static SyncbaseDbDestroySyncgroupParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseDbDestroySyncgroupParams result = new SyncbaseDbDestroySyncgroupParams();

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
    return "SyncbaseDbDestroySyncgroupParams("
           "name: $name" ", "
           "sgName: $sgName" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["name"] = name;
    map["sgName"] = sgName;
    return map;
  }
}


class SyncbaseDbDestroySyncgroupResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  Error err = null;

  SyncbaseDbDestroySyncgroupResponseParams() : super(kVersions.last.size);

  static SyncbaseDbDestroySyncgroupResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static SyncbaseDbDestroySyncgroupResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseDbDestroySyncgroupResponseParams result = new SyncbaseDbDestroySyncgroupResponseParams();

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
    return "SyncbaseDbDestroySyncgroupResponseParams("
           "err: $err" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["err"] = err;
    return map;
  }
}


class SyncbaseDbEjectFromSyncgroupParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(32, 0)
  ];
  String name = null;
  String sgName = null;
  String member = null;

  SyncbaseDbEjectFromSyncgroupParams() : super(kVersions.last.size);

  static SyncbaseDbEjectFromSyncgroupParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static SyncbaseDbEjectFromSyncgroupParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseDbEjectFromSyncgroupParams result = new SyncbaseDbEjectFromSyncgroupParams();

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
    return "SyncbaseDbEjectFromSyncgroupParams("
           "name: $name" ", "
           "sgName: $sgName" ", "
           "member: $member" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["name"] = name;
    map["sgName"] = sgName;
    map["member"] = member;
    return map;
  }
}


class SyncbaseDbEjectFromSyncgroupResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  Error err = null;

  SyncbaseDbEjectFromSyncgroupResponseParams() : super(kVersions.last.size);

  static SyncbaseDbEjectFromSyncgroupResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static SyncbaseDbEjectFromSyncgroupResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseDbEjectFromSyncgroupResponseParams result = new SyncbaseDbEjectFromSyncgroupResponseParams();

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
    return "SyncbaseDbEjectFromSyncgroupResponseParams("
           "err: $err" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["err"] = err;
    return map;
  }
}


class SyncbaseDbGetSyncgroupSpecParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  String name = null;
  String sgName = null;

  SyncbaseDbGetSyncgroupSpecParams() : super(kVersions.last.size);

  static SyncbaseDbGetSyncgroupSpecParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static SyncbaseDbGetSyncgroupSpecParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseDbGetSyncgroupSpecParams result = new SyncbaseDbGetSyncgroupSpecParams();

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
    return "SyncbaseDbGetSyncgroupSpecParams("
           "name: $name" ", "
           "sgName: $sgName" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["name"] = name;
    map["sgName"] = sgName;
    return map;
  }
}


class SyncbaseDbGetSyncgroupSpecResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(32, 0)
  ];
  Error err = null;
  SyncgroupSpec spec = null;
  String version = null;

  SyncbaseDbGetSyncgroupSpecResponseParams() : super(kVersions.last.size);

  static SyncbaseDbGetSyncgroupSpecResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static SyncbaseDbGetSyncgroupSpecResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseDbGetSyncgroupSpecResponseParams result = new SyncbaseDbGetSyncgroupSpecResponseParams();

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
      result.spec = SyncgroupSpec.decode(decoder1);
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
    return "SyncbaseDbGetSyncgroupSpecResponseParams("
           "err: $err" ", "
           "spec: $spec" ", "
           "version: $version" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["err"] = err;
    map["spec"] = spec;
    map["version"] = version;
    return map;
  }
}


class SyncbaseDbSetSyncgroupSpecParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(40, 0)
  ];
  String name = null;
  String sgName = null;
  SyncgroupSpec spec = null;
  String version = null;

  SyncbaseDbSetSyncgroupSpecParams() : super(kVersions.last.size);

  static SyncbaseDbSetSyncgroupSpecParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static SyncbaseDbSetSyncgroupSpecParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseDbSetSyncgroupSpecParams result = new SyncbaseDbSetSyncgroupSpecParams();

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
      result.spec = SyncgroupSpec.decode(decoder1);
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
    return "SyncbaseDbSetSyncgroupSpecParams("
           "name: $name" ", "
           "sgName: $sgName" ", "
           "spec: $spec" ", "
           "version: $version" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["name"] = name;
    map["sgName"] = sgName;
    map["spec"] = spec;
    map["version"] = version;
    return map;
  }
}


class SyncbaseDbSetSyncgroupSpecResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  Error err = null;

  SyncbaseDbSetSyncgroupSpecResponseParams() : super(kVersions.last.size);

  static SyncbaseDbSetSyncgroupSpecResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static SyncbaseDbSetSyncgroupSpecResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseDbSetSyncgroupSpecResponseParams result = new SyncbaseDbSetSyncgroupSpecResponseParams();

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
    return "SyncbaseDbSetSyncgroupSpecResponseParams("
           "err: $err" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["err"] = err;
    return map;
  }
}


class SyncbaseDbGetSyncgroupMembersParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  String name = null;
  String sgName = null;

  SyncbaseDbGetSyncgroupMembersParams() : super(kVersions.last.size);

  static SyncbaseDbGetSyncgroupMembersParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static SyncbaseDbGetSyncgroupMembersParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseDbGetSyncgroupMembersParams result = new SyncbaseDbGetSyncgroupMembersParams();

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
    return "SyncbaseDbGetSyncgroupMembersParams("
           "name: $name" ", "
           "sgName: $sgName" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["name"] = name;
    map["sgName"] = sgName;
    return map;
  }
}


class SyncbaseDbGetSyncgroupMembersResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  Error err = null;
  Map<String, SyncgroupMemberInfo> infos = null;

  SyncbaseDbGetSyncgroupMembersResponseParams() : super(kVersions.last.size);

  static SyncbaseDbGetSyncgroupMembersResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static SyncbaseDbGetSyncgroupMembersResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseDbGetSyncgroupMembersResponseParams result = new SyncbaseDbGetSyncgroupMembersResponseParams();

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
        List<SyncgroupMemberInfo> values0;
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
            values0 = new List<SyncgroupMemberInfo>(si2.numElements);
            for (int i2 = 0; i2 < si2.numElements; ++i2) {
              
              var decoder3 = decoder2.decodePointer(bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i2, false);
              values0[i2] = SyncgroupMemberInfo.decode(decoder3);
            }
          }
        }
        result.infos = new Map<String, SyncgroupMemberInfo>.fromIterables(
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
    return "SyncbaseDbGetSyncgroupMembersResponseParams("
           "err: $err" ", "
           "infos: $infos" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["err"] = err;
    map["infos"] = infos;
    return map;
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
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
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

  Map toJson() {
    Map map = new Map();
    map["name"] = name;
    map["perms"] = perms;
    return map;
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
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
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

  Map toJson() {
    Map map = new Map();
    map["err"] = err;
    return map;
  }
}


class SyncbaseTableDestroyParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  String name = null;

  SyncbaseTableDestroyParams() : super(kVersions.last.size);

  static SyncbaseTableDestroyParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static SyncbaseTableDestroyParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseTableDestroyParams result = new SyncbaseTableDestroyParams();

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
    return "SyncbaseTableDestroyParams("
           "name: $name" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["name"] = name;
    return map;
  }
}


class SyncbaseTableDestroyResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  Error err = null;

  SyncbaseTableDestroyResponseParams() : super(kVersions.last.size);

  static SyncbaseTableDestroyResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static SyncbaseTableDestroyResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseTableDestroyResponseParams result = new SyncbaseTableDestroyResponseParams();

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
    return "SyncbaseTableDestroyResponseParams("
           "err: $err" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["err"] = err;
    return map;
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
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
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

  Map toJson() {
    Map map = new Map();
    map["name"] = name;
    return map;
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
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
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

  Map toJson() {
    Map map = new Map();
    map["err"] = err;
    map["exists"] = exists;
    return map;
  }
}


class SyncbaseTableGetPermissionsParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  String name = null;

  SyncbaseTableGetPermissionsParams() : super(kVersions.last.size);

  static SyncbaseTableGetPermissionsParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
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
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(name, 8, false);
  }

  String toString() {
    return "SyncbaseTableGetPermissionsParams("
           "name: $name" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["name"] = name;
    return map;
  }
}


class SyncbaseTableGetPermissionsResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  Error err = null;
  Perms perms = null;

  SyncbaseTableGetPermissionsResponseParams() : super(kVersions.last.size);

  static SyncbaseTableGetPermissionsResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
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
      result.perms = Perms.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(err, 8, false);
    
    encoder0.encodeStruct(perms, 16, false);
  }

  String toString() {
    return "SyncbaseTableGetPermissionsResponseParams("
           "err: $err" ", "
           "perms: $perms" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["err"] = err;
    map["perms"] = perms;
    return map;
  }
}


class SyncbaseTableSetPermissionsParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  String name = null;
  Perms perms = null;

  SyncbaseTableSetPermissionsParams() : super(kVersions.last.size);

  static SyncbaseTableSetPermissionsParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
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
    return "SyncbaseTableSetPermissionsParams("
           "name: $name" ", "
           "perms: $perms" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["name"] = name;
    map["perms"] = perms;
    return map;
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
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
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

  Map toJson() {
    Map map = new Map();
    map["err"] = err;
    return map;
  }
}


class SyncbaseTableDeleteRangeParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(32, 0)
  ];
  String name = null;
  List<int> start = null;
  List<int> limit = null;

  SyncbaseTableDeleteRangeParams() : super(kVersions.last.size);

  static SyncbaseTableDeleteRangeParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static SyncbaseTableDeleteRangeParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseTableDeleteRangeParams result = new SyncbaseTableDeleteRangeParams();

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
    return "SyncbaseTableDeleteRangeParams("
           "name: $name" ", "
           "start: $start" ", "
           "limit: $limit" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["name"] = name;
    map["start"] = start;
    map["limit"] = limit;
    return map;
  }
}


class SyncbaseTableDeleteRangeResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  Error err = null;

  SyncbaseTableDeleteRangeResponseParams() : super(kVersions.last.size);

  static SyncbaseTableDeleteRangeResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static SyncbaseTableDeleteRangeResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseTableDeleteRangeResponseParams result = new SyncbaseTableDeleteRangeResponseParams();

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
    return "SyncbaseTableDeleteRangeResponseParams("
           "err: $err" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["err"] = err;
    return map;
  }
}


class SyncbaseTableScanParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(40, 0)
  ];
  String name = null;
  List<int> start = null;
  List<int> limit = null;
  Object stream = null;

  SyncbaseTableScanParams() : super(kVersions.last.size);

  static SyncbaseTableScanParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
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
    if (mainDataHeader.version >= 0) {
      
      result.stream = decoder0.decodeServiceInterface(32, false, ScanStreamProxy.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(name, 8, false);
    
    encoder0.encodeUint8Array(start, 16, bindings.kNothingNullable, bindings.kUnspecifiedArrayLength);
    
    encoder0.encodeUint8Array(limit, 24, bindings.kNothingNullable, bindings.kUnspecifiedArrayLength);
    
    encoder0.encodeInterface(stream, 32, false);
  }

  String toString() {
    return "SyncbaseTableScanParams("
           "name: $name" ", "
           "start: $start" ", "
           "limit: $limit" ", "
           "stream: $stream" ")";
  }

  Map toJson() {
    throw new bindings.MojoCodecError(
        'Object containing handles cannot be encoded to JSON.');
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
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
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

  Map toJson() {
    Map map = new Map();
    map["err"] = err;
    return map;
  }
}


class SyncbaseTableGetPrefixPermissionsParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  String name = null;
  String key = null;

  SyncbaseTableGetPrefixPermissionsParams() : super(kVersions.last.size);

  static SyncbaseTableGetPrefixPermissionsParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static SyncbaseTableGetPrefixPermissionsParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseTableGetPrefixPermissionsParams result = new SyncbaseTableGetPrefixPermissionsParams();

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
    return "SyncbaseTableGetPrefixPermissionsParams("
           "name: $name" ", "
           "key: $key" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["name"] = name;
    map["key"] = key;
    return map;
  }
}


class SyncbaseTableGetPrefixPermissionsResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  Error err = null;
  List<PrefixPerms> permsArr = null;

  SyncbaseTableGetPrefixPermissionsResponseParams() : super(kVersions.last.size);

  static SyncbaseTableGetPrefixPermissionsResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static SyncbaseTableGetPrefixPermissionsResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseTableGetPrefixPermissionsResponseParams result = new SyncbaseTableGetPrefixPermissionsResponseParams();

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
    return "SyncbaseTableGetPrefixPermissionsResponseParams("
           "err: $err" ", "
           "permsArr: $permsArr" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["err"] = err;
    map["permsArr"] = permsArr;
    return map;
  }
}


class SyncbaseTableSetPrefixPermissionsParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(32, 0)
  ];
  String name = null;
  String prefix = null;
  Perms perms = null;

  SyncbaseTableSetPrefixPermissionsParams() : super(kVersions.last.size);

  static SyncbaseTableSetPrefixPermissionsParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static SyncbaseTableSetPrefixPermissionsParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseTableSetPrefixPermissionsParams result = new SyncbaseTableSetPrefixPermissionsParams();

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
    return "SyncbaseTableSetPrefixPermissionsParams("
           "name: $name" ", "
           "prefix: $prefix" ", "
           "perms: $perms" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["name"] = name;
    map["prefix"] = prefix;
    map["perms"] = perms;
    return map;
  }
}


class SyncbaseTableSetPrefixPermissionsResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  Error err = null;

  SyncbaseTableSetPrefixPermissionsResponseParams() : super(kVersions.last.size);

  static SyncbaseTableSetPrefixPermissionsResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static SyncbaseTableSetPrefixPermissionsResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseTableSetPrefixPermissionsResponseParams result = new SyncbaseTableSetPrefixPermissionsResponseParams();

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
    return "SyncbaseTableSetPrefixPermissionsResponseParams("
           "err: $err" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["err"] = err;
    return map;
  }
}


class SyncbaseTableDeletePrefixPermissionsParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  String name = null;
  String prefix = null;

  SyncbaseTableDeletePrefixPermissionsParams() : super(kVersions.last.size);

  static SyncbaseTableDeletePrefixPermissionsParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static SyncbaseTableDeletePrefixPermissionsParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseTableDeletePrefixPermissionsParams result = new SyncbaseTableDeletePrefixPermissionsParams();

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
    return "SyncbaseTableDeletePrefixPermissionsParams("
           "name: $name" ", "
           "prefix: $prefix" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["name"] = name;
    map["prefix"] = prefix;
    return map;
  }
}


class SyncbaseTableDeletePrefixPermissionsResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  Error err = null;

  SyncbaseTableDeletePrefixPermissionsResponseParams() : super(kVersions.last.size);

  static SyncbaseTableDeletePrefixPermissionsResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static SyncbaseTableDeletePrefixPermissionsResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseTableDeletePrefixPermissionsResponseParams result = new SyncbaseTableDeletePrefixPermissionsResponseParams();

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
    return "SyncbaseTableDeletePrefixPermissionsResponseParams("
           "err: $err" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["err"] = err;
    return map;
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
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
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

  Map toJson() {
    Map map = new Map();
    map["name"] = name;
    return map;
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
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
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

  Map toJson() {
    Map map = new Map();
    map["err"] = err;
    map["exists"] = exists;
    return map;
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
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
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

  Map toJson() {
    Map map = new Map();
    map["name"] = name;
    return map;
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
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
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

  Map toJson() {
    Map map = new Map();
    map["err"] = err;
    map["value"] = value;
    return map;
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
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
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

  Map toJson() {
    Map map = new Map();
    map["name"] = name;
    map["value"] = value;
    return map;
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
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
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

  Map toJson() {
    Map map = new Map();
    map["err"] = err;
    return map;
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
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
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

  Map toJson() {
    Map map = new Map();
    map["name"] = name;
    return map;
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
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
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

  Map toJson() {
    Map map = new Map();
    map["err"] = err;
    return map;
  }
}

const int kExecStream_onResult_name = 0;
const int kExecStream_onDone_name = 1;

const String ExecStreamName =
      'mojo::ExecStream';

abstract class ExecStream {
  dynamic onResult(Result result,[Function responseFactory = null]);
  void onDone(Error err);

}


class ExecStreamProxyImpl extends bindings.Proxy {
  ExecStreamProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  ExecStreamProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  ExecStreamProxyImpl.unbound() : super.unbound();

  static ExecStreamProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For ExecStreamProxyImpl"));
    return new ExecStreamProxyImpl.fromEndpoint(endpoint);
  }

  String get name => ExecStreamName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kExecStream_onResult_name:
        var r = ExecStreamOnResultResponseParams.deserialize(
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
    return "ExecStreamProxyImpl($superString)";
  }
}


class _ExecStreamProxyCalls implements ExecStream {
  ExecStreamProxyImpl _proxyImpl;

  _ExecStreamProxyCalls(this._proxyImpl);
    dynamic onResult(Result result,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new ExecStreamOnResultParams();
      params.result = result;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kExecStream_onResult_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    void onDone(Error err) {
      assert(_proxyImpl.isBound);
      var params = new ExecStreamOnDoneParams();
      params.err = err;
      _proxyImpl.sendMessage(params, kExecStream_onDone_name);
    }
  
}


class ExecStreamProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  ExecStream ptr;
  final String name = ExecStreamName;

  ExecStreamProxy(ExecStreamProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _ExecStreamProxyCalls(proxyImpl);

  ExecStreamProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new ExecStreamProxyImpl.fromEndpoint(endpoint) {
    ptr = new _ExecStreamProxyCalls(impl);
  }

  ExecStreamProxy.fromHandle(core.MojoHandle handle) :
      impl = new ExecStreamProxyImpl.fromHandle(handle) {
    ptr = new _ExecStreamProxyCalls(impl);
  }

  ExecStreamProxy.unbound() :
      impl = new ExecStreamProxyImpl.unbound() {
    ptr = new _ExecStreamProxyCalls(impl);
  }

  factory ExecStreamProxy.connectToService(
      bindings.ServiceConnector s, String url) {
    ExecStreamProxy p = new ExecStreamProxy.unbound();
    s.connectToService(url, p);
    return p;
  }

  static ExecStreamProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For ExecStreamProxy"));
    return new ExecStreamProxy.fromEndpoint(endpoint);
  }

  Future close({bool immediate: false}) => impl.close(immediate: immediate);

  int get version => impl.version;

  Future<int> queryVersion() => impl.queryVersion();

  void requireVersion(int requiredVersion) {
    impl.requireVersion(requiredVersion);
  }

  String toString() {
    return "ExecStreamProxy($impl)";
  }
}


class ExecStreamStub extends bindings.Stub {
  ExecStream _impl = null;

  ExecStreamStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [this._impl])
      : super.fromEndpoint(endpoint);

  ExecStreamStub.fromHandle(core.MojoHandle handle, [this._impl])
      : super.fromHandle(handle);

  ExecStreamStub.unbound() : super.unbound();

  static ExecStreamStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For ExecStreamStub"));
    return new ExecStreamStub.fromEndpoint(endpoint);
  }

  static const String name = ExecStreamName;


  ExecStreamOnResultResponseParams _ExecStreamOnResultResponseParamsFactory() {
    var result = new ExecStreamOnResultResponseParams();
    return result;
  }

  dynamic handleMessage(bindings.ServiceMessage message) {
    if (bindings.ControlMessageHandler.isControlMessage(message)) {
      return bindings.ControlMessageHandler.handleMessage(this,
                                                          0,
                                                          message);
    }
    assert(_impl != null);
    switch (message.header.type) {
      case kExecStream_onResult_name:
        var params = ExecStreamOnResultParams.deserialize(
            message.payload);
        var response = _impl.onResult(params.result,_ExecStreamOnResultResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  kExecStream_onResult_name,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              kExecStream_onResult_name,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case kExecStream_onDone_name:
        var params = ExecStreamOnDoneParams.deserialize(
            message.payload);
        _impl.onDone(params.err);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  ExecStream get impl => _impl;
  set impl(ExecStream d) {
    assert(_impl == null);
    _impl = d;
  }

  String toString() {
    var superString = super.toString();
    return "ExecStreamStub($superString)";
  }

  int get version => 0;
}

const int kScanStream_onKeyValue_name = 0;
const int kScanStream_onDone_name = 1;

const String ScanStreamName =
      'mojo::ScanStream';

abstract class ScanStream {
  dynamic onKeyValue(KeyValue keyValue,[Function responseFactory = null]);
  void onDone(Error err);

}


class ScanStreamProxyImpl extends bindings.Proxy {
  ScanStreamProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  ScanStreamProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  ScanStreamProxyImpl.unbound() : super.unbound();

  static ScanStreamProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For ScanStreamProxyImpl"));
    return new ScanStreamProxyImpl.fromEndpoint(endpoint);
  }

  String get name => ScanStreamName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kScanStream_onKeyValue_name:
        var r = ScanStreamOnKeyValueResponseParams.deserialize(
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
    return "ScanStreamProxyImpl($superString)";
  }
}


class _ScanStreamProxyCalls implements ScanStream {
  ScanStreamProxyImpl _proxyImpl;

  _ScanStreamProxyCalls(this._proxyImpl);
    dynamic onKeyValue(KeyValue keyValue,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new ScanStreamOnKeyValueParams();
      params.keyValue = keyValue;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kScanStream_onKeyValue_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    void onDone(Error err) {
      assert(_proxyImpl.isBound);
      var params = new ScanStreamOnDoneParams();
      params.err = err;
      _proxyImpl.sendMessage(params, kScanStream_onDone_name);
    }
  
}


class ScanStreamProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  ScanStream ptr;
  final String name = ScanStreamName;

  ScanStreamProxy(ScanStreamProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _ScanStreamProxyCalls(proxyImpl);

  ScanStreamProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new ScanStreamProxyImpl.fromEndpoint(endpoint) {
    ptr = new _ScanStreamProxyCalls(impl);
  }

  ScanStreamProxy.fromHandle(core.MojoHandle handle) :
      impl = new ScanStreamProxyImpl.fromHandle(handle) {
    ptr = new _ScanStreamProxyCalls(impl);
  }

  ScanStreamProxy.unbound() :
      impl = new ScanStreamProxyImpl.unbound() {
    ptr = new _ScanStreamProxyCalls(impl);
  }

  factory ScanStreamProxy.connectToService(
      bindings.ServiceConnector s, String url) {
    ScanStreamProxy p = new ScanStreamProxy.unbound();
    s.connectToService(url, p);
    return p;
  }

  static ScanStreamProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For ScanStreamProxy"));
    return new ScanStreamProxy.fromEndpoint(endpoint);
  }

  Future close({bool immediate: false}) => impl.close(immediate: immediate);

  int get version => impl.version;

  Future<int> queryVersion() => impl.queryVersion();

  void requireVersion(int requiredVersion) {
    impl.requireVersion(requiredVersion);
  }

  String toString() {
    return "ScanStreamProxy($impl)";
  }
}


class ScanStreamStub extends bindings.Stub {
  ScanStream _impl = null;

  ScanStreamStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [this._impl])
      : super.fromEndpoint(endpoint);

  ScanStreamStub.fromHandle(core.MojoHandle handle, [this._impl])
      : super.fromHandle(handle);

  ScanStreamStub.unbound() : super.unbound();

  static ScanStreamStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For ScanStreamStub"));
    return new ScanStreamStub.fromEndpoint(endpoint);
  }

  static const String name = ScanStreamName;


  ScanStreamOnKeyValueResponseParams _ScanStreamOnKeyValueResponseParamsFactory() {
    var result = new ScanStreamOnKeyValueResponseParams();
    return result;
  }

  dynamic handleMessage(bindings.ServiceMessage message) {
    if (bindings.ControlMessageHandler.isControlMessage(message)) {
      return bindings.ControlMessageHandler.handleMessage(this,
                                                          0,
                                                          message);
    }
    assert(_impl != null);
    switch (message.header.type) {
      case kScanStream_onKeyValue_name:
        var params = ScanStreamOnKeyValueParams.deserialize(
            message.payload);
        var response = _impl.onKeyValue(params.keyValue,_ScanStreamOnKeyValueResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  kScanStream_onKeyValue_name,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              kScanStream_onKeyValue_name,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case kScanStream_onDone_name:
        var params = ScanStreamOnDoneParams.deserialize(
            message.payload);
        _impl.onDone(params.err);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  ScanStream get impl => _impl;
  set impl(ScanStream d) {
    assert(_impl == null);
    _impl = d;
  }

  String toString() {
    var superString = super.toString();
    return "ScanStreamStub($superString)";
  }

  int get version => 0;
}

const int kWatchGlobStream_onChange_name = 0;
const int kWatchGlobStream_onError_name = 1;

const String WatchGlobStreamName =
      'mojo::WatchGlobStream';

abstract class WatchGlobStream {
  dynamic onChange(WatchChange change,[Function responseFactory = null]);
  void onError(Error err);

}


class WatchGlobStreamProxyImpl extends bindings.Proxy {
  WatchGlobStreamProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  WatchGlobStreamProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  WatchGlobStreamProxyImpl.unbound() : super.unbound();

  static WatchGlobStreamProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For WatchGlobStreamProxyImpl"));
    return new WatchGlobStreamProxyImpl.fromEndpoint(endpoint);
  }

  String get name => WatchGlobStreamName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kWatchGlobStream_onChange_name:
        var r = WatchGlobStreamOnChangeResponseParams.deserialize(
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
    return "WatchGlobStreamProxyImpl($superString)";
  }
}


class _WatchGlobStreamProxyCalls implements WatchGlobStream {
  WatchGlobStreamProxyImpl _proxyImpl;

  _WatchGlobStreamProxyCalls(this._proxyImpl);
    dynamic onChange(WatchChange change,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new WatchGlobStreamOnChangeParams();
      params.change = change;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kWatchGlobStream_onChange_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    void onError(Error err) {
      assert(_proxyImpl.isBound);
      var params = new WatchGlobStreamOnErrorParams();
      params.err = err;
      _proxyImpl.sendMessage(params, kWatchGlobStream_onError_name);
    }
  
}


class WatchGlobStreamProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  WatchGlobStream ptr;
  final String name = WatchGlobStreamName;

  WatchGlobStreamProxy(WatchGlobStreamProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _WatchGlobStreamProxyCalls(proxyImpl);

  WatchGlobStreamProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new WatchGlobStreamProxyImpl.fromEndpoint(endpoint) {
    ptr = new _WatchGlobStreamProxyCalls(impl);
  }

  WatchGlobStreamProxy.fromHandle(core.MojoHandle handle) :
      impl = new WatchGlobStreamProxyImpl.fromHandle(handle) {
    ptr = new _WatchGlobStreamProxyCalls(impl);
  }

  WatchGlobStreamProxy.unbound() :
      impl = new WatchGlobStreamProxyImpl.unbound() {
    ptr = new _WatchGlobStreamProxyCalls(impl);
  }

  factory WatchGlobStreamProxy.connectToService(
      bindings.ServiceConnector s, String url) {
    WatchGlobStreamProxy p = new WatchGlobStreamProxy.unbound();
    s.connectToService(url, p);
    return p;
  }

  static WatchGlobStreamProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For WatchGlobStreamProxy"));
    return new WatchGlobStreamProxy.fromEndpoint(endpoint);
  }

  Future close({bool immediate: false}) => impl.close(immediate: immediate);

  int get version => impl.version;

  Future<int> queryVersion() => impl.queryVersion();

  void requireVersion(int requiredVersion) {
    impl.requireVersion(requiredVersion);
  }

  String toString() {
    return "WatchGlobStreamProxy($impl)";
  }
}


class WatchGlobStreamStub extends bindings.Stub {
  WatchGlobStream _impl = null;

  WatchGlobStreamStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [this._impl])
      : super.fromEndpoint(endpoint);

  WatchGlobStreamStub.fromHandle(core.MojoHandle handle, [this._impl])
      : super.fromHandle(handle);

  WatchGlobStreamStub.unbound() : super.unbound();

  static WatchGlobStreamStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For WatchGlobStreamStub"));
    return new WatchGlobStreamStub.fromEndpoint(endpoint);
  }

  static const String name = WatchGlobStreamName;


  WatchGlobStreamOnChangeResponseParams _WatchGlobStreamOnChangeResponseParamsFactory() {
    var result = new WatchGlobStreamOnChangeResponseParams();
    return result;
  }

  dynamic handleMessage(bindings.ServiceMessage message) {
    if (bindings.ControlMessageHandler.isControlMessage(message)) {
      return bindings.ControlMessageHandler.handleMessage(this,
                                                          0,
                                                          message);
    }
    assert(_impl != null);
    switch (message.header.type) {
      case kWatchGlobStream_onChange_name:
        var params = WatchGlobStreamOnChangeParams.deserialize(
            message.payload);
        var response = _impl.onChange(params.change,_WatchGlobStreamOnChangeResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  kWatchGlobStream_onChange_name,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              kWatchGlobStream_onChange_name,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case kWatchGlobStream_onError_name:
        var params = WatchGlobStreamOnErrorParams.deserialize(
            message.payload);
        _impl.onError(params.err);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  WatchGlobStream get impl => _impl;
  set impl(WatchGlobStream d) {
    assert(_impl == null);
    _impl = d;
  }

  String toString() {
    var superString = super.toString();
    return "WatchGlobStreamStub($superString)";
  }

  int get version => 0;
}

const int kSyncbase_serviceGetPermissions_name = 0;
const int kSyncbase_serviceSetPermissions_name = 1;
const int kSyncbase_appCreate_name = 2;
const int kSyncbase_appDestroy_name = 3;
const int kSyncbase_appExists_name = 4;
const int kSyncbase_appGetPermissions_name = 5;
const int kSyncbase_appSetPermissions_name = 6;
const int kSyncbase_dbCreate_name = 7;
const int kSyncbase_dbDestroy_name = 8;
const int kSyncbase_dbExists_name = 9;
const int kSyncbase_dbExec_name = 10;
const int kSyncbase_dbBeginBatch_name = 11;
const int kSyncbase_dbCommit_name = 12;
const int kSyncbase_dbAbort_name = 13;
const int kSyncbase_dbGetPermissions_name = 14;
const int kSyncbase_dbSetPermissions_name = 15;
const int kSyncbase_dbWatchGlob_name = 16;
const int kSyncbase_dbGetResumeMarker_name = 17;
const int kSyncbase_dbListTables_name = 18;
const int kSyncbase_dbGetSyncgroupNames_name = 19;
const int kSyncbase_dbCreateSyncgroup_name = 20;
const int kSyncbase_dbJoinSyncgroup_name = 21;
const int kSyncbase_dbLeaveSyncgroup_name = 22;
const int kSyncbase_dbDestroySyncgroup_name = 23;
const int kSyncbase_dbEjectFromSyncgroup_name = 24;
const int kSyncbase_dbGetSyncgroupSpec_name = 25;
const int kSyncbase_dbSetSyncgroupSpec_name = 26;
const int kSyncbase_dbGetSyncgroupMembers_name = 27;
const int kSyncbase_tableCreate_name = 28;
const int kSyncbase_tableDestroy_name = 29;
const int kSyncbase_tableExists_name = 30;
const int kSyncbase_tableGetPermissions_name = 31;
const int kSyncbase_tableSetPermissions_name = 32;
const int kSyncbase_tableDeleteRange_name = 33;
const int kSyncbase_tableScan_name = 34;
const int kSyncbase_tableGetPrefixPermissions_name = 35;
const int kSyncbase_tableSetPrefixPermissions_name = 36;
const int kSyncbase_tableDeletePrefixPermissions_name = 37;
const int kSyncbase_rowExists_name = 38;
const int kSyncbase_rowGet_name = 39;
const int kSyncbase_rowPut_name = 40;
const int kSyncbase_rowDelete_name = 41;

const String SyncbaseName =
      'mojo::Syncbase';

abstract class Syncbase {
  dynamic serviceGetPermissions([Function responseFactory = null]);
  dynamic serviceSetPermissions(Perms perms,String version,[Function responseFactory = null]);
  dynamic appCreate(String name,Perms perms,[Function responseFactory = null]);
  dynamic appDestroy(String name,[Function responseFactory = null]);
  dynamic appExists(String name,[Function responseFactory = null]);
  dynamic appGetPermissions(String name,[Function responseFactory = null]);
  dynamic appSetPermissions(String name,Perms perms,String version,[Function responseFactory = null]);
  dynamic dbCreate(String name,Perms perms,[Function responseFactory = null]);
  dynamic dbDestroy(String name,[Function responseFactory = null]);
  dynamic dbExists(String name,[Function responseFactory = null]);
  dynamic dbExec(String name,String query,Object stream,[Function responseFactory = null]);
  dynamic dbBeginBatch(String name,BatchOptions bo,[Function responseFactory = null]);
  dynamic dbCommit(String name,[Function responseFactory = null]);
  dynamic dbAbort(String name,[Function responseFactory = null]);
  dynamic dbGetPermissions(String name,[Function responseFactory = null]);
  dynamic dbSetPermissions(String name,Perms perms,String version,[Function responseFactory = null]);
  dynamic dbWatchGlob(String name,GlobRequest req,Object stream,[Function responseFactory = null]);
  dynamic dbGetResumeMarker(String name,[Function responseFactory = null]);
  dynamic dbListTables(String name,[Function responseFactory = null]);
  dynamic dbGetSyncgroupNames(String name,[Function responseFactory = null]);
  dynamic dbCreateSyncgroup(String name,String sgName,SyncgroupSpec spec,SyncgroupMemberInfo myInfo,[Function responseFactory = null]);
  dynamic dbJoinSyncgroup(String name,String sgName,SyncgroupMemberInfo myInfo,[Function responseFactory = null]);
  dynamic dbLeaveSyncgroup(String name,String sgName,[Function responseFactory = null]);
  dynamic dbDestroySyncgroup(String name,String sgName,[Function responseFactory = null]);
  dynamic dbEjectFromSyncgroup(String name,String sgName,String member,[Function responseFactory = null]);
  dynamic dbGetSyncgroupSpec(String name,String sgName,[Function responseFactory = null]);
  dynamic dbSetSyncgroupSpec(String name,String sgName,SyncgroupSpec spec,String version,[Function responseFactory = null]);
  dynamic dbGetSyncgroupMembers(String name,String sgName,[Function responseFactory = null]);
  dynamic tableCreate(String name,Perms perms,[Function responseFactory = null]);
  dynamic tableDestroy(String name,[Function responseFactory = null]);
  dynamic tableExists(String name,[Function responseFactory = null]);
  dynamic tableGetPermissions(String name,[Function responseFactory = null]);
  dynamic tableSetPermissions(String name,Perms perms,[Function responseFactory = null]);
  dynamic tableDeleteRange(String name,List<int> start,List<int> limit,[Function responseFactory = null]);
  dynamic tableScan(String name,List<int> start,List<int> limit,Object stream,[Function responseFactory = null]);
  dynamic tableGetPrefixPermissions(String name,String key,[Function responseFactory = null]);
  dynamic tableSetPrefixPermissions(String name,String prefix,Perms perms,[Function responseFactory = null]);
  dynamic tableDeletePrefixPermissions(String name,String prefix,[Function responseFactory = null]);
  dynamic rowExists(String name,[Function responseFactory = null]);
  dynamic rowGet(String name,[Function responseFactory = null]);
  dynamic rowPut(String name,List<int> value,[Function responseFactory = null]);
  dynamic rowDelete(String name,[Function responseFactory = null]);

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
      case kSyncbase_appDestroy_name:
        var r = SyncbaseAppDestroyResponseParams.deserialize(
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
      case kSyncbase_dbDestroy_name:
        var r = SyncbaseDbDestroyResponseParams.deserialize(
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
      case kSyncbase_dbWatchGlob_name:
        var r = SyncbaseDbWatchGlobResponseParams.deserialize(
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
      case kSyncbase_dbGetResumeMarker_name:
        var r = SyncbaseDbGetResumeMarkerResponseParams.deserialize(
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
      case kSyncbase_dbListTables_name:
        var r = SyncbaseDbListTablesResponseParams.deserialize(
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
      case kSyncbase_dbGetSyncgroupNames_name:
        var r = SyncbaseDbGetSyncgroupNamesResponseParams.deserialize(
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
      case kSyncbase_dbCreateSyncgroup_name:
        var r = SyncbaseDbCreateSyncgroupResponseParams.deserialize(
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
      case kSyncbase_dbJoinSyncgroup_name:
        var r = SyncbaseDbJoinSyncgroupResponseParams.deserialize(
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
      case kSyncbase_dbLeaveSyncgroup_name:
        var r = SyncbaseDbLeaveSyncgroupResponseParams.deserialize(
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
      case kSyncbase_dbDestroySyncgroup_name:
        var r = SyncbaseDbDestroySyncgroupResponseParams.deserialize(
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
      case kSyncbase_dbEjectFromSyncgroup_name:
        var r = SyncbaseDbEjectFromSyncgroupResponseParams.deserialize(
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
      case kSyncbase_dbGetSyncgroupSpec_name:
        var r = SyncbaseDbGetSyncgroupSpecResponseParams.deserialize(
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
      case kSyncbase_dbSetSyncgroupSpec_name:
        var r = SyncbaseDbSetSyncgroupSpecResponseParams.deserialize(
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
      case kSyncbase_dbGetSyncgroupMembers_name:
        var r = SyncbaseDbGetSyncgroupMembersResponseParams.deserialize(
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
      case kSyncbase_tableDestroy_name:
        var r = SyncbaseTableDestroyResponseParams.deserialize(
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
      case kSyncbase_tableDeleteRange_name:
        var r = SyncbaseTableDeleteRangeResponseParams.deserialize(
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
      case kSyncbase_tableGetPrefixPermissions_name:
        var r = SyncbaseTableGetPrefixPermissionsResponseParams.deserialize(
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
      case kSyncbase_tableSetPrefixPermissions_name:
        var r = SyncbaseTableSetPrefixPermissionsResponseParams.deserialize(
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
      case kSyncbase_tableDeletePrefixPermissions_name:
        var r = SyncbaseTableDeletePrefixPermissionsResponseParams.deserialize(
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
    dynamic serviceGetPermissions([Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new SyncbaseServiceGetPermissionsParams();
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kSyncbase_serviceGetPermissions_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic serviceSetPermissions(Perms perms,String version,[Function responseFactory = null]) {
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
    dynamic appCreate(String name,Perms perms,[Function responseFactory = null]) {
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
    dynamic appDestroy(String name,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new SyncbaseAppDestroyParams();
      params.name = name;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kSyncbase_appDestroy_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic appExists(String name,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new SyncbaseAppExistsParams();
      params.name = name;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kSyncbase_appExists_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic appGetPermissions(String name,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new SyncbaseAppGetPermissionsParams();
      params.name = name;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kSyncbase_appGetPermissions_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic appSetPermissions(String name,Perms perms,String version,[Function responseFactory = null]) {
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
    dynamic dbCreate(String name,Perms perms,[Function responseFactory = null]) {
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
    dynamic dbDestroy(String name,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new SyncbaseDbDestroyParams();
      params.name = name;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kSyncbase_dbDestroy_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic dbExists(String name,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new SyncbaseDbExistsParams();
      params.name = name;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kSyncbase_dbExists_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic dbExec(String name,String query,Object stream,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new SyncbaseDbExecParams();
      params.name = name;
      params.query = query;
      params.stream = stream;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kSyncbase_dbExec_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic dbBeginBatch(String name,BatchOptions bo,[Function responseFactory = null]) {
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
    dynamic dbCommit(String name,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new SyncbaseDbCommitParams();
      params.name = name;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kSyncbase_dbCommit_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic dbAbort(String name,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new SyncbaseDbAbortParams();
      params.name = name;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kSyncbase_dbAbort_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic dbGetPermissions(String name,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new SyncbaseDbGetPermissionsParams();
      params.name = name;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kSyncbase_dbGetPermissions_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic dbSetPermissions(String name,Perms perms,String version,[Function responseFactory = null]) {
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
    dynamic dbWatchGlob(String name,GlobRequest req,Object stream,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new SyncbaseDbWatchGlobParams();
      params.name = name;
      params.req = req;
      params.stream = stream;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kSyncbase_dbWatchGlob_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic dbGetResumeMarker(String name,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new SyncbaseDbGetResumeMarkerParams();
      params.name = name;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kSyncbase_dbGetResumeMarker_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic dbListTables(String name,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new SyncbaseDbListTablesParams();
      params.name = name;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kSyncbase_dbListTables_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic dbGetSyncgroupNames(String name,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new SyncbaseDbGetSyncgroupNamesParams();
      params.name = name;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kSyncbase_dbGetSyncgroupNames_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic dbCreateSyncgroup(String name,String sgName,SyncgroupSpec spec,SyncgroupMemberInfo myInfo,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new SyncbaseDbCreateSyncgroupParams();
      params.name = name;
      params.sgName = sgName;
      params.spec = spec;
      params.myInfo = myInfo;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kSyncbase_dbCreateSyncgroup_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic dbJoinSyncgroup(String name,String sgName,SyncgroupMemberInfo myInfo,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new SyncbaseDbJoinSyncgroupParams();
      params.name = name;
      params.sgName = sgName;
      params.myInfo = myInfo;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kSyncbase_dbJoinSyncgroup_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic dbLeaveSyncgroup(String name,String sgName,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new SyncbaseDbLeaveSyncgroupParams();
      params.name = name;
      params.sgName = sgName;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kSyncbase_dbLeaveSyncgroup_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic dbDestroySyncgroup(String name,String sgName,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new SyncbaseDbDestroySyncgroupParams();
      params.name = name;
      params.sgName = sgName;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kSyncbase_dbDestroySyncgroup_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic dbEjectFromSyncgroup(String name,String sgName,String member,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new SyncbaseDbEjectFromSyncgroupParams();
      params.name = name;
      params.sgName = sgName;
      params.member = member;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kSyncbase_dbEjectFromSyncgroup_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic dbGetSyncgroupSpec(String name,String sgName,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new SyncbaseDbGetSyncgroupSpecParams();
      params.name = name;
      params.sgName = sgName;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kSyncbase_dbGetSyncgroupSpec_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic dbSetSyncgroupSpec(String name,String sgName,SyncgroupSpec spec,String version,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new SyncbaseDbSetSyncgroupSpecParams();
      params.name = name;
      params.sgName = sgName;
      params.spec = spec;
      params.version = version;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kSyncbase_dbSetSyncgroupSpec_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic dbGetSyncgroupMembers(String name,String sgName,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new SyncbaseDbGetSyncgroupMembersParams();
      params.name = name;
      params.sgName = sgName;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kSyncbase_dbGetSyncgroupMembers_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic tableCreate(String name,Perms perms,[Function responseFactory = null]) {
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
    dynamic tableDestroy(String name,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new SyncbaseTableDestroyParams();
      params.name = name;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kSyncbase_tableDestroy_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic tableExists(String name,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new SyncbaseTableExistsParams();
      params.name = name;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kSyncbase_tableExists_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic tableGetPermissions(String name,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new SyncbaseTableGetPermissionsParams();
      params.name = name;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kSyncbase_tableGetPermissions_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic tableSetPermissions(String name,Perms perms,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new SyncbaseTableSetPermissionsParams();
      params.name = name;
      params.perms = perms;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kSyncbase_tableSetPermissions_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic tableDeleteRange(String name,List<int> start,List<int> limit,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new SyncbaseTableDeleteRangeParams();
      params.name = name;
      params.start = start;
      params.limit = limit;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kSyncbase_tableDeleteRange_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic tableScan(String name,List<int> start,List<int> limit,Object stream,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new SyncbaseTableScanParams();
      params.name = name;
      params.start = start;
      params.limit = limit;
      params.stream = stream;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kSyncbase_tableScan_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic tableGetPrefixPermissions(String name,String key,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new SyncbaseTableGetPrefixPermissionsParams();
      params.name = name;
      params.key = key;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kSyncbase_tableGetPrefixPermissions_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic tableSetPrefixPermissions(String name,String prefix,Perms perms,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new SyncbaseTableSetPrefixPermissionsParams();
      params.name = name;
      params.prefix = prefix;
      params.perms = perms;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kSyncbase_tableSetPrefixPermissions_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic tableDeletePrefixPermissions(String name,String prefix,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new SyncbaseTableDeletePrefixPermissionsParams();
      params.name = name;
      params.prefix = prefix;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kSyncbase_tableDeletePrefixPermissions_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic rowExists(String name,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new SyncbaseRowExistsParams();
      params.name = name;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kSyncbase_rowExists_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic rowGet(String name,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new SyncbaseRowGetParams();
      params.name = name;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kSyncbase_rowGet_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic rowPut(String name,List<int> value,[Function responseFactory = null]) {
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
    dynamic rowDelete(String name,[Function responseFactory = null]) {
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

  factory SyncbaseProxy.connectToService(
      bindings.ServiceConnector s, String url) {
    SyncbaseProxy p = new SyncbaseProxy.unbound();
    s.connectToService(url, p);
    return p;
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
  SyncbaseAppDestroyResponseParams _SyncbaseAppDestroyResponseParamsFactory(Error err) {
    var result = new SyncbaseAppDestroyResponseParams();
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
  SyncbaseDbDestroyResponseParams _SyncbaseDbDestroyResponseParamsFactory(Error err) {
    var result = new SyncbaseDbDestroyResponseParams();
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
  SyncbaseDbBeginBatchResponseParams _SyncbaseDbBeginBatchResponseParamsFactory(Error err, String batchSuffix) {
    var result = new SyncbaseDbBeginBatchResponseParams();
    result.err = err;
    result.batchSuffix = batchSuffix;
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
  SyncbaseDbWatchGlobResponseParams _SyncbaseDbWatchGlobResponseParamsFactory(Error err) {
    var result = new SyncbaseDbWatchGlobResponseParams();
    result.err = err;
    return result;
  }
  SyncbaseDbGetResumeMarkerResponseParams _SyncbaseDbGetResumeMarkerResponseParamsFactory(Error err, List<int> resumeMarker) {
    var result = new SyncbaseDbGetResumeMarkerResponseParams();
    result.err = err;
    result.resumeMarker = resumeMarker;
    return result;
  }
  SyncbaseDbListTablesResponseParams _SyncbaseDbListTablesResponseParamsFactory(Error err, List<String> tables) {
    var result = new SyncbaseDbListTablesResponseParams();
    result.err = err;
    result.tables = tables;
    return result;
  }
  SyncbaseDbGetSyncgroupNamesResponseParams _SyncbaseDbGetSyncgroupNamesResponseParamsFactory(Error err, List<String> names) {
    var result = new SyncbaseDbGetSyncgroupNamesResponseParams();
    result.err = err;
    result.names = names;
    return result;
  }
  SyncbaseDbCreateSyncgroupResponseParams _SyncbaseDbCreateSyncgroupResponseParamsFactory(Error err) {
    var result = new SyncbaseDbCreateSyncgroupResponseParams();
    result.err = err;
    return result;
  }
  SyncbaseDbJoinSyncgroupResponseParams _SyncbaseDbJoinSyncgroupResponseParamsFactory(Error err, SyncgroupSpec spec) {
    var result = new SyncbaseDbJoinSyncgroupResponseParams();
    result.err = err;
    result.spec = spec;
    return result;
  }
  SyncbaseDbLeaveSyncgroupResponseParams _SyncbaseDbLeaveSyncgroupResponseParamsFactory(Error err) {
    var result = new SyncbaseDbLeaveSyncgroupResponseParams();
    result.err = err;
    return result;
  }
  SyncbaseDbDestroySyncgroupResponseParams _SyncbaseDbDestroySyncgroupResponseParamsFactory(Error err) {
    var result = new SyncbaseDbDestroySyncgroupResponseParams();
    result.err = err;
    return result;
  }
  SyncbaseDbEjectFromSyncgroupResponseParams _SyncbaseDbEjectFromSyncgroupResponseParamsFactory(Error err) {
    var result = new SyncbaseDbEjectFromSyncgroupResponseParams();
    result.err = err;
    return result;
  }
  SyncbaseDbGetSyncgroupSpecResponseParams _SyncbaseDbGetSyncgroupSpecResponseParamsFactory(Error err, SyncgroupSpec spec, String version) {
    var result = new SyncbaseDbGetSyncgroupSpecResponseParams();
    result.err = err;
    result.spec = spec;
    result.version = version;
    return result;
  }
  SyncbaseDbSetSyncgroupSpecResponseParams _SyncbaseDbSetSyncgroupSpecResponseParamsFactory(Error err) {
    var result = new SyncbaseDbSetSyncgroupSpecResponseParams();
    result.err = err;
    return result;
  }
  SyncbaseDbGetSyncgroupMembersResponseParams _SyncbaseDbGetSyncgroupMembersResponseParamsFactory(Error err, Map<String, SyncgroupMemberInfo> infos) {
    var result = new SyncbaseDbGetSyncgroupMembersResponseParams();
    result.err = err;
    result.infos = infos;
    return result;
  }
  SyncbaseTableCreateResponseParams _SyncbaseTableCreateResponseParamsFactory(Error err) {
    var result = new SyncbaseTableCreateResponseParams();
    result.err = err;
    return result;
  }
  SyncbaseTableDestroyResponseParams _SyncbaseTableDestroyResponseParamsFactory(Error err) {
    var result = new SyncbaseTableDestroyResponseParams();
    result.err = err;
    return result;
  }
  SyncbaseTableExistsResponseParams _SyncbaseTableExistsResponseParamsFactory(Error err, bool exists) {
    var result = new SyncbaseTableExistsResponseParams();
    result.err = err;
    result.exists = exists;
    return result;
  }
  SyncbaseTableGetPermissionsResponseParams _SyncbaseTableGetPermissionsResponseParamsFactory(Error err, Perms perms) {
    var result = new SyncbaseTableGetPermissionsResponseParams();
    result.err = err;
    result.perms = perms;
    return result;
  }
  SyncbaseTableSetPermissionsResponseParams _SyncbaseTableSetPermissionsResponseParamsFactory(Error err) {
    var result = new SyncbaseTableSetPermissionsResponseParams();
    result.err = err;
    return result;
  }
  SyncbaseTableDeleteRangeResponseParams _SyncbaseTableDeleteRangeResponseParamsFactory(Error err) {
    var result = new SyncbaseTableDeleteRangeResponseParams();
    result.err = err;
    return result;
  }
  SyncbaseTableScanResponseParams _SyncbaseTableScanResponseParamsFactory(Error err) {
    var result = new SyncbaseTableScanResponseParams();
    result.err = err;
    return result;
  }
  SyncbaseTableGetPrefixPermissionsResponseParams _SyncbaseTableGetPrefixPermissionsResponseParamsFactory(Error err, List<PrefixPerms> permsArr) {
    var result = new SyncbaseTableGetPrefixPermissionsResponseParams();
    result.err = err;
    result.permsArr = permsArr;
    return result;
  }
  SyncbaseTableSetPrefixPermissionsResponseParams _SyncbaseTableSetPrefixPermissionsResponseParamsFactory(Error err) {
    var result = new SyncbaseTableSetPrefixPermissionsResponseParams();
    result.err = err;
    return result;
  }
  SyncbaseTableDeletePrefixPermissionsResponseParams _SyncbaseTableDeletePrefixPermissionsResponseParamsFactory(Error err) {
    var result = new SyncbaseTableDeletePrefixPermissionsResponseParams();
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

  dynamic handleMessage(bindings.ServiceMessage message) {
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
        var response = _impl.serviceGetPermissions(_SyncbaseServiceGetPermissionsResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  kSyncbase_serviceGetPermissions_name,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              kSyncbase_serviceGetPermissions_name,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case kSyncbase_serviceSetPermissions_name:
        var params = SyncbaseServiceSetPermissionsParams.deserialize(
            message.payload);
        var response = _impl.serviceSetPermissions(params.perms,params.version,_SyncbaseServiceSetPermissionsResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  kSyncbase_serviceSetPermissions_name,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              kSyncbase_serviceSetPermissions_name,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case kSyncbase_appCreate_name:
        var params = SyncbaseAppCreateParams.deserialize(
            message.payload);
        var response = _impl.appCreate(params.name,params.perms,_SyncbaseAppCreateResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  kSyncbase_appCreate_name,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              kSyncbase_appCreate_name,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case kSyncbase_appDestroy_name:
        var params = SyncbaseAppDestroyParams.deserialize(
            message.payload);
        var response = _impl.appDestroy(params.name,_SyncbaseAppDestroyResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  kSyncbase_appDestroy_name,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              kSyncbase_appDestroy_name,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case kSyncbase_appExists_name:
        var params = SyncbaseAppExistsParams.deserialize(
            message.payload);
        var response = _impl.appExists(params.name,_SyncbaseAppExistsResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  kSyncbase_appExists_name,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              kSyncbase_appExists_name,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case kSyncbase_appGetPermissions_name:
        var params = SyncbaseAppGetPermissionsParams.deserialize(
            message.payload);
        var response = _impl.appGetPermissions(params.name,_SyncbaseAppGetPermissionsResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  kSyncbase_appGetPermissions_name,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              kSyncbase_appGetPermissions_name,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case kSyncbase_appSetPermissions_name:
        var params = SyncbaseAppSetPermissionsParams.deserialize(
            message.payload);
        var response = _impl.appSetPermissions(params.name,params.perms,params.version,_SyncbaseAppSetPermissionsResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  kSyncbase_appSetPermissions_name,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              kSyncbase_appSetPermissions_name,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case kSyncbase_dbCreate_name:
        var params = SyncbaseDbCreateParams.deserialize(
            message.payload);
        var response = _impl.dbCreate(params.name,params.perms,_SyncbaseDbCreateResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  kSyncbase_dbCreate_name,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              kSyncbase_dbCreate_name,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case kSyncbase_dbDestroy_name:
        var params = SyncbaseDbDestroyParams.deserialize(
            message.payload);
        var response = _impl.dbDestroy(params.name,_SyncbaseDbDestroyResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  kSyncbase_dbDestroy_name,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              kSyncbase_dbDestroy_name,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case kSyncbase_dbExists_name:
        var params = SyncbaseDbExistsParams.deserialize(
            message.payload);
        var response = _impl.dbExists(params.name,_SyncbaseDbExistsResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  kSyncbase_dbExists_name,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              kSyncbase_dbExists_name,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case kSyncbase_dbExec_name:
        var params = SyncbaseDbExecParams.deserialize(
            message.payload);
        var response = _impl.dbExec(params.name,params.query,params.stream,_SyncbaseDbExecResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  kSyncbase_dbExec_name,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              kSyncbase_dbExec_name,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case kSyncbase_dbBeginBatch_name:
        var params = SyncbaseDbBeginBatchParams.deserialize(
            message.payload);
        var response = _impl.dbBeginBatch(params.name,params.bo,_SyncbaseDbBeginBatchResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  kSyncbase_dbBeginBatch_name,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              kSyncbase_dbBeginBatch_name,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case kSyncbase_dbCommit_name:
        var params = SyncbaseDbCommitParams.deserialize(
            message.payload);
        var response = _impl.dbCommit(params.name,_SyncbaseDbCommitResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  kSyncbase_dbCommit_name,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              kSyncbase_dbCommit_name,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case kSyncbase_dbAbort_name:
        var params = SyncbaseDbAbortParams.deserialize(
            message.payload);
        var response = _impl.dbAbort(params.name,_SyncbaseDbAbortResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  kSyncbase_dbAbort_name,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              kSyncbase_dbAbort_name,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case kSyncbase_dbGetPermissions_name:
        var params = SyncbaseDbGetPermissionsParams.deserialize(
            message.payload);
        var response = _impl.dbGetPermissions(params.name,_SyncbaseDbGetPermissionsResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  kSyncbase_dbGetPermissions_name,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              kSyncbase_dbGetPermissions_name,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case kSyncbase_dbSetPermissions_name:
        var params = SyncbaseDbSetPermissionsParams.deserialize(
            message.payload);
        var response = _impl.dbSetPermissions(params.name,params.perms,params.version,_SyncbaseDbSetPermissionsResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  kSyncbase_dbSetPermissions_name,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              kSyncbase_dbSetPermissions_name,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case kSyncbase_dbWatchGlob_name:
        var params = SyncbaseDbWatchGlobParams.deserialize(
            message.payload);
        var response = _impl.dbWatchGlob(params.name,params.req,params.stream,_SyncbaseDbWatchGlobResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  kSyncbase_dbWatchGlob_name,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              kSyncbase_dbWatchGlob_name,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case kSyncbase_dbGetResumeMarker_name:
        var params = SyncbaseDbGetResumeMarkerParams.deserialize(
            message.payload);
        var response = _impl.dbGetResumeMarker(params.name,_SyncbaseDbGetResumeMarkerResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  kSyncbase_dbGetResumeMarker_name,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              kSyncbase_dbGetResumeMarker_name,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case kSyncbase_dbListTables_name:
        var params = SyncbaseDbListTablesParams.deserialize(
            message.payload);
        var response = _impl.dbListTables(params.name,_SyncbaseDbListTablesResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  kSyncbase_dbListTables_name,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              kSyncbase_dbListTables_name,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case kSyncbase_dbGetSyncgroupNames_name:
        var params = SyncbaseDbGetSyncgroupNamesParams.deserialize(
            message.payload);
        var response = _impl.dbGetSyncgroupNames(params.name,_SyncbaseDbGetSyncgroupNamesResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  kSyncbase_dbGetSyncgroupNames_name,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              kSyncbase_dbGetSyncgroupNames_name,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case kSyncbase_dbCreateSyncgroup_name:
        var params = SyncbaseDbCreateSyncgroupParams.deserialize(
            message.payload);
        var response = _impl.dbCreateSyncgroup(params.name,params.sgName,params.spec,params.myInfo,_SyncbaseDbCreateSyncgroupResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  kSyncbase_dbCreateSyncgroup_name,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              kSyncbase_dbCreateSyncgroup_name,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case kSyncbase_dbJoinSyncgroup_name:
        var params = SyncbaseDbJoinSyncgroupParams.deserialize(
            message.payload);
        var response = _impl.dbJoinSyncgroup(params.name,params.sgName,params.myInfo,_SyncbaseDbJoinSyncgroupResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  kSyncbase_dbJoinSyncgroup_name,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              kSyncbase_dbJoinSyncgroup_name,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case kSyncbase_dbLeaveSyncgroup_name:
        var params = SyncbaseDbLeaveSyncgroupParams.deserialize(
            message.payload);
        var response = _impl.dbLeaveSyncgroup(params.name,params.sgName,_SyncbaseDbLeaveSyncgroupResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  kSyncbase_dbLeaveSyncgroup_name,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              kSyncbase_dbLeaveSyncgroup_name,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case kSyncbase_dbDestroySyncgroup_name:
        var params = SyncbaseDbDestroySyncgroupParams.deserialize(
            message.payload);
        var response = _impl.dbDestroySyncgroup(params.name,params.sgName,_SyncbaseDbDestroySyncgroupResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  kSyncbase_dbDestroySyncgroup_name,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              kSyncbase_dbDestroySyncgroup_name,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case kSyncbase_dbEjectFromSyncgroup_name:
        var params = SyncbaseDbEjectFromSyncgroupParams.deserialize(
            message.payload);
        var response = _impl.dbEjectFromSyncgroup(params.name,params.sgName,params.member,_SyncbaseDbEjectFromSyncgroupResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  kSyncbase_dbEjectFromSyncgroup_name,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              kSyncbase_dbEjectFromSyncgroup_name,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case kSyncbase_dbGetSyncgroupSpec_name:
        var params = SyncbaseDbGetSyncgroupSpecParams.deserialize(
            message.payload);
        var response = _impl.dbGetSyncgroupSpec(params.name,params.sgName,_SyncbaseDbGetSyncgroupSpecResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  kSyncbase_dbGetSyncgroupSpec_name,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              kSyncbase_dbGetSyncgroupSpec_name,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case kSyncbase_dbSetSyncgroupSpec_name:
        var params = SyncbaseDbSetSyncgroupSpecParams.deserialize(
            message.payload);
        var response = _impl.dbSetSyncgroupSpec(params.name,params.sgName,params.spec,params.version,_SyncbaseDbSetSyncgroupSpecResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  kSyncbase_dbSetSyncgroupSpec_name,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              kSyncbase_dbSetSyncgroupSpec_name,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case kSyncbase_dbGetSyncgroupMembers_name:
        var params = SyncbaseDbGetSyncgroupMembersParams.deserialize(
            message.payload);
        var response = _impl.dbGetSyncgroupMembers(params.name,params.sgName,_SyncbaseDbGetSyncgroupMembersResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  kSyncbase_dbGetSyncgroupMembers_name,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              kSyncbase_dbGetSyncgroupMembers_name,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case kSyncbase_tableCreate_name:
        var params = SyncbaseTableCreateParams.deserialize(
            message.payload);
        var response = _impl.tableCreate(params.name,params.perms,_SyncbaseTableCreateResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  kSyncbase_tableCreate_name,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              kSyncbase_tableCreate_name,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case kSyncbase_tableDestroy_name:
        var params = SyncbaseTableDestroyParams.deserialize(
            message.payload);
        var response = _impl.tableDestroy(params.name,_SyncbaseTableDestroyResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  kSyncbase_tableDestroy_name,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              kSyncbase_tableDestroy_name,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case kSyncbase_tableExists_name:
        var params = SyncbaseTableExistsParams.deserialize(
            message.payload);
        var response = _impl.tableExists(params.name,_SyncbaseTableExistsResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  kSyncbase_tableExists_name,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              kSyncbase_tableExists_name,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case kSyncbase_tableGetPermissions_name:
        var params = SyncbaseTableGetPermissionsParams.deserialize(
            message.payload);
        var response = _impl.tableGetPermissions(params.name,_SyncbaseTableGetPermissionsResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  kSyncbase_tableGetPermissions_name,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              kSyncbase_tableGetPermissions_name,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case kSyncbase_tableSetPermissions_name:
        var params = SyncbaseTableSetPermissionsParams.deserialize(
            message.payload);
        var response = _impl.tableSetPermissions(params.name,params.perms,_SyncbaseTableSetPermissionsResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  kSyncbase_tableSetPermissions_name,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              kSyncbase_tableSetPermissions_name,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case kSyncbase_tableDeleteRange_name:
        var params = SyncbaseTableDeleteRangeParams.deserialize(
            message.payload);
        var response = _impl.tableDeleteRange(params.name,params.start,params.limit,_SyncbaseTableDeleteRangeResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  kSyncbase_tableDeleteRange_name,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              kSyncbase_tableDeleteRange_name,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case kSyncbase_tableScan_name:
        var params = SyncbaseTableScanParams.deserialize(
            message.payload);
        var response = _impl.tableScan(params.name,params.start,params.limit,params.stream,_SyncbaseTableScanResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  kSyncbase_tableScan_name,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              kSyncbase_tableScan_name,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case kSyncbase_tableGetPrefixPermissions_name:
        var params = SyncbaseTableGetPrefixPermissionsParams.deserialize(
            message.payload);
        var response = _impl.tableGetPrefixPermissions(params.name,params.key,_SyncbaseTableGetPrefixPermissionsResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  kSyncbase_tableGetPrefixPermissions_name,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              kSyncbase_tableGetPrefixPermissions_name,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case kSyncbase_tableSetPrefixPermissions_name:
        var params = SyncbaseTableSetPrefixPermissionsParams.deserialize(
            message.payload);
        var response = _impl.tableSetPrefixPermissions(params.name,params.prefix,params.perms,_SyncbaseTableSetPrefixPermissionsResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  kSyncbase_tableSetPrefixPermissions_name,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              kSyncbase_tableSetPrefixPermissions_name,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case kSyncbase_tableDeletePrefixPermissions_name:
        var params = SyncbaseTableDeletePrefixPermissionsParams.deserialize(
            message.payload);
        var response = _impl.tableDeletePrefixPermissions(params.name,params.prefix,_SyncbaseTableDeletePrefixPermissionsResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  kSyncbase_tableDeletePrefixPermissions_name,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              kSyncbase_tableDeletePrefixPermissions_name,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case kSyncbase_rowExists_name:
        var params = SyncbaseRowExistsParams.deserialize(
            message.payload);
        var response = _impl.rowExists(params.name,_SyncbaseRowExistsResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  kSyncbase_rowExists_name,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              kSyncbase_rowExists_name,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case kSyncbase_rowGet_name:
        var params = SyncbaseRowGetParams.deserialize(
            message.payload);
        var response = _impl.rowGet(params.name,_SyncbaseRowGetResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  kSyncbase_rowGet_name,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              kSyncbase_rowGet_name,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case kSyncbase_rowPut_name:
        var params = SyncbaseRowPutParams.deserialize(
            message.payload);
        var response = _impl.rowPut(params.name,params.value,_SyncbaseRowPutResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  kSyncbase_rowPut_name,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              kSyncbase_rowPut_name,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case kSyncbase_rowDelete_name:
        var params = SyncbaseRowDeleteParams.deserialize(
            message.payload);
        var response = _impl.rowDelete(params.name,_SyncbaseRowDeleteResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  kSyncbase_rowDelete_name,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              kSyncbase_rowDelete_name,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
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


