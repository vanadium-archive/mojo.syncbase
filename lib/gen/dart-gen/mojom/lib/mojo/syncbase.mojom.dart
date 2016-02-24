// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library syncbase_mojom;

import 'dart:async';

import 'package:mojo/bindings.dart' as bindings;
import 'package:mojo/core.dart' as core;
import 'package:mojo/mojo/bindings/types/mojom_types.mojom.dart' as mojom_types;
import 'package:mojo/mojo/bindings/types/service_describer.mojom.dart' as service_describer;



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




class TableRow extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  String tableName = null;
  String row = null;

  TableRow() : super(kVersions.last.size);

  static TableRow deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static TableRow decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    TableRow result = new TableRow();

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
      
      result.row = decoder0.decodeString(16, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(tableName, 8, false);
    
    encoder0.encodeString(row, 16, false);
  }

  String toString() {
    return "TableRow("
           "tableName: $tableName" ", "
           "row: $row" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["tableName"] = tableName;
    map["row"] = row;
    return map;
  }
}




class SyncgroupSpec extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(48, 0)
  ];
  String description = null;
  Perms perms = null;
  List<TableRow> prefixes = null;
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
        result.prefixes = new List<TableRow>(si1.numElements);
        for (int i1 = 0; i1 < si1.numElements; ++i1) {
          
          var decoder2 = decoder1.decodePointer(bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i1, false);
          result.prefixes[i1] = TableRow.decode(decoder2);
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




class _ExecStreamOnResultParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  Result result = null;

  _ExecStreamOnResultParams() : super(kVersions.last.size);

  static _ExecStreamOnResultParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _ExecStreamOnResultParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _ExecStreamOnResultParams result = new _ExecStreamOnResultParams();

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
    return "_ExecStreamOnResultParams("
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




class _ExecStreamOnDoneParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  Error err = null;

  _ExecStreamOnDoneParams() : super(kVersions.last.size);

  static _ExecStreamOnDoneParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _ExecStreamOnDoneParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _ExecStreamOnDoneParams result = new _ExecStreamOnDoneParams();

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
    return "_ExecStreamOnDoneParams("
           "err: $err" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["err"] = err;
    return map;
  }
}




class _ScanStreamOnKeyValueParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  KeyValue keyValue = null;

  _ScanStreamOnKeyValueParams() : super(kVersions.last.size);

  static _ScanStreamOnKeyValueParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _ScanStreamOnKeyValueParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _ScanStreamOnKeyValueParams result = new _ScanStreamOnKeyValueParams();

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
    return "_ScanStreamOnKeyValueParams("
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




class _ScanStreamOnDoneParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  Error err = null;

  _ScanStreamOnDoneParams() : super(kVersions.last.size);

  static _ScanStreamOnDoneParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _ScanStreamOnDoneParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _ScanStreamOnDoneParams result = new _ScanStreamOnDoneParams();

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
    return "_ScanStreamOnDoneParams("
           "err: $err" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["err"] = err;
    return map;
  }
}




class _WatchGlobStreamOnChangeParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  WatchChange change = null;

  _WatchGlobStreamOnChangeParams() : super(kVersions.last.size);

  static _WatchGlobStreamOnChangeParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _WatchGlobStreamOnChangeParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _WatchGlobStreamOnChangeParams result = new _WatchGlobStreamOnChangeParams();

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
    return "_WatchGlobStreamOnChangeParams("
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




class _WatchGlobStreamOnErrorParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  Error err = null;

  _WatchGlobStreamOnErrorParams() : super(kVersions.last.size);

  static _WatchGlobStreamOnErrorParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _WatchGlobStreamOnErrorParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _WatchGlobStreamOnErrorParams result = new _WatchGlobStreamOnErrorParams();

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
    return "_WatchGlobStreamOnErrorParams("
           "err: $err" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["err"] = err;
    return map;
  }
}




class _SyncbaseServiceGetPermissionsParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(8, 0)
  ];

  _SyncbaseServiceGetPermissionsParams() : super(kVersions.last.size);

  static _SyncbaseServiceGetPermissionsParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _SyncbaseServiceGetPermissionsParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _SyncbaseServiceGetPermissionsParams result = new _SyncbaseServiceGetPermissionsParams();

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
    return "_SyncbaseServiceGetPermissionsParams("")";
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




class _SyncbaseServiceSetPermissionsParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  Perms perms = null;
  String version = null;

  _SyncbaseServiceSetPermissionsParams() : super(kVersions.last.size);

  static _SyncbaseServiceSetPermissionsParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _SyncbaseServiceSetPermissionsParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _SyncbaseServiceSetPermissionsParams result = new _SyncbaseServiceSetPermissionsParams();

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
    return "_SyncbaseServiceSetPermissionsParams("
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




class _SyncbaseServiceListAppsParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(8, 0)
  ];

  _SyncbaseServiceListAppsParams() : super(kVersions.last.size);

  static _SyncbaseServiceListAppsParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _SyncbaseServiceListAppsParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _SyncbaseServiceListAppsParams result = new _SyncbaseServiceListAppsParams();

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
    return "_SyncbaseServiceListAppsParams("")";
  }

  Map toJson() {
    Map map = new Map();
    return map;
  }
}




class SyncbaseServiceListAppsResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  Error err = null;
  List<String> apps = null;

  SyncbaseServiceListAppsResponseParams() : super(kVersions.last.size);

  static SyncbaseServiceListAppsResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static SyncbaseServiceListAppsResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseServiceListAppsResponseParams result = new SyncbaseServiceListAppsResponseParams();

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
        result.apps = new List<String>(si1.numElements);
        for (int i1 = 0; i1 < si1.numElements; ++i1) {
          
          result.apps[i1] = decoder1.decodeString(bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i1, false);
        }
      }
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(err, 8, false);
    
    if (apps == null) {
      encoder0.encodeNullPointer(16, false);
    } else {
      var encoder1 = encoder0.encodePointerArray(apps.length, 16, bindings.kUnspecifiedArrayLength);
      for (int i0 = 0; i0 < apps.length; ++i0) {
        
        encoder1.encodeString(apps[i0], bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i0, false);
      }
    }
  }

  String toString() {
    return "SyncbaseServiceListAppsResponseParams("
           "err: $err" ", "
           "apps: $apps" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["err"] = err;
    map["apps"] = apps;
    return map;
  }
}




class _SyncbaseAppCreateParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  String name = null;
  Perms perms = null;

  _SyncbaseAppCreateParams() : super(kVersions.last.size);

  static _SyncbaseAppCreateParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _SyncbaseAppCreateParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _SyncbaseAppCreateParams result = new _SyncbaseAppCreateParams();

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
    return "_SyncbaseAppCreateParams("
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




class _SyncbaseAppDestroyParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  String name = null;

  _SyncbaseAppDestroyParams() : super(kVersions.last.size);

  static _SyncbaseAppDestroyParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _SyncbaseAppDestroyParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _SyncbaseAppDestroyParams result = new _SyncbaseAppDestroyParams();

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
    return "_SyncbaseAppDestroyParams("
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




class _SyncbaseAppExistsParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  String name = null;

  _SyncbaseAppExistsParams() : super(kVersions.last.size);

  static _SyncbaseAppExistsParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _SyncbaseAppExistsParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _SyncbaseAppExistsParams result = new _SyncbaseAppExistsParams();

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
    return "_SyncbaseAppExistsParams("
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




class _SyncbaseAppGetPermissionsParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  String name = null;

  _SyncbaseAppGetPermissionsParams() : super(kVersions.last.size);

  static _SyncbaseAppGetPermissionsParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _SyncbaseAppGetPermissionsParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _SyncbaseAppGetPermissionsParams result = new _SyncbaseAppGetPermissionsParams();

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
    return "_SyncbaseAppGetPermissionsParams("
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




class _SyncbaseAppListDatabasesParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  String name = null;

  _SyncbaseAppListDatabasesParams() : super(kVersions.last.size);

  static _SyncbaseAppListDatabasesParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _SyncbaseAppListDatabasesParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _SyncbaseAppListDatabasesParams result = new _SyncbaseAppListDatabasesParams();

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
    return "_SyncbaseAppListDatabasesParams("
           "name: $name" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["name"] = name;
    return map;
  }
}




class SyncbaseAppListDatabasesResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  Error err = null;
  List<String> databases = null;

  SyncbaseAppListDatabasesResponseParams() : super(kVersions.last.size);

  static SyncbaseAppListDatabasesResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static SyncbaseAppListDatabasesResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SyncbaseAppListDatabasesResponseParams result = new SyncbaseAppListDatabasesResponseParams();

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
        result.databases = new List<String>(si1.numElements);
        for (int i1 = 0; i1 < si1.numElements; ++i1) {
          
          result.databases[i1] = decoder1.decodeString(bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i1, false);
        }
      }
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(err, 8, false);
    
    if (databases == null) {
      encoder0.encodeNullPointer(16, false);
    } else {
      var encoder1 = encoder0.encodePointerArray(databases.length, 16, bindings.kUnspecifiedArrayLength);
      for (int i0 = 0; i0 < databases.length; ++i0) {
        
        encoder1.encodeString(databases[i0], bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i0, false);
      }
    }
  }

  String toString() {
    return "SyncbaseAppListDatabasesResponseParams("
           "err: $err" ", "
           "databases: $databases" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["err"] = err;
    map["databases"] = databases;
    return map;
  }
}




class _SyncbaseAppSetPermissionsParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(32, 0)
  ];
  String name = null;
  Perms perms = null;
  String version = null;

  _SyncbaseAppSetPermissionsParams() : super(kVersions.last.size);

  static _SyncbaseAppSetPermissionsParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _SyncbaseAppSetPermissionsParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _SyncbaseAppSetPermissionsParams result = new _SyncbaseAppSetPermissionsParams();

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
    return "_SyncbaseAppSetPermissionsParams("
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




class _SyncbaseDbCreateParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  String name = null;
  Perms perms = null;

  _SyncbaseDbCreateParams() : super(kVersions.last.size);

  static _SyncbaseDbCreateParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _SyncbaseDbCreateParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _SyncbaseDbCreateParams result = new _SyncbaseDbCreateParams();

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
    return "_SyncbaseDbCreateParams("
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




class _SyncbaseDbDestroyParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  String name = null;

  _SyncbaseDbDestroyParams() : super(kVersions.last.size);

  static _SyncbaseDbDestroyParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _SyncbaseDbDestroyParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _SyncbaseDbDestroyParams result = new _SyncbaseDbDestroyParams();

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
    return "_SyncbaseDbDestroyParams("
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




class _SyncbaseDbExistsParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  String name = null;

  _SyncbaseDbExistsParams() : super(kVersions.last.size);

  static _SyncbaseDbExistsParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _SyncbaseDbExistsParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _SyncbaseDbExistsParams result = new _SyncbaseDbExistsParams();

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
    return "_SyncbaseDbExistsParams("
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




class _SyncbaseDbExecParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(40, 0)
  ];
  String name = null;
  String query = null;
  List<List<int>> parameters = null;
  Object stream = null;

  _SyncbaseDbExecParams() : super(kVersions.last.size);

  static _SyncbaseDbExecParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _SyncbaseDbExecParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _SyncbaseDbExecParams result = new _SyncbaseDbExecParams();

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
      
      var decoder1 = decoder0.decodePointer(24, false);
      {
        var si1 = decoder1.decodeDataHeaderForPointerArray(bindings.kUnspecifiedArrayLength);
        result.parameters = new List<List<int>>(si1.numElements);
        for (int i1 = 0; i1 < si1.numElements; ++i1) {
          
          result.parameters[i1] = decoder1.decodeUint8Array(bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i1, bindings.kNothingNullable, bindings.kUnspecifiedArrayLength);
        }
      }
    }
    if (mainDataHeader.version >= 0) {
      
      result.stream = decoder0.decodeServiceInterface(32, false, ExecStreamProxy.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(name, 8, false);
    
    encoder0.encodeString(query, 16, false);
    
    if (parameters == null) {
      encoder0.encodeNullPointer(24, false);
    } else {
      var encoder1 = encoder0.encodePointerArray(parameters.length, 24, bindings.kUnspecifiedArrayLength);
      for (int i0 = 0; i0 < parameters.length; ++i0) {
        
        encoder1.encodeUint8Array(parameters[i0], bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i0, bindings.kNothingNullable, bindings.kUnspecifiedArrayLength);
      }
    }
    
    encoder0.encodeInterface(stream, 32, false);
  }

  String toString() {
    return "_SyncbaseDbExecParams("
           "name: $name" ", "
           "query: $query" ", "
           "parameters: $parameters" ", "
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




class _SyncbaseDbBeginBatchParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  String name = null;
  BatchOptions bo = null;

  _SyncbaseDbBeginBatchParams() : super(kVersions.last.size);

  static _SyncbaseDbBeginBatchParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _SyncbaseDbBeginBatchParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _SyncbaseDbBeginBatchParams result = new _SyncbaseDbBeginBatchParams();

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
    return "_SyncbaseDbBeginBatchParams("
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




class _SyncbaseDbCommitParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  String name = null;

  _SyncbaseDbCommitParams() : super(kVersions.last.size);

  static _SyncbaseDbCommitParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _SyncbaseDbCommitParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _SyncbaseDbCommitParams result = new _SyncbaseDbCommitParams();

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
    return "_SyncbaseDbCommitParams("
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




class _SyncbaseDbAbortParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  String name = null;

  _SyncbaseDbAbortParams() : super(kVersions.last.size);

  static _SyncbaseDbAbortParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _SyncbaseDbAbortParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _SyncbaseDbAbortParams result = new _SyncbaseDbAbortParams();

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
    return "_SyncbaseDbAbortParams("
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




class _SyncbaseDbGetPermissionsParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  String name = null;

  _SyncbaseDbGetPermissionsParams() : super(kVersions.last.size);

  static _SyncbaseDbGetPermissionsParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _SyncbaseDbGetPermissionsParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _SyncbaseDbGetPermissionsParams result = new _SyncbaseDbGetPermissionsParams();

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
    return "_SyncbaseDbGetPermissionsParams("
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




class _SyncbaseDbSetPermissionsParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(32, 0)
  ];
  String name = null;
  Perms perms = null;
  String version = null;

  _SyncbaseDbSetPermissionsParams() : super(kVersions.last.size);

  static _SyncbaseDbSetPermissionsParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _SyncbaseDbSetPermissionsParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _SyncbaseDbSetPermissionsParams result = new _SyncbaseDbSetPermissionsParams();

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
    return "_SyncbaseDbSetPermissionsParams("
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




class _SyncbaseDbWatchGlobParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(32, 0)
  ];
  String name = null;
  GlobRequest req = null;
  Object stream = null;

  _SyncbaseDbWatchGlobParams() : super(kVersions.last.size);

  static _SyncbaseDbWatchGlobParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _SyncbaseDbWatchGlobParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _SyncbaseDbWatchGlobParams result = new _SyncbaseDbWatchGlobParams();

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
    return "_SyncbaseDbWatchGlobParams("
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




class _SyncbaseDbGetResumeMarkerParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  String name = null;

  _SyncbaseDbGetResumeMarkerParams() : super(kVersions.last.size);

  static _SyncbaseDbGetResumeMarkerParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _SyncbaseDbGetResumeMarkerParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _SyncbaseDbGetResumeMarkerParams result = new _SyncbaseDbGetResumeMarkerParams();

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
    return "_SyncbaseDbGetResumeMarkerParams("
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




class _SyncbaseDbListTablesParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  String name = null;

  _SyncbaseDbListTablesParams() : super(kVersions.last.size);

  static _SyncbaseDbListTablesParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _SyncbaseDbListTablesParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _SyncbaseDbListTablesParams result = new _SyncbaseDbListTablesParams();

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
    return "_SyncbaseDbListTablesParams("
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




class _SyncbaseDbGetSyncgroupNamesParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  String name = null;

  _SyncbaseDbGetSyncgroupNamesParams() : super(kVersions.last.size);

  static _SyncbaseDbGetSyncgroupNamesParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _SyncbaseDbGetSyncgroupNamesParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _SyncbaseDbGetSyncgroupNamesParams result = new _SyncbaseDbGetSyncgroupNamesParams();

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
    return "_SyncbaseDbGetSyncgroupNamesParams("
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




class _SyncbaseDbCreateSyncgroupParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(40, 0)
  ];
  String name = null;
  String sgName = null;
  SyncgroupSpec spec = null;
  SyncgroupMemberInfo myInfo = null;

  _SyncbaseDbCreateSyncgroupParams() : super(kVersions.last.size);

  static _SyncbaseDbCreateSyncgroupParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _SyncbaseDbCreateSyncgroupParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _SyncbaseDbCreateSyncgroupParams result = new _SyncbaseDbCreateSyncgroupParams();

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
    return "_SyncbaseDbCreateSyncgroupParams("
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




class _SyncbaseDbJoinSyncgroupParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(32, 0)
  ];
  String name = null;
  String sgName = null;
  SyncgroupMemberInfo myInfo = null;

  _SyncbaseDbJoinSyncgroupParams() : super(kVersions.last.size);

  static _SyncbaseDbJoinSyncgroupParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _SyncbaseDbJoinSyncgroupParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _SyncbaseDbJoinSyncgroupParams result = new _SyncbaseDbJoinSyncgroupParams();

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
    return "_SyncbaseDbJoinSyncgroupParams("
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




class _SyncbaseDbLeaveSyncgroupParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  String name = null;
  String sgName = null;

  _SyncbaseDbLeaveSyncgroupParams() : super(kVersions.last.size);

  static _SyncbaseDbLeaveSyncgroupParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _SyncbaseDbLeaveSyncgroupParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _SyncbaseDbLeaveSyncgroupParams result = new _SyncbaseDbLeaveSyncgroupParams();

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
    return "_SyncbaseDbLeaveSyncgroupParams("
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




class _SyncbaseDbDestroySyncgroupParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  String name = null;
  String sgName = null;

  _SyncbaseDbDestroySyncgroupParams() : super(kVersions.last.size);

  static _SyncbaseDbDestroySyncgroupParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _SyncbaseDbDestroySyncgroupParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _SyncbaseDbDestroySyncgroupParams result = new _SyncbaseDbDestroySyncgroupParams();

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
    return "_SyncbaseDbDestroySyncgroupParams("
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




class _SyncbaseDbEjectFromSyncgroupParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(32, 0)
  ];
  String name = null;
  String sgName = null;
  String member = null;

  _SyncbaseDbEjectFromSyncgroupParams() : super(kVersions.last.size);

  static _SyncbaseDbEjectFromSyncgroupParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _SyncbaseDbEjectFromSyncgroupParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _SyncbaseDbEjectFromSyncgroupParams result = new _SyncbaseDbEjectFromSyncgroupParams();

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
    return "_SyncbaseDbEjectFromSyncgroupParams("
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




class _SyncbaseDbGetSyncgroupSpecParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  String name = null;
  String sgName = null;

  _SyncbaseDbGetSyncgroupSpecParams() : super(kVersions.last.size);

  static _SyncbaseDbGetSyncgroupSpecParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _SyncbaseDbGetSyncgroupSpecParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _SyncbaseDbGetSyncgroupSpecParams result = new _SyncbaseDbGetSyncgroupSpecParams();

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
    return "_SyncbaseDbGetSyncgroupSpecParams("
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




class _SyncbaseDbSetSyncgroupSpecParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(40, 0)
  ];
  String name = null;
  String sgName = null;
  SyncgroupSpec spec = null;
  String version = null;

  _SyncbaseDbSetSyncgroupSpecParams() : super(kVersions.last.size);

  static _SyncbaseDbSetSyncgroupSpecParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _SyncbaseDbSetSyncgroupSpecParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _SyncbaseDbSetSyncgroupSpecParams result = new _SyncbaseDbSetSyncgroupSpecParams();

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
    return "_SyncbaseDbSetSyncgroupSpecParams("
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




class _SyncbaseDbGetSyncgroupMembersParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  String name = null;
  String sgName = null;

  _SyncbaseDbGetSyncgroupMembersParams() : super(kVersions.last.size);

  static _SyncbaseDbGetSyncgroupMembersParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _SyncbaseDbGetSyncgroupMembersParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _SyncbaseDbGetSyncgroupMembersParams result = new _SyncbaseDbGetSyncgroupMembersParams();

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
    return "_SyncbaseDbGetSyncgroupMembersParams("
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




class _SyncbaseTableCreateParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  String name = null;
  Perms perms = null;

  _SyncbaseTableCreateParams() : super(kVersions.last.size);

  static _SyncbaseTableCreateParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _SyncbaseTableCreateParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _SyncbaseTableCreateParams result = new _SyncbaseTableCreateParams();

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
    return "_SyncbaseTableCreateParams("
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




class _SyncbaseTableDestroyParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  String name = null;

  _SyncbaseTableDestroyParams() : super(kVersions.last.size);

  static _SyncbaseTableDestroyParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _SyncbaseTableDestroyParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _SyncbaseTableDestroyParams result = new _SyncbaseTableDestroyParams();

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
    return "_SyncbaseTableDestroyParams("
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




class _SyncbaseTableExistsParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  String name = null;

  _SyncbaseTableExistsParams() : super(kVersions.last.size);

  static _SyncbaseTableExistsParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _SyncbaseTableExistsParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _SyncbaseTableExistsParams result = new _SyncbaseTableExistsParams();

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
    return "_SyncbaseTableExistsParams("
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




class _SyncbaseTableGetPermissionsParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  String name = null;

  _SyncbaseTableGetPermissionsParams() : super(kVersions.last.size);

  static _SyncbaseTableGetPermissionsParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _SyncbaseTableGetPermissionsParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _SyncbaseTableGetPermissionsParams result = new _SyncbaseTableGetPermissionsParams();

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
    return "_SyncbaseTableGetPermissionsParams("
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




class _SyncbaseTableSetPermissionsParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  String name = null;
  Perms perms = null;

  _SyncbaseTableSetPermissionsParams() : super(kVersions.last.size);

  static _SyncbaseTableSetPermissionsParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _SyncbaseTableSetPermissionsParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _SyncbaseTableSetPermissionsParams result = new _SyncbaseTableSetPermissionsParams();

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
    return "_SyncbaseTableSetPermissionsParams("
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




class _SyncbaseTableDeleteRangeParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(32, 0)
  ];
  String name = null;
  List<int> start = null;
  List<int> limit = null;

  _SyncbaseTableDeleteRangeParams() : super(kVersions.last.size);

  static _SyncbaseTableDeleteRangeParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _SyncbaseTableDeleteRangeParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _SyncbaseTableDeleteRangeParams result = new _SyncbaseTableDeleteRangeParams();

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
    return "_SyncbaseTableDeleteRangeParams("
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




class _SyncbaseTableScanParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(40, 0)
  ];
  String name = null;
  List<int> start = null;
  List<int> limit = null;
  Object stream = null;

  _SyncbaseTableScanParams() : super(kVersions.last.size);

  static _SyncbaseTableScanParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _SyncbaseTableScanParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _SyncbaseTableScanParams result = new _SyncbaseTableScanParams();

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
    return "_SyncbaseTableScanParams("
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




class _SyncbaseTableGetPrefixPermissionsParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  String name = null;
  String key = null;

  _SyncbaseTableGetPrefixPermissionsParams() : super(kVersions.last.size);

  static _SyncbaseTableGetPrefixPermissionsParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _SyncbaseTableGetPrefixPermissionsParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _SyncbaseTableGetPrefixPermissionsParams result = new _SyncbaseTableGetPrefixPermissionsParams();

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
    return "_SyncbaseTableGetPrefixPermissionsParams("
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




class _SyncbaseTableSetPrefixPermissionsParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(32, 0)
  ];
  String name = null;
  String prefix = null;
  Perms perms = null;

  _SyncbaseTableSetPrefixPermissionsParams() : super(kVersions.last.size);

  static _SyncbaseTableSetPrefixPermissionsParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _SyncbaseTableSetPrefixPermissionsParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _SyncbaseTableSetPrefixPermissionsParams result = new _SyncbaseTableSetPrefixPermissionsParams();

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
    return "_SyncbaseTableSetPrefixPermissionsParams("
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




class _SyncbaseTableDeletePrefixPermissionsParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  String name = null;
  String prefix = null;

  _SyncbaseTableDeletePrefixPermissionsParams() : super(kVersions.last.size);

  static _SyncbaseTableDeletePrefixPermissionsParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _SyncbaseTableDeletePrefixPermissionsParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _SyncbaseTableDeletePrefixPermissionsParams result = new _SyncbaseTableDeletePrefixPermissionsParams();

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
    return "_SyncbaseTableDeletePrefixPermissionsParams("
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




class _SyncbaseRowExistsParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  String name = null;

  _SyncbaseRowExistsParams() : super(kVersions.last.size);

  static _SyncbaseRowExistsParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _SyncbaseRowExistsParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _SyncbaseRowExistsParams result = new _SyncbaseRowExistsParams();

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
    return "_SyncbaseRowExistsParams("
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




class _SyncbaseRowGetParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  String name = null;

  _SyncbaseRowGetParams() : super(kVersions.last.size);

  static _SyncbaseRowGetParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _SyncbaseRowGetParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _SyncbaseRowGetParams result = new _SyncbaseRowGetParams();

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
    return "_SyncbaseRowGetParams("
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




class _SyncbaseRowPutParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  String name = null;
  List<int> value = null;

  _SyncbaseRowPutParams() : super(kVersions.last.size);

  static _SyncbaseRowPutParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _SyncbaseRowPutParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _SyncbaseRowPutParams result = new _SyncbaseRowPutParams();

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
    return "_SyncbaseRowPutParams("
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




class _SyncbaseRowDeleteParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  String name = null;

  _SyncbaseRowDeleteParams() : super(kVersions.last.size);

  static _SyncbaseRowDeleteParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _SyncbaseRowDeleteParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _SyncbaseRowDeleteParams result = new _SyncbaseRowDeleteParams();

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
    return "_SyncbaseRowDeleteParams("
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




const int _ExecStream_onResultName = 0;
const int _ExecStream_onDoneName = 1;



class _ExecStreamServiceDescription implements service_describer.ServiceDescription {
  dynamic getTopLevelInterface([Function responseFactory]) => null;

  dynamic getTypeDefinition(String typeKey, [Function responseFactory]) => null;

  dynamic getAllTypeDefinitions([Function responseFactory]) => null;
}

abstract class ExecStream {
  static const String serviceName = "v23::syncbase::ExecStream";
  dynamic onResult(Result result,[Function responseFactory = null]);
  void onDone(Error err);
}


class _ExecStreamProxyImpl extends bindings.Proxy {
  _ExecStreamProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  _ExecStreamProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  _ExecStreamProxyImpl.unbound() : super.unbound();

  static _ExecStreamProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For _ExecStreamProxyImpl"));
    return new _ExecStreamProxyImpl.fromEndpoint(endpoint);
  }

  service_describer.ServiceDescription get serviceDescription =>
    new _ExecStreamServiceDescription();

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case _ExecStream_onResultName:
        var r = ExecStreamOnResultResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          proxyError("Expected a message with a valid request Id.");
          return;
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          proxyError(
              "Message had unknown request Id: ${message.header.requestId}");
          return;
        }
        completerMap.remove(message.header.requestId);
        if (c.isCompleted) {
          proxyError("Response completer already completed");
          return;
        }
        c.complete(r);
        break;
      default:
        proxyError("Unexpected message type: ${message.header.type}");
        close(immediate: true);
        break;
    }
  }

  String toString() {
    var superString = super.toString();
    return "_ExecStreamProxyImpl($superString)";
  }
}


class _ExecStreamProxyCalls implements ExecStream {
  _ExecStreamProxyImpl _proxyImpl;

  _ExecStreamProxyCalls(this._proxyImpl);
    dynamic onResult(Result result,[Function responseFactory = null]) {
      var params = new _ExecStreamOnResultParams();
      params.result = result;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          _ExecStream_onResultName,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    void onDone(Error err) {
      if (!_proxyImpl.isBound) {
        _proxyImpl.proxyError("The Proxy is closed.");
        return;
      }
      var params = new _ExecStreamOnDoneParams();
      params.err = err;
      _proxyImpl.sendMessage(params, _ExecStream_onDoneName);
    }
}


class ExecStreamProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  ExecStream ptr;

  ExecStreamProxy(_ExecStreamProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _ExecStreamProxyCalls(proxyImpl);

  ExecStreamProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new _ExecStreamProxyImpl.fromEndpoint(endpoint) {
    ptr = new _ExecStreamProxyCalls(impl);
  }

  ExecStreamProxy.fromHandle(core.MojoHandle handle) :
      impl = new _ExecStreamProxyImpl.fromHandle(handle) {
    ptr = new _ExecStreamProxyCalls(impl);
  }

  ExecStreamProxy.unbound() :
      impl = new _ExecStreamProxyImpl.unbound() {
    ptr = new _ExecStreamProxyCalls(impl);
  }

  factory ExecStreamProxy.connectToService(
      bindings.ServiceConnector s, String url, [String serviceName]) {
    ExecStreamProxy p = new ExecStreamProxy.unbound();
    s.connectToService(url, p, serviceName);
    return p;
  }

  static ExecStreamProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For ExecStreamProxy"));
    return new ExecStreamProxy.fromEndpoint(endpoint);
  }

  String get serviceName => ExecStream.serviceName;

  Future close({bool immediate: false}) => impl.close(immediate: immediate);

  Future responseOrError(Future f) => impl.responseOrError(f);

  Future get errorFuture => impl.errorFuture;

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


  ExecStreamOnResultResponseParams _ExecStreamOnResultResponseParamsFactory() {
    var mojo_factory_result = new ExecStreamOnResultResponseParams();
    return mojo_factory_result;
  }

  dynamic handleMessage(bindings.ServiceMessage message) {
    if (bindings.ControlMessageHandler.isControlMessage(message)) {
      return bindings.ControlMessageHandler.handleMessage(this,
                                                          0,
                                                          message);
    }
    assert(_impl != null);
    switch (message.header.type) {
      case _ExecStream_onResultName:
        var params = _ExecStreamOnResultParams.deserialize(
            message.payload);
        var response = _impl.onResult(params.result,_ExecStreamOnResultResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  _ExecStream_onResultName,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              _ExecStream_onResultName,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case _ExecStream_onDoneName:
        var params = _ExecStreamOnDoneParams.deserialize(
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

  service_describer.ServiceDescription get serviceDescription =>
    new _ExecStreamServiceDescription();
}

const int _ScanStream_onKeyValueName = 0;
const int _ScanStream_onDoneName = 1;



class _ScanStreamServiceDescription implements service_describer.ServiceDescription {
  dynamic getTopLevelInterface([Function responseFactory]) => null;

  dynamic getTypeDefinition(String typeKey, [Function responseFactory]) => null;

  dynamic getAllTypeDefinitions([Function responseFactory]) => null;
}

abstract class ScanStream {
  static const String serviceName = "v23::syncbase::ScanStream";
  dynamic onKeyValue(KeyValue keyValue,[Function responseFactory = null]);
  void onDone(Error err);
}


class _ScanStreamProxyImpl extends bindings.Proxy {
  _ScanStreamProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  _ScanStreamProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  _ScanStreamProxyImpl.unbound() : super.unbound();

  static _ScanStreamProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For _ScanStreamProxyImpl"));
    return new _ScanStreamProxyImpl.fromEndpoint(endpoint);
  }

  service_describer.ServiceDescription get serviceDescription =>
    new _ScanStreamServiceDescription();

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case _ScanStream_onKeyValueName:
        var r = ScanStreamOnKeyValueResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          proxyError("Expected a message with a valid request Id.");
          return;
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          proxyError(
              "Message had unknown request Id: ${message.header.requestId}");
          return;
        }
        completerMap.remove(message.header.requestId);
        if (c.isCompleted) {
          proxyError("Response completer already completed");
          return;
        }
        c.complete(r);
        break;
      default:
        proxyError("Unexpected message type: ${message.header.type}");
        close(immediate: true);
        break;
    }
  }

  String toString() {
    var superString = super.toString();
    return "_ScanStreamProxyImpl($superString)";
  }
}


class _ScanStreamProxyCalls implements ScanStream {
  _ScanStreamProxyImpl _proxyImpl;

  _ScanStreamProxyCalls(this._proxyImpl);
    dynamic onKeyValue(KeyValue keyValue,[Function responseFactory = null]) {
      var params = new _ScanStreamOnKeyValueParams();
      params.keyValue = keyValue;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          _ScanStream_onKeyValueName,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    void onDone(Error err) {
      if (!_proxyImpl.isBound) {
        _proxyImpl.proxyError("The Proxy is closed.");
        return;
      }
      var params = new _ScanStreamOnDoneParams();
      params.err = err;
      _proxyImpl.sendMessage(params, _ScanStream_onDoneName);
    }
}


class ScanStreamProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  ScanStream ptr;

  ScanStreamProxy(_ScanStreamProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _ScanStreamProxyCalls(proxyImpl);

  ScanStreamProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new _ScanStreamProxyImpl.fromEndpoint(endpoint) {
    ptr = new _ScanStreamProxyCalls(impl);
  }

  ScanStreamProxy.fromHandle(core.MojoHandle handle) :
      impl = new _ScanStreamProxyImpl.fromHandle(handle) {
    ptr = new _ScanStreamProxyCalls(impl);
  }

  ScanStreamProxy.unbound() :
      impl = new _ScanStreamProxyImpl.unbound() {
    ptr = new _ScanStreamProxyCalls(impl);
  }

  factory ScanStreamProxy.connectToService(
      bindings.ServiceConnector s, String url, [String serviceName]) {
    ScanStreamProxy p = new ScanStreamProxy.unbound();
    s.connectToService(url, p, serviceName);
    return p;
  }

  static ScanStreamProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For ScanStreamProxy"));
    return new ScanStreamProxy.fromEndpoint(endpoint);
  }

  String get serviceName => ScanStream.serviceName;

  Future close({bool immediate: false}) => impl.close(immediate: immediate);

  Future responseOrError(Future f) => impl.responseOrError(f);

  Future get errorFuture => impl.errorFuture;

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


  ScanStreamOnKeyValueResponseParams _ScanStreamOnKeyValueResponseParamsFactory() {
    var mojo_factory_result = new ScanStreamOnKeyValueResponseParams();
    return mojo_factory_result;
  }

  dynamic handleMessage(bindings.ServiceMessage message) {
    if (bindings.ControlMessageHandler.isControlMessage(message)) {
      return bindings.ControlMessageHandler.handleMessage(this,
                                                          0,
                                                          message);
    }
    assert(_impl != null);
    switch (message.header.type) {
      case _ScanStream_onKeyValueName:
        var params = _ScanStreamOnKeyValueParams.deserialize(
            message.payload);
        var response = _impl.onKeyValue(params.keyValue,_ScanStreamOnKeyValueResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  _ScanStream_onKeyValueName,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              _ScanStream_onKeyValueName,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case _ScanStream_onDoneName:
        var params = _ScanStreamOnDoneParams.deserialize(
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

  service_describer.ServiceDescription get serviceDescription =>
    new _ScanStreamServiceDescription();
}

const int _WatchGlobStream_onChangeName = 0;
const int _WatchGlobStream_onErrorName = 1;



class _WatchGlobStreamServiceDescription implements service_describer.ServiceDescription {
  dynamic getTopLevelInterface([Function responseFactory]) => null;

  dynamic getTypeDefinition(String typeKey, [Function responseFactory]) => null;

  dynamic getAllTypeDefinitions([Function responseFactory]) => null;
}

abstract class WatchGlobStream {
  static const String serviceName = "v23::syncbase::WatchGlobStream";
  dynamic onChange(WatchChange change,[Function responseFactory = null]);
  void onError(Error err);
}


class _WatchGlobStreamProxyImpl extends bindings.Proxy {
  _WatchGlobStreamProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  _WatchGlobStreamProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  _WatchGlobStreamProxyImpl.unbound() : super.unbound();

  static _WatchGlobStreamProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For _WatchGlobStreamProxyImpl"));
    return new _WatchGlobStreamProxyImpl.fromEndpoint(endpoint);
  }

  service_describer.ServiceDescription get serviceDescription =>
    new _WatchGlobStreamServiceDescription();

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case _WatchGlobStream_onChangeName:
        var r = WatchGlobStreamOnChangeResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          proxyError("Expected a message with a valid request Id.");
          return;
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          proxyError(
              "Message had unknown request Id: ${message.header.requestId}");
          return;
        }
        completerMap.remove(message.header.requestId);
        if (c.isCompleted) {
          proxyError("Response completer already completed");
          return;
        }
        c.complete(r);
        break;
      default:
        proxyError("Unexpected message type: ${message.header.type}");
        close(immediate: true);
        break;
    }
  }

  String toString() {
    var superString = super.toString();
    return "_WatchGlobStreamProxyImpl($superString)";
  }
}


class _WatchGlobStreamProxyCalls implements WatchGlobStream {
  _WatchGlobStreamProxyImpl _proxyImpl;

  _WatchGlobStreamProxyCalls(this._proxyImpl);
    dynamic onChange(WatchChange change,[Function responseFactory = null]) {
      var params = new _WatchGlobStreamOnChangeParams();
      params.change = change;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          _WatchGlobStream_onChangeName,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    void onError(Error err) {
      if (!_proxyImpl.isBound) {
        _proxyImpl.proxyError("The Proxy is closed.");
        return;
      }
      var params = new _WatchGlobStreamOnErrorParams();
      params.err = err;
      _proxyImpl.sendMessage(params, _WatchGlobStream_onErrorName);
    }
}


class WatchGlobStreamProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  WatchGlobStream ptr;

  WatchGlobStreamProxy(_WatchGlobStreamProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _WatchGlobStreamProxyCalls(proxyImpl);

  WatchGlobStreamProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new _WatchGlobStreamProxyImpl.fromEndpoint(endpoint) {
    ptr = new _WatchGlobStreamProxyCalls(impl);
  }

  WatchGlobStreamProxy.fromHandle(core.MojoHandle handle) :
      impl = new _WatchGlobStreamProxyImpl.fromHandle(handle) {
    ptr = new _WatchGlobStreamProxyCalls(impl);
  }

  WatchGlobStreamProxy.unbound() :
      impl = new _WatchGlobStreamProxyImpl.unbound() {
    ptr = new _WatchGlobStreamProxyCalls(impl);
  }

  factory WatchGlobStreamProxy.connectToService(
      bindings.ServiceConnector s, String url, [String serviceName]) {
    WatchGlobStreamProxy p = new WatchGlobStreamProxy.unbound();
    s.connectToService(url, p, serviceName);
    return p;
  }

  static WatchGlobStreamProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For WatchGlobStreamProxy"));
    return new WatchGlobStreamProxy.fromEndpoint(endpoint);
  }

  String get serviceName => WatchGlobStream.serviceName;

  Future close({bool immediate: false}) => impl.close(immediate: immediate);

  Future responseOrError(Future f) => impl.responseOrError(f);

  Future get errorFuture => impl.errorFuture;

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


  WatchGlobStreamOnChangeResponseParams _WatchGlobStreamOnChangeResponseParamsFactory() {
    var mojo_factory_result = new WatchGlobStreamOnChangeResponseParams();
    return mojo_factory_result;
  }

  dynamic handleMessage(bindings.ServiceMessage message) {
    if (bindings.ControlMessageHandler.isControlMessage(message)) {
      return bindings.ControlMessageHandler.handleMessage(this,
                                                          0,
                                                          message);
    }
    assert(_impl != null);
    switch (message.header.type) {
      case _WatchGlobStream_onChangeName:
        var params = _WatchGlobStreamOnChangeParams.deserialize(
            message.payload);
        var response = _impl.onChange(params.change,_WatchGlobStreamOnChangeResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  _WatchGlobStream_onChangeName,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              _WatchGlobStream_onChangeName,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case _WatchGlobStream_onErrorName:
        var params = _WatchGlobStreamOnErrorParams.deserialize(
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

  service_describer.ServiceDescription get serviceDescription =>
    new _WatchGlobStreamServiceDescription();
}

const int _Syncbase_serviceGetPermissionsName = 0;
const int _Syncbase_serviceSetPermissionsName = 1;
const int _Syncbase_serviceListAppsName = 2;
const int _Syncbase_appCreateName = 3;
const int _Syncbase_appDestroyName = 4;
const int _Syncbase_appExistsName = 5;
const int _Syncbase_appGetPermissionsName = 6;
const int _Syncbase_appListDatabasesName = 7;
const int _Syncbase_appSetPermissionsName = 8;
const int _Syncbase_dbCreateName = 9;
const int _Syncbase_dbDestroyName = 10;
const int _Syncbase_dbExistsName = 11;
const int _Syncbase_dbExecName = 12;
const int _Syncbase_dbBeginBatchName = 13;
const int _Syncbase_dbCommitName = 14;
const int _Syncbase_dbAbortName = 15;
const int _Syncbase_dbGetPermissionsName = 16;
const int _Syncbase_dbSetPermissionsName = 17;
const int _Syncbase_dbWatchGlobName = 18;
const int _Syncbase_dbGetResumeMarkerName = 19;
const int _Syncbase_dbListTablesName = 20;
const int _Syncbase_dbGetSyncgroupNamesName = 21;
const int _Syncbase_dbCreateSyncgroupName = 22;
const int _Syncbase_dbJoinSyncgroupName = 23;
const int _Syncbase_dbLeaveSyncgroupName = 24;
const int _Syncbase_dbDestroySyncgroupName = 25;
const int _Syncbase_dbEjectFromSyncgroupName = 26;
const int _Syncbase_dbGetSyncgroupSpecName = 27;
const int _Syncbase_dbSetSyncgroupSpecName = 28;
const int _Syncbase_dbGetSyncgroupMembersName = 29;
const int _Syncbase_tableCreateName = 30;
const int _Syncbase_tableDestroyName = 31;
const int _Syncbase_tableExistsName = 32;
const int _Syncbase_tableGetPermissionsName = 33;
const int _Syncbase_tableSetPermissionsName = 34;
const int _Syncbase_tableDeleteRangeName = 35;
const int _Syncbase_tableScanName = 36;
const int _Syncbase_tableGetPrefixPermissionsName = 37;
const int _Syncbase_tableSetPrefixPermissionsName = 38;
const int _Syncbase_tableDeletePrefixPermissionsName = 39;
const int _Syncbase_rowExistsName = 40;
const int _Syncbase_rowGetName = 41;
const int _Syncbase_rowPutName = 42;
const int _Syncbase_rowDeleteName = 43;



class _SyncbaseServiceDescription implements service_describer.ServiceDescription {
  dynamic getTopLevelInterface([Function responseFactory]) => null;

  dynamic getTypeDefinition(String typeKey, [Function responseFactory]) => null;

  dynamic getAllTypeDefinitions([Function responseFactory]) => null;
}

abstract class Syncbase {
  static const String serviceName = "v23::syncbase::Syncbase";
  dynamic serviceGetPermissions([Function responseFactory = null]);
  dynamic serviceSetPermissions(Perms perms,String version,[Function responseFactory = null]);
  dynamic serviceListApps([Function responseFactory = null]);
  dynamic appCreate(String name,Perms perms,[Function responseFactory = null]);
  dynamic appDestroy(String name,[Function responseFactory = null]);
  dynamic appExists(String name,[Function responseFactory = null]);
  dynamic appGetPermissions(String name,[Function responseFactory = null]);
  dynamic appListDatabases(String name,[Function responseFactory = null]);
  dynamic appSetPermissions(String name,Perms perms,String version,[Function responseFactory = null]);
  dynamic dbCreate(String name,Perms perms,[Function responseFactory = null]);
  dynamic dbDestroy(String name,[Function responseFactory = null]);
  dynamic dbExists(String name,[Function responseFactory = null]);
  dynamic dbExec(String name,String query,List<List<int>> parameters,Object stream,[Function responseFactory = null]);
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


class _SyncbaseProxyImpl extends bindings.Proxy {
  _SyncbaseProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  _SyncbaseProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  _SyncbaseProxyImpl.unbound() : super.unbound();

  static _SyncbaseProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For _SyncbaseProxyImpl"));
    return new _SyncbaseProxyImpl.fromEndpoint(endpoint);
  }

  service_describer.ServiceDescription get serviceDescription =>
    new _SyncbaseServiceDescription();

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case _Syncbase_serviceGetPermissionsName:
        var r = SyncbaseServiceGetPermissionsResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          proxyError("Expected a message with a valid request Id.");
          return;
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          proxyError(
              "Message had unknown request Id: ${message.header.requestId}");
          return;
        }
        completerMap.remove(message.header.requestId);
        if (c.isCompleted) {
          proxyError("Response completer already completed");
          return;
        }
        c.complete(r);
        break;
      case _Syncbase_serviceSetPermissionsName:
        var r = SyncbaseServiceSetPermissionsResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          proxyError("Expected a message with a valid request Id.");
          return;
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          proxyError(
              "Message had unknown request Id: ${message.header.requestId}");
          return;
        }
        completerMap.remove(message.header.requestId);
        if (c.isCompleted) {
          proxyError("Response completer already completed");
          return;
        }
        c.complete(r);
        break;
      case _Syncbase_serviceListAppsName:
        var r = SyncbaseServiceListAppsResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          proxyError("Expected a message with a valid request Id.");
          return;
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          proxyError(
              "Message had unknown request Id: ${message.header.requestId}");
          return;
        }
        completerMap.remove(message.header.requestId);
        if (c.isCompleted) {
          proxyError("Response completer already completed");
          return;
        }
        c.complete(r);
        break;
      case _Syncbase_appCreateName:
        var r = SyncbaseAppCreateResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          proxyError("Expected a message with a valid request Id.");
          return;
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          proxyError(
              "Message had unknown request Id: ${message.header.requestId}");
          return;
        }
        completerMap.remove(message.header.requestId);
        if (c.isCompleted) {
          proxyError("Response completer already completed");
          return;
        }
        c.complete(r);
        break;
      case _Syncbase_appDestroyName:
        var r = SyncbaseAppDestroyResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          proxyError("Expected a message with a valid request Id.");
          return;
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          proxyError(
              "Message had unknown request Id: ${message.header.requestId}");
          return;
        }
        completerMap.remove(message.header.requestId);
        if (c.isCompleted) {
          proxyError("Response completer already completed");
          return;
        }
        c.complete(r);
        break;
      case _Syncbase_appExistsName:
        var r = SyncbaseAppExistsResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          proxyError("Expected a message with a valid request Id.");
          return;
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          proxyError(
              "Message had unknown request Id: ${message.header.requestId}");
          return;
        }
        completerMap.remove(message.header.requestId);
        if (c.isCompleted) {
          proxyError("Response completer already completed");
          return;
        }
        c.complete(r);
        break;
      case _Syncbase_appGetPermissionsName:
        var r = SyncbaseAppGetPermissionsResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          proxyError("Expected a message with a valid request Id.");
          return;
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          proxyError(
              "Message had unknown request Id: ${message.header.requestId}");
          return;
        }
        completerMap.remove(message.header.requestId);
        if (c.isCompleted) {
          proxyError("Response completer already completed");
          return;
        }
        c.complete(r);
        break;
      case _Syncbase_appListDatabasesName:
        var r = SyncbaseAppListDatabasesResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          proxyError("Expected a message with a valid request Id.");
          return;
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          proxyError(
              "Message had unknown request Id: ${message.header.requestId}");
          return;
        }
        completerMap.remove(message.header.requestId);
        if (c.isCompleted) {
          proxyError("Response completer already completed");
          return;
        }
        c.complete(r);
        break;
      case _Syncbase_appSetPermissionsName:
        var r = SyncbaseAppSetPermissionsResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          proxyError("Expected a message with a valid request Id.");
          return;
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          proxyError(
              "Message had unknown request Id: ${message.header.requestId}");
          return;
        }
        completerMap.remove(message.header.requestId);
        if (c.isCompleted) {
          proxyError("Response completer already completed");
          return;
        }
        c.complete(r);
        break;
      case _Syncbase_dbCreateName:
        var r = SyncbaseDbCreateResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          proxyError("Expected a message with a valid request Id.");
          return;
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          proxyError(
              "Message had unknown request Id: ${message.header.requestId}");
          return;
        }
        completerMap.remove(message.header.requestId);
        if (c.isCompleted) {
          proxyError("Response completer already completed");
          return;
        }
        c.complete(r);
        break;
      case _Syncbase_dbDestroyName:
        var r = SyncbaseDbDestroyResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          proxyError("Expected a message with a valid request Id.");
          return;
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          proxyError(
              "Message had unknown request Id: ${message.header.requestId}");
          return;
        }
        completerMap.remove(message.header.requestId);
        if (c.isCompleted) {
          proxyError("Response completer already completed");
          return;
        }
        c.complete(r);
        break;
      case _Syncbase_dbExistsName:
        var r = SyncbaseDbExistsResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          proxyError("Expected a message with a valid request Id.");
          return;
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          proxyError(
              "Message had unknown request Id: ${message.header.requestId}");
          return;
        }
        completerMap.remove(message.header.requestId);
        if (c.isCompleted) {
          proxyError("Response completer already completed");
          return;
        }
        c.complete(r);
        break;
      case _Syncbase_dbExecName:
        var r = SyncbaseDbExecResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          proxyError("Expected a message with a valid request Id.");
          return;
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          proxyError(
              "Message had unknown request Id: ${message.header.requestId}");
          return;
        }
        completerMap.remove(message.header.requestId);
        if (c.isCompleted) {
          proxyError("Response completer already completed");
          return;
        }
        c.complete(r);
        break;
      case _Syncbase_dbBeginBatchName:
        var r = SyncbaseDbBeginBatchResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          proxyError("Expected a message with a valid request Id.");
          return;
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          proxyError(
              "Message had unknown request Id: ${message.header.requestId}");
          return;
        }
        completerMap.remove(message.header.requestId);
        if (c.isCompleted) {
          proxyError("Response completer already completed");
          return;
        }
        c.complete(r);
        break;
      case _Syncbase_dbCommitName:
        var r = SyncbaseDbCommitResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          proxyError("Expected a message with a valid request Id.");
          return;
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          proxyError(
              "Message had unknown request Id: ${message.header.requestId}");
          return;
        }
        completerMap.remove(message.header.requestId);
        if (c.isCompleted) {
          proxyError("Response completer already completed");
          return;
        }
        c.complete(r);
        break;
      case _Syncbase_dbAbortName:
        var r = SyncbaseDbAbortResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          proxyError("Expected a message with a valid request Id.");
          return;
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          proxyError(
              "Message had unknown request Id: ${message.header.requestId}");
          return;
        }
        completerMap.remove(message.header.requestId);
        if (c.isCompleted) {
          proxyError("Response completer already completed");
          return;
        }
        c.complete(r);
        break;
      case _Syncbase_dbGetPermissionsName:
        var r = SyncbaseDbGetPermissionsResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          proxyError("Expected a message with a valid request Id.");
          return;
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          proxyError(
              "Message had unknown request Id: ${message.header.requestId}");
          return;
        }
        completerMap.remove(message.header.requestId);
        if (c.isCompleted) {
          proxyError("Response completer already completed");
          return;
        }
        c.complete(r);
        break;
      case _Syncbase_dbSetPermissionsName:
        var r = SyncbaseDbSetPermissionsResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          proxyError("Expected a message with a valid request Id.");
          return;
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          proxyError(
              "Message had unknown request Id: ${message.header.requestId}");
          return;
        }
        completerMap.remove(message.header.requestId);
        if (c.isCompleted) {
          proxyError("Response completer already completed");
          return;
        }
        c.complete(r);
        break;
      case _Syncbase_dbWatchGlobName:
        var r = SyncbaseDbWatchGlobResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          proxyError("Expected a message with a valid request Id.");
          return;
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          proxyError(
              "Message had unknown request Id: ${message.header.requestId}");
          return;
        }
        completerMap.remove(message.header.requestId);
        if (c.isCompleted) {
          proxyError("Response completer already completed");
          return;
        }
        c.complete(r);
        break;
      case _Syncbase_dbGetResumeMarkerName:
        var r = SyncbaseDbGetResumeMarkerResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          proxyError("Expected a message with a valid request Id.");
          return;
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          proxyError(
              "Message had unknown request Id: ${message.header.requestId}");
          return;
        }
        completerMap.remove(message.header.requestId);
        if (c.isCompleted) {
          proxyError("Response completer already completed");
          return;
        }
        c.complete(r);
        break;
      case _Syncbase_dbListTablesName:
        var r = SyncbaseDbListTablesResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          proxyError("Expected a message with a valid request Id.");
          return;
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          proxyError(
              "Message had unknown request Id: ${message.header.requestId}");
          return;
        }
        completerMap.remove(message.header.requestId);
        if (c.isCompleted) {
          proxyError("Response completer already completed");
          return;
        }
        c.complete(r);
        break;
      case _Syncbase_dbGetSyncgroupNamesName:
        var r = SyncbaseDbGetSyncgroupNamesResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          proxyError("Expected a message with a valid request Id.");
          return;
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          proxyError(
              "Message had unknown request Id: ${message.header.requestId}");
          return;
        }
        completerMap.remove(message.header.requestId);
        if (c.isCompleted) {
          proxyError("Response completer already completed");
          return;
        }
        c.complete(r);
        break;
      case _Syncbase_dbCreateSyncgroupName:
        var r = SyncbaseDbCreateSyncgroupResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          proxyError("Expected a message with a valid request Id.");
          return;
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          proxyError(
              "Message had unknown request Id: ${message.header.requestId}");
          return;
        }
        completerMap.remove(message.header.requestId);
        if (c.isCompleted) {
          proxyError("Response completer already completed");
          return;
        }
        c.complete(r);
        break;
      case _Syncbase_dbJoinSyncgroupName:
        var r = SyncbaseDbJoinSyncgroupResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          proxyError("Expected a message with a valid request Id.");
          return;
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          proxyError(
              "Message had unknown request Id: ${message.header.requestId}");
          return;
        }
        completerMap.remove(message.header.requestId);
        if (c.isCompleted) {
          proxyError("Response completer already completed");
          return;
        }
        c.complete(r);
        break;
      case _Syncbase_dbLeaveSyncgroupName:
        var r = SyncbaseDbLeaveSyncgroupResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          proxyError("Expected a message with a valid request Id.");
          return;
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          proxyError(
              "Message had unknown request Id: ${message.header.requestId}");
          return;
        }
        completerMap.remove(message.header.requestId);
        if (c.isCompleted) {
          proxyError("Response completer already completed");
          return;
        }
        c.complete(r);
        break;
      case _Syncbase_dbDestroySyncgroupName:
        var r = SyncbaseDbDestroySyncgroupResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          proxyError("Expected a message with a valid request Id.");
          return;
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          proxyError(
              "Message had unknown request Id: ${message.header.requestId}");
          return;
        }
        completerMap.remove(message.header.requestId);
        if (c.isCompleted) {
          proxyError("Response completer already completed");
          return;
        }
        c.complete(r);
        break;
      case _Syncbase_dbEjectFromSyncgroupName:
        var r = SyncbaseDbEjectFromSyncgroupResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          proxyError("Expected a message with a valid request Id.");
          return;
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          proxyError(
              "Message had unknown request Id: ${message.header.requestId}");
          return;
        }
        completerMap.remove(message.header.requestId);
        if (c.isCompleted) {
          proxyError("Response completer already completed");
          return;
        }
        c.complete(r);
        break;
      case _Syncbase_dbGetSyncgroupSpecName:
        var r = SyncbaseDbGetSyncgroupSpecResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          proxyError("Expected a message with a valid request Id.");
          return;
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          proxyError(
              "Message had unknown request Id: ${message.header.requestId}");
          return;
        }
        completerMap.remove(message.header.requestId);
        if (c.isCompleted) {
          proxyError("Response completer already completed");
          return;
        }
        c.complete(r);
        break;
      case _Syncbase_dbSetSyncgroupSpecName:
        var r = SyncbaseDbSetSyncgroupSpecResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          proxyError("Expected a message with a valid request Id.");
          return;
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          proxyError(
              "Message had unknown request Id: ${message.header.requestId}");
          return;
        }
        completerMap.remove(message.header.requestId);
        if (c.isCompleted) {
          proxyError("Response completer already completed");
          return;
        }
        c.complete(r);
        break;
      case _Syncbase_dbGetSyncgroupMembersName:
        var r = SyncbaseDbGetSyncgroupMembersResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          proxyError("Expected a message with a valid request Id.");
          return;
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          proxyError(
              "Message had unknown request Id: ${message.header.requestId}");
          return;
        }
        completerMap.remove(message.header.requestId);
        if (c.isCompleted) {
          proxyError("Response completer already completed");
          return;
        }
        c.complete(r);
        break;
      case _Syncbase_tableCreateName:
        var r = SyncbaseTableCreateResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          proxyError("Expected a message with a valid request Id.");
          return;
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          proxyError(
              "Message had unknown request Id: ${message.header.requestId}");
          return;
        }
        completerMap.remove(message.header.requestId);
        if (c.isCompleted) {
          proxyError("Response completer already completed");
          return;
        }
        c.complete(r);
        break;
      case _Syncbase_tableDestroyName:
        var r = SyncbaseTableDestroyResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          proxyError("Expected a message with a valid request Id.");
          return;
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          proxyError(
              "Message had unknown request Id: ${message.header.requestId}");
          return;
        }
        completerMap.remove(message.header.requestId);
        if (c.isCompleted) {
          proxyError("Response completer already completed");
          return;
        }
        c.complete(r);
        break;
      case _Syncbase_tableExistsName:
        var r = SyncbaseTableExistsResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          proxyError("Expected a message with a valid request Id.");
          return;
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          proxyError(
              "Message had unknown request Id: ${message.header.requestId}");
          return;
        }
        completerMap.remove(message.header.requestId);
        if (c.isCompleted) {
          proxyError("Response completer already completed");
          return;
        }
        c.complete(r);
        break;
      case _Syncbase_tableGetPermissionsName:
        var r = SyncbaseTableGetPermissionsResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          proxyError("Expected a message with a valid request Id.");
          return;
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          proxyError(
              "Message had unknown request Id: ${message.header.requestId}");
          return;
        }
        completerMap.remove(message.header.requestId);
        if (c.isCompleted) {
          proxyError("Response completer already completed");
          return;
        }
        c.complete(r);
        break;
      case _Syncbase_tableSetPermissionsName:
        var r = SyncbaseTableSetPermissionsResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          proxyError("Expected a message with a valid request Id.");
          return;
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          proxyError(
              "Message had unknown request Id: ${message.header.requestId}");
          return;
        }
        completerMap.remove(message.header.requestId);
        if (c.isCompleted) {
          proxyError("Response completer already completed");
          return;
        }
        c.complete(r);
        break;
      case _Syncbase_tableDeleteRangeName:
        var r = SyncbaseTableDeleteRangeResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          proxyError("Expected a message with a valid request Id.");
          return;
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          proxyError(
              "Message had unknown request Id: ${message.header.requestId}");
          return;
        }
        completerMap.remove(message.header.requestId);
        if (c.isCompleted) {
          proxyError("Response completer already completed");
          return;
        }
        c.complete(r);
        break;
      case _Syncbase_tableScanName:
        var r = SyncbaseTableScanResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          proxyError("Expected a message with a valid request Id.");
          return;
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          proxyError(
              "Message had unknown request Id: ${message.header.requestId}");
          return;
        }
        completerMap.remove(message.header.requestId);
        if (c.isCompleted) {
          proxyError("Response completer already completed");
          return;
        }
        c.complete(r);
        break;
      case _Syncbase_tableGetPrefixPermissionsName:
        var r = SyncbaseTableGetPrefixPermissionsResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          proxyError("Expected a message with a valid request Id.");
          return;
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          proxyError(
              "Message had unknown request Id: ${message.header.requestId}");
          return;
        }
        completerMap.remove(message.header.requestId);
        if (c.isCompleted) {
          proxyError("Response completer already completed");
          return;
        }
        c.complete(r);
        break;
      case _Syncbase_tableSetPrefixPermissionsName:
        var r = SyncbaseTableSetPrefixPermissionsResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          proxyError("Expected a message with a valid request Id.");
          return;
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          proxyError(
              "Message had unknown request Id: ${message.header.requestId}");
          return;
        }
        completerMap.remove(message.header.requestId);
        if (c.isCompleted) {
          proxyError("Response completer already completed");
          return;
        }
        c.complete(r);
        break;
      case _Syncbase_tableDeletePrefixPermissionsName:
        var r = SyncbaseTableDeletePrefixPermissionsResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          proxyError("Expected a message with a valid request Id.");
          return;
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          proxyError(
              "Message had unknown request Id: ${message.header.requestId}");
          return;
        }
        completerMap.remove(message.header.requestId);
        if (c.isCompleted) {
          proxyError("Response completer already completed");
          return;
        }
        c.complete(r);
        break;
      case _Syncbase_rowExistsName:
        var r = SyncbaseRowExistsResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          proxyError("Expected a message with a valid request Id.");
          return;
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          proxyError(
              "Message had unknown request Id: ${message.header.requestId}");
          return;
        }
        completerMap.remove(message.header.requestId);
        if (c.isCompleted) {
          proxyError("Response completer already completed");
          return;
        }
        c.complete(r);
        break;
      case _Syncbase_rowGetName:
        var r = SyncbaseRowGetResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          proxyError("Expected a message with a valid request Id.");
          return;
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          proxyError(
              "Message had unknown request Id: ${message.header.requestId}");
          return;
        }
        completerMap.remove(message.header.requestId);
        if (c.isCompleted) {
          proxyError("Response completer already completed");
          return;
        }
        c.complete(r);
        break;
      case _Syncbase_rowPutName:
        var r = SyncbaseRowPutResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          proxyError("Expected a message with a valid request Id.");
          return;
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          proxyError(
              "Message had unknown request Id: ${message.header.requestId}");
          return;
        }
        completerMap.remove(message.header.requestId);
        if (c.isCompleted) {
          proxyError("Response completer already completed");
          return;
        }
        c.complete(r);
        break;
      case _Syncbase_rowDeleteName:
        var r = SyncbaseRowDeleteResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          proxyError("Expected a message with a valid request Id.");
          return;
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          proxyError(
              "Message had unknown request Id: ${message.header.requestId}");
          return;
        }
        completerMap.remove(message.header.requestId);
        if (c.isCompleted) {
          proxyError("Response completer already completed");
          return;
        }
        c.complete(r);
        break;
      default:
        proxyError("Unexpected message type: ${message.header.type}");
        close(immediate: true);
        break;
    }
  }

  String toString() {
    var superString = super.toString();
    return "_SyncbaseProxyImpl($superString)";
  }
}


class _SyncbaseProxyCalls implements Syncbase {
  _SyncbaseProxyImpl _proxyImpl;

  _SyncbaseProxyCalls(this._proxyImpl);
    dynamic serviceGetPermissions([Function responseFactory = null]) {
      var params = new _SyncbaseServiceGetPermissionsParams();
      return _proxyImpl.sendMessageWithRequestId(
          params,
          _Syncbase_serviceGetPermissionsName,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic serviceSetPermissions(Perms perms,String version,[Function responseFactory = null]) {
      var params = new _SyncbaseServiceSetPermissionsParams();
      params.perms = perms;
      params.version = version;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          _Syncbase_serviceSetPermissionsName,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic serviceListApps([Function responseFactory = null]) {
      var params = new _SyncbaseServiceListAppsParams();
      return _proxyImpl.sendMessageWithRequestId(
          params,
          _Syncbase_serviceListAppsName,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic appCreate(String name,Perms perms,[Function responseFactory = null]) {
      var params = new _SyncbaseAppCreateParams();
      params.name = name;
      params.perms = perms;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          _Syncbase_appCreateName,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic appDestroy(String name,[Function responseFactory = null]) {
      var params = new _SyncbaseAppDestroyParams();
      params.name = name;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          _Syncbase_appDestroyName,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic appExists(String name,[Function responseFactory = null]) {
      var params = new _SyncbaseAppExistsParams();
      params.name = name;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          _Syncbase_appExistsName,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic appGetPermissions(String name,[Function responseFactory = null]) {
      var params = new _SyncbaseAppGetPermissionsParams();
      params.name = name;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          _Syncbase_appGetPermissionsName,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic appListDatabases(String name,[Function responseFactory = null]) {
      var params = new _SyncbaseAppListDatabasesParams();
      params.name = name;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          _Syncbase_appListDatabasesName,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic appSetPermissions(String name,Perms perms,String version,[Function responseFactory = null]) {
      var params = new _SyncbaseAppSetPermissionsParams();
      params.name = name;
      params.perms = perms;
      params.version = version;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          _Syncbase_appSetPermissionsName,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic dbCreate(String name,Perms perms,[Function responseFactory = null]) {
      var params = new _SyncbaseDbCreateParams();
      params.name = name;
      params.perms = perms;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          _Syncbase_dbCreateName,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic dbDestroy(String name,[Function responseFactory = null]) {
      var params = new _SyncbaseDbDestroyParams();
      params.name = name;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          _Syncbase_dbDestroyName,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic dbExists(String name,[Function responseFactory = null]) {
      var params = new _SyncbaseDbExistsParams();
      params.name = name;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          _Syncbase_dbExistsName,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic dbExec(String name,String query,List<List<int>> parameters,Object stream,[Function responseFactory = null]) {
      var params = new _SyncbaseDbExecParams();
      params.name = name;
      params.query = query;
      params.parameters = parameters;
      params.stream = stream;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          _Syncbase_dbExecName,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic dbBeginBatch(String name,BatchOptions bo,[Function responseFactory = null]) {
      var params = new _SyncbaseDbBeginBatchParams();
      params.name = name;
      params.bo = bo;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          _Syncbase_dbBeginBatchName,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic dbCommit(String name,[Function responseFactory = null]) {
      var params = new _SyncbaseDbCommitParams();
      params.name = name;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          _Syncbase_dbCommitName,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic dbAbort(String name,[Function responseFactory = null]) {
      var params = new _SyncbaseDbAbortParams();
      params.name = name;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          _Syncbase_dbAbortName,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic dbGetPermissions(String name,[Function responseFactory = null]) {
      var params = new _SyncbaseDbGetPermissionsParams();
      params.name = name;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          _Syncbase_dbGetPermissionsName,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic dbSetPermissions(String name,Perms perms,String version,[Function responseFactory = null]) {
      var params = new _SyncbaseDbSetPermissionsParams();
      params.name = name;
      params.perms = perms;
      params.version = version;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          _Syncbase_dbSetPermissionsName,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic dbWatchGlob(String name,GlobRequest req,Object stream,[Function responseFactory = null]) {
      var params = new _SyncbaseDbWatchGlobParams();
      params.name = name;
      params.req = req;
      params.stream = stream;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          _Syncbase_dbWatchGlobName,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic dbGetResumeMarker(String name,[Function responseFactory = null]) {
      var params = new _SyncbaseDbGetResumeMarkerParams();
      params.name = name;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          _Syncbase_dbGetResumeMarkerName,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic dbListTables(String name,[Function responseFactory = null]) {
      var params = new _SyncbaseDbListTablesParams();
      params.name = name;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          _Syncbase_dbListTablesName,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic dbGetSyncgroupNames(String name,[Function responseFactory = null]) {
      var params = new _SyncbaseDbGetSyncgroupNamesParams();
      params.name = name;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          _Syncbase_dbGetSyncgroupNamesName,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic dbCreateSyncgroup(String name,String sgName,SyncgroupSpec spec,SyncgroupMemberInfo myInfo,[Function responseFactory = null]) {
      var params = new _SyncbaseDbCreateSyncgroupParams();
      params.name = name;
      params.sgName = sgName;
      params.spec = spec;
      params.myInfo = myInfo;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          _Syncbase_dbCreateSyncgroupName,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic dbJoinSyncgroup(String name,String sgName,SyncgroupMemberInfo myInfo,[Function responseFactory = null]) {
      var params = new _SyncbaseDbJoinSyncgroupParams();
      params.name = name;
      params.sgName = sgName;
      params.myInfo = myInfo;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          _Syncbase_dbJoinSyncgroupName,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic dbLeaveSyncgroup(String name,String sgName,[Function responseFactory = null]) {
      var params = new _SyncbaseDbLeaveSyncgroupParams();
      params.name = name;
      params.sgName = sgName;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          _Syncbase_dbLeaveSyncgroupName,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic dbDestroySyncgroup(String name,String sgName,[Function responseFactory = null]) {
      var params = new _SyncbaseDbDestroySyncgroupParams();
      params.name = name;
      params.sgName = sgName;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          _Syncbase_dbDestroySyncgroupName,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic dbEjectFromSyncgroup(String name,String sgName,String member,[Function responseFactory = null]) {
      var params = new _SyncbaseDbEjectFromSyncgroupParams();
      params.name = name;
      params.sgName = sgName;
      params.member = member;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          _Syncbase_dbEjectFromSyncgroupName,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic dbGetSyncgroupSpec(String name,String sgName,[Function responseFactory = null]) {
      var params = new _SyncbaseDbGetSyncgroupSpecParams();
      params.name = name;
      params.sgName = sgName;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          _Syncbase_dbGetSyncgroupSpecName,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic dbSetSyncgroupSpec(String name,String sgName,SyncgroupSpec spec,String version,[Function responseFactory = null]) {
      var params = new _SyncbaseDbSetSyncgroupSpecParams();
      params.name = name;
      params.sgName = sgName;
      params.spec = spec;
      params.version = version;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          _Syncbase_dbSetSyncgroupSpecName,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic dbGetSyncgroupMembers(String name,String sgName,[Function responseFactory = null]) {
      var params = new _SyncbaseDbGetSyncgroupMembersParams();
      params.name = name;
      params.sgName = sgName;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          _Syncbase_dbGetSyncgroupMembersName,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic tableCreate(String name,Perms perms,[Function responseFactory = null]) {
      var params = new _SyncbaseTableCreateParams();
      params.name = name;
      params.perms = perms;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          _Syncbase_tableCreateName,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic tableDestroy(String name,[Function responseFactory = null]) {
      var params = new _SyncbaseTableDestroyParams();
      params.name = name;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          _Syncbase_tableDestroyName,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic tableExists(String name,[Function responseFactory = null]) {
      var params = new _SyncbaseTableExistsParams();
      params.name = name;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          _Syncbase_tableExistsName,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic tableGetPermissions(String name,[Function responseFactory = null]) {
      var params = new _SyncbaseTableGetPermissionsParams();
      params.name = name;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          _Syncbase_tableGetPermissionsName,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic tableSetPermissions(String name,Perms perms,[Function responseFactory = null]) {
      var params = new _SyncbaseTableSetPermissionsParams();
      params.name = name;
      params.perms = perms;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          _Syncbase_tableSetPermissionsName,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic tableDeleteRange(String name,List<int> start,List<int> limit,[Function responseFactory = null]) {
      var params = new _SyncbaseTableDeleteRangeParams();
      params.name = name;
      params.start = start;
      params.limit = limit;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          _Syncbase_tableDeleteRangeName,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic tableScan(String name,List<int> start,List<int> limit,Object stream,[Function responseFactory = null]) {
      var params = new _SyncbaseTableScanParams();
      params.name = name;
      params.start = start;
      params.limit = limit;
      params.stream = stream;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          _Syncbase_tableScanName,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic tableGetPrefixPermissions(String name,String key,[Function responseFactory = null]) {
      var params = new _SyncbaseTableGetPrefixPermissionsParams();
      params.name = name;
      params.key = key;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          _Syncbase_tableGetPrefixPermissionsName,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic tableSetPrefixPermissions(String name,String prefix,Perms perms,[Function responseFactory = null]) {
      var params = new _SyncbaseTableSetPrefixPermissionsParams();
      params.name = name;
      params.prefix = prefix;
      params.perms = perms;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          _Syncbase_tableSetPrefixPermissionsName,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic tableDeletePrefixPermissions(String name,String prefix,[Function responseFactory = null]) {
      var params = new _SyncbaseTableDeletePrefixPermissionsParams();
      params.name = name;
      params.prefix = prefix;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          _Syncbase_tableDeletePrefixPermissionsName,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic rowExists(String name,[Function responseFactory = null]) {
      var params = new _SyncbaseRowExistsParams();
      params.name = name;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          _Syncbase_rowExistsName,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic rowGet(String name,[Function responseFactory = null]) {
      var params = new _SyncbaseRowGetParams();
      params.name = name;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          _Syncbase_rowGetName,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic rowPut(String name,List<int> value,[Function responseFactory = null]) {
      var params = new _SyncbaseRowPutParams();
      params.name = name;
      params.value = value;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          _Syncbase_rowPutName,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic rowDelete(String name,[Function responseFactory = null]) {
      var params = new _SyncbaseRowDeleteParams();
      params.name = name;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          _Syncbase_rowDeleteName,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
}


class SyncbaseProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  Syncbase ptr;

  SyncbaseProxy(_SyncbaseProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _SyncbaseProxyCalls(proxyImpl);

  SyncbaseProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new _SyncbaseProxyImpl.fromEndpoint(endpoint) {
    ptr = new _SyncbaseProxyCalls(impl);
  }

  SyncbaseProxy.fromHandle(core.MojoHandle handle) :
      impl = new _SyncbaseProxyImpl.fromHandle(handle) {
    ptr = new _SyncbaseProxyCalls(impl);
  }

  SyncbaseProxy.unbound() :
      impl = new _SyncbaseProxyImpl.unbound() {
    ptr = new _SyncbaseProxyCalls(impl);
  }

  factory SyncbaseProxy.connectToService(
      bindings.ServiceConnector s, String url, [String serviceName]) {
    SyncbaseProxy p = new SyncbaseProxy.unbound();
    s.connectToService(url, p, serviceName);
    return p;
  }

  static SyncbaseProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For SyncbaseProxy"));
    return new SyncbaseProxy.fromEndpoint(endpoint);
  }

  String get serviceName => Syncbase.serviceName;

  Future close({bool immediate: false}) => impl.close(immediate: immediate);

  Future responseOrError(Future f) => impl.responseOrError(f);

  Future get errorFuture => impl.errorFuture;

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


  SyncbaseServiceGetPermissionsResponseParams _SyncbaseServiceGetPermissionsResponseParamsFactory(Error err, Perms perms, String version) {
    var mojo_factory_result = new SyncbaseServiceGetPermissionsResponseParams();
    mojo_factory_result.err = err;
    mojo_factory_result.perms = perms;
    mojo_factory_result.version = version;
    return mojo_factory_result;
  }
  SyncbaseServiceSetPermissionsResponseParams _SyncbaseServiceSetPermissionsResponseParamsFactory(Error err) {
    var mojo_factory_result = new SyncbaseServiceSetPermissionsResponseParams();
    mojo_factory_result.err = err;
    return mojo_factory_result;
  }
  SyncbaseServiceListAppsResponseParams _SyncbaseServiceListAppsResponseParamsFactory(Error err, List<String> apps) {
    var mojo_factory_result = new SyncbaseServiceListAppsResponseParams();
    mojo_factory_result.err = err;
    mojo_factory_result.apps = apps;
    return mojo_factory_result;
  }
  SyncbaseAppCreateResponseParams _SyncbaseAppCreateResponseParamsFactory(Error err) {
    var mojo_factory_result = new SyncbaseAppCreateResponseParams();
    mojo_factory_result.err = err;
    return mojo_factory_result;
  }
  SyncbaseAppDestroyResponseParams _SyncbaseAppDestroyResponseParamsFactory(Error err) {
    var mojo_factory_result = new SyncbaseAppDestroyResponseParams();
    mojo_factory_result.err = err;
    return mojo_factory_result;
  }
  SyncbaseAppExistsResponseParams _SyncbaseAppExistsResponseParamsFactory(Error err, bool exists) {
    var mojo_factory_result = new SyncbaseAppExistsResponseParams();
    mojo_factory_result.err = err;
    mojo_factory_result.exists = exists;
    return mojo_factory_result;
  }
  SyncbaseAppGetPermissionsResponseParams _SyncbaseAppGetPermissionsResponseParamsFactory(Error err, Perms perms, String version) {
    var mojo_factory_result = new SyncbaseAppGetPermissionsResponseParams();
    mojo_factory_result.err = err;
    mojo_factory_result.perms = perms;
    mojo_factory_result.version = version;
    return mojo_factory_result;
  }
  SyncbaseAppListDatabasesResponseParams _SyncbaseAppListDatabasesResponseParamsFactory(Error err, List<String> databases) {
    var mojo_factory_result = new SyncbaseAppListDatabasesResponseParams();
    mojo_factory_result.err = err;
    mojo_factory_result.databases = databases;
    return mojo_factory_result;
  }
  SyncbaseAppSetPermissionsResponseParams _SyncbaseAppSetPermissionsResponseParamsFactory(Error err) {
    var mojo_factory_result = new SyncbaseAppSetPermissionsResponseParams();
    mojo_factory_result.err = err;
    return mojo_factory_result;
  }
  SyncbaseDbCreateResponseParams _SyncbaseDbCreateResponseParamsFactory(Error err) {
    var mojo_factory_result = new SyncbaseDbCreateResponseParams();
    mojo_factory_result.err = err;
    return mojo_factory_result;
  }
  SyncbaseDbDestroyResponseParams _SyncbaseDbDestroyResponseParamsFactory(Error err) {
    var mojo_factory_result = new SyncbaseDbDestroyResponseParams();
    mojo_factory_result.err = err;
    return mojo_factory_result;
  }
  SyncbaseDbExistsResponseParams _SyncbaseDbExistsResponseParamsFactory(Error err, bool exists) {
    var mojo_factory_result = new SyncbaseDbExistsResponseParams();
    mojo_factory_result.err = err;
    mojo_factory_result.exists = exists;
    return mojo_factory_result;
  }
  SyncbaseDbExecResponseParams _SyncbaseDbExecResponseParamsFactory(Error err) {
    var mojo_factory_result = new SyncbaseDbExecResponseParams();
    mojo_factory_result.err = err;
    return mojo_factory_result;
  }
  SyncbaseDbBeginBatchResponseParams _SyncbaseDbBeginBatchResponseParamsFactory(Error err, String batchSuffix) {
    var mojo_factory_result = new SyncbaseDbBeginBatchResponseParams();
    mojo_factory_result.err = err;
    mojo_factory_result.batchSuffix = batchSuffix;
    return mojo_factory_result;
  }
  SyncbaseDbCommitResponseParams _SyncbaseDbCommitResponseParamsFactory(Error err) {
    var mojo_factory_result = new SyncbaseDbCommitResponseParams();
    mojo_factory_result.err = err;
    return mojo_factory_result;
  }
  SyncbaseDbAbortResponseParams _SyncbaseDbAbortResponseParamsFactory(Error err) {
    var mojo_factory_result = new SyncbaseDbAbortResponseParams();
    mojo_factory_result.err = err;
    return mojo_factory_result;
  }
  SyncbaseDbGetPermissionsResponseParams _SyncbaseDbGetPermissionsResponseParamsFactory(Error err, Perms perms, String version) {
    var mojo_factory_result = new SyncbaseDbGetPermissionsResponseParams();
    mojo_factory_result.err = err;
    mojo_factory_result.perms = perms;
    mojo_factory_result.version = version;
    return mojo_factory_result;
  }
  SyncbaseDbSetPermissionsResponseParams _SyncbaseDbSetPermissionsResponseParamsFactory(Error err) {
    var mojo_factory_result = new SyncbaseDbSetPermissionsResponseParams();
    mojo_factory_result.err = err;
    return mojo_factory_result;
  }
  SyncbaseDbWatchGlobResponseParams _SyncbaseDbWatchGlobResponseParamsFactory(Error err) {
    var mojo_factory_result = new SyncbaseDbWatchGlobResponseParams();
    mojo_factory_result.err = err;
    return mojo_factory_result;
  }
  SyncbaseDbGetResumeMarkerResponseParams _SyncbaseDbGetResumeMarkerResponseParamsFactory(Error err, List<int> resumeMarker) {
    var mojo_factory_result = new SyncbaseDbGetResumeMarkerResponseParams();
    mojo_factory_result.err = err;
    mojo_factory_result.resumeMarker = resumeMarker;
    return mojo_factory_result;
  }
  SyncbaseDbListTablesResponseParams _SyncbaseDbListTablesResponseParamsFactory(Error err, List<String> tables) {
    var mojo_factory_result = new SyncbaseDbListTablesResponseParams();
    mojo_factory_result.err = err;
    mojo_factory_result.tables = tables;
    return mojo_factory_result;
  }
  SyncbaseDbGetSyncgroupNamesResponseParams _SyncbaseDbGetSyncgroupNamesResponseParamsFactory(Error err, List<String> names) {
    var mojo_factory_result = new SyncbaseDbGetSyncgroupNamesResponseParams();
    mojo_factory_result.err = err;
    mojo_factory_result.names = names;
    return mojo_factory_result;
  }
  SyncbaseDbCreateSyncgroupResponseParams _SyncbaseDbCreateSyncgroupResponseParamsFactory(Error err) {
    var mojo_factory_result = new SyncbaseDbCreateSyncgroupResponseParams();
    mojo_factory_result.err = err;
    return mojo_factory_result;
  }
  SyncbaseDbJoinSyncgroupResponseParams _SyncbaseDbJoinSyncgroupResponseParamsFactory(Error err, SyncgroupSpec spec) {
    var mojo_factory_result = new SyncbaseDbJoinSyncgroupResponseParams();
    mojo_factory_result.err = err;
    mojo_factory_result.spec = spec;
    return mojo_factory_result;
  }
  SyncbaseDbLeaveSyncgroupResponseParams _SyncbaseDbLeaveSyncgroupResponseParamsFactory(Error err) {
    var mojo_factory_result = new SyncbaseDbLeaveSyncgroupResponseParams();
    mojo_factory_result.err = err;
    return mojo_factory_result;
  }
  SyncbaseDbDestroySyncgroupResponseParams _SyncbaseDbDestroySyncgroupResponseParamsFactory(Error err) {
    var mojo_factory_result = new SyncbaseDbDestroySyncgroupResponseParams();
    mojo_factory_result.err = err;
    return mojo_factory_result;
  }
  SyncbaseDbEjectFromSyncgroupResponseParams _SyncbaseDbEjectFromSyncgroupResponseParamsFactory(Error err) {
    var mojo_factory_result = new SyncbaseDbEjectFromSyncgroupResponseParams();
    mojo_factory_result.err = err;
    return mojo_factory_result;
  }
  SyncbaseDbGetSyncgroupSpecResponseParams _SyncbaseDbGetSyncgroupSpecResponseParamsFactory(Error err, SyncgroupSpec spec, String version) {
    var mojo_factory_result = new SyncbaseDbGetSyncgroupSpecResponseParams();
    mojo_factory_result.err = err;
    mojo_factory_result.spec = spec;
    mojo_factory_result.version = version;
    return mojo_factory_result;
  }
  SyncbaseDbSetSyncgroupSpecResponseParams _SyncbaseDbSetSyncgroupSpecResponseParamsFactory(Error err) {
    var mojo_factory_result = new SyncbaseDbSetSyncgroupSpecResponseParams();
    mojo_factory_result.err = err;
    return mojo_factory_result;
  }
  SyncbaseDbGetSyncgroupMembersResponseParams _SyncbaseDbGetSyncgroupMembersResponseParamsFactory(Error err, Map<String, SyncgroupMemberInfo> infos) {
    var mojo_factory_result = new SyncbaseDbGetSyncgroupMembersResponseParams();
    mojo_factory_result.err = err;
    mojo_factory_result.infos = infos;
    return mojo_factory_result;
  }
  SyncbaseTableCreateResponseParams _SyncbaseTableCreateResponseParamsFactory(Error err) {
    var mojo_factory_result = new SyncbaseTableCreateResponseParams();
    mojo_factory_result.err = err;
    return mojo_factory_result;
  }
  SyncbaseTableDestroyResponseParams _SyncbaseTableDestroyResponseParamsFactory(Error err) {
    var mojo_factory_result = new SyncbaseTableDestroyResponseParams();
    mojo_factory_result.err = err;
    return mojo_factory_result;
  }
  SyncbaseTableExistsResponseParams _SyncbaseTableExistsResponseParamsFactory(Error err, bool exists) {
    var mojo_factory_result = new SyncbaseTableExistsResponseParams();
    mojo_factory_result.err = err;
    mojo_factory_result.exists = exists;
    return mojo_factory_result;
  }
  SyncbaseTableGetPermissionsResponseParams _SyncbaseTableGetPermissionsResponseParamsFactory(Error err, Perms perms) {
    var mojo_factory_result = new SyncbaseTableGetPermissionsResponseParams();
    mojo_factory_result.err = err;
    mojo_factory_result.perms = perms;
    return mojo_factory_result;
  }
  SyncbaseTableSetPermissionsResponseParams _SyncbaseTableSetPermissionsResponseParamsFactory(Error err) {
    var mojo_factory_result = new SyncbaseTableSetPermissionsResponseParams();
    mojo_factory_result.err = err;
    return mojo_factory_result;
  }
  SyncbaseTableDeleteRangeResponseParams _SyncbaseTableDeleteRangeResponseParamsFactory(Error err) {
    var mojo_factory_result = new SyncbaseTableDeleteRangeResponseParams();
    mojo_factory_result.err = err;
    return mojo_factory_result;
  }
  SyncbaseTableScanResponseParams _SyncbaseTableScanResponseParamsFactory(Error err) {
    var mojo_factory_result = new SyncbaseTableScanResponseParams();
    mojo_factory_result.err = err;
    return mojo_factory_result;
  }
  SyncbaseTableGetPrefixPermissionsResponseParams _SyncbaseTableGetPrefixPermissionsResponseParamsFactory(Error err, List<PrefixPerms> permsArr) {
    var mojo_factory_result = new SyncbaseTableGetPrefixPermissionsResponseParams();
    mojo_factory_result.err = err;
    mojo_factory_result.permsArr = permsArr;
    return mojo_factory_result;
  }
  SyncbaseTableSetPrefixPermissionsResponseParams _SyncbaseTableSetPrefixPermissionsResponseParamsFactory(Error err) {
    var mojo_factory_result = new SyncbaseTableSetPrefixPermissionsResponseParams();
    mojo_factory_result.err = err;
    return mojo_factory_result;
  }
  SyncbaseTableDeletePrefixPermissionsResponseParams _SyncbaseTableDeletePrefixPermissionsResponseParamsFactory(Error err) {
    var mojo_factory_result = new SyncbaseTableDeletePrefixPermissionsResponseParams();
    mojo_factory_result.err = err;
    return mojo_factory_result;
  }
  SyncbaseRowExistsResponseParams _SyncbaseRowExistsResponseParamsFactory(Error err, bool exists) {
    var mojo_factory_result = new SyncbaseRowExistsResponseParams();
    mojo_factory_result.err = err;
    mojo_factory_result.exists = exists;
    return mojo_factory_result;
  }
  SyncbaseRowGetResponseParams _SyncbaseRowGetResponseParamsFactory(Error err, List<int> value) {
    var mojo_factory_result = new SyncbaseRowGetResponseParams();
    mojo_factory_result.err = err;
    mojo_factory_result.value = value;
    return mojo_factory_result;
  }
  SyncbaseRowPutResponseParams _SyncbaseRowPutResponseParamsFactory(Error err) {
    var mojo_factory_result = new SyncbaseRowPutResponseParams();
    mojo_factory_result.err = err;
    return mojo_factory_result;
  }
  SyncbaseRowDeleteResponseParams _SyncbaseRowDeleteResponseParamsFactory(Error err) {
    var mojo_factory_result = new SyncbaseRowDeleteResponseParams();
    mojo_factory_result.err = err;
    return mojo_factory_result;
  }

  dynamic handleMessage(bindings.ServiceMessage message) {
    if (bindings.ControlMessageHandler.isControlMessage(message)) {
      return bindings.ControlMessageHandler.handleMessage(this,
                                                          0,
                                                          message);
    }
    assert(_impl != null);
    switch (message.header.type) {
      case _Syncbase_serviceGetPermissionsName:
        var params = _SyncbaseServiceGetPermissionsParams.deserialize(
            message.payload);
        var response = _impl.serviceGetPermissions(_SyncbaseServiceGetPermissionsResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  _Syncbase_serviceGetPermissionsName,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              _Syncbase_serviceGetPermissionsName,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case _Syncbase_serviceSetPermissionsName:
        var params = _SyncbaseServiceSetPermissionsParams.deserialize(
            message.payload);
        var response = _impl.serviceSetPermissions(params.perms,params.version,_SyncbaseServiceSetPermissionsResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  _Syncbase_serviceSetPermissionsName,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              _Syncbase_serviceSetPermissionsName,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case _Syncbase_serviceListAppsName:
        var params = _SyncbaseServiceListAppsParams.deserialize(
            message.payload);
        var response = _impl.serviceListApps(_SyncbaseServiceListAppsResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  _Syncbase_serviceListAppsName,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              _Syncbase_serviceListAppsName,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case _Syncbase_appCreateName:
        var params = _SyncbaseAppCreateParams.deserialize(
            message.payload);
        var response = _impl.appCreate(params.name,params.perms,_SyncbaseAppCreateResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  _Syncbase_appCreateName,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              _Syncbase_appCreateName,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case _Syncbase_appDestroyName:
        var params = _SyncbaseAppDestroyParams.deserialize(
            message.payload);
        var response = _impl.appDestroy(params.name,_SyncbaseAppDestroyResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  _Syncbase_appDestroyName,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              _Syncbase_appDestroyName,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case _Syncbase_appExistsName:
        var params = _SyncbaseAppExistsParams.deserialize(
            message.payload);
        var response = _impl.appExists(params.name,_SyncbaseAppExistsResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  _Syncbase_appExistsName,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              _Syncbase_appExistsName,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case _Syncbase_appGetPermissionsName:
        var params = _SyncbaseAppGetPermissionsParams.deserialize(
            message.payload);
        var response = _impl.appGetPermissions(params.name,_SyncbaseAppGetPermissionsResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  _Syncbase_appGetPermissionsName,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              _Syncbase_appGetPermissionsName,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case _Syncbase_appListDatabasesName:
        var params = _SyncbaseAppListDatabasesParams.deserialize(
            message.payload);
        var response = _impl.appListDatabases(params.name,_SyncbaseAppListDatabasesResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  _Syncbase_appListDatabasesName,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              _Syncbase_appListDatabasesName,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case _Syncbase_appSetPermissionsName:
        var params = _SyncbaseAppSetPermissionsParams.deserialize(
            message.payload);
        var response = _impl.appSetPermissions(params.name,params.perms,params.version,_SyncbaseAppSetPermissionsResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  _Syncbase_appSetPermissionsName,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              _Syncbase_appSetPermissionsName,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case _Syncbase_dbCreateName:
        var params = _SyncbaseDbCreateParams.deserialize(
            message.payload);
        var response = _impl.dbCreate(params.name,params.perms,_SyncbaseDbCreateResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  _Syncbase_dbCreateName,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              _Syncbase_dbCreateName,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case _Syncbase_dbDestroyName:
        var params = _SyncbaseDbDestroyParams.deserialize(
            message.payload);
        var response = _impl.dbDestroy(params.name,_SyncbaseDbDestroyResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  _Syncbase_dbDestroyName,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              _Syncbase_dbDestroyName,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case _Syncbase_dbExistsName:
        var params = _SyncbaseDbExistsParams.deserialize(
            message.payload);
        var response = _impl.dbExists(params.name,_SyncbaseDbExistsResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  _Syncbase_dbExistsName,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              _Syncbase_dbExistsName,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case _Syncbase_dbExecName:
        var params = _SyncbaseDbExecParams.deserialize(
            message.payload);
        var response = _impl.dbExec(params.name,params.query,params.parameters,params.stream,_SyncbaseDbExecResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  _Syncbase_dbExecName,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              _Syncbase_dbExecName,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case _Syncbase_dbBeginBatchName:
        var params = _SyncbaseDbBeginBatchParams.deserialize(
            message.payload);
        var response = _impl.dbBeginBatch(params.name,params.bo,_SyncbaseDbBeginBatchResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  _Syncbase_dbBeginBatchName,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              _Syncbase_dbBeginBatchName,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case _Syncbase_dbCommitName:
        var params = _SyncbaseDbCommitParams.deserialize(
            message.payload);
        var response = _impl.dbCommit(params.name,_SyncbaseDbCommitResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  _Syncbase_dbCommitName,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              _Syncbase_dbCommitName,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case _Syncbase_dbAbortName:
        var params = _SyncbaseDbAbortParams.deserialize(
            message.payload);
        var response = _impl.dbAbort(params.name,_SyncbaseDbAbortResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  _Syncbase_dbAbortName,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              _Syncbase_dbAbortName,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case _Syncbase_dbGetPermissionsName:
        var params = _SyncbaseDbGetPermissionsParams.deserialize(
            message.payload);
        var response = _impl.dbGetPermissions(params.name,_SyncbaseDbGetPermissionsResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  _Syncbase_dbGetPermissionsName,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              _Syncbase_dbGetPermissionsName,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case _Syncbase_dbSetPermissionsName:
        var params = _SyncbaseDbSetPermissionsParams.deserialize(
            message.payload);
        var response = _impl.dbSetPermissions(params.name,params.perms,params.version,_SyncbaseDbSetPermissionsResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  _Syncbase_dbSetPermissionsName,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              _Syncbase_dbSetPermissionsName,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case _Syncbase_dbWatchGlobName:
        var params = _SyncbaseDbWatchGlobParams.deserialize(
            message.payload);
        var response = _impl.dbWatchGlob(params.name,params.req,params.stream,_SyncbaseDbWatchGlobResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  _Syncbase_dbWatchGlobName,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              _Syncbase_dbWatchGlobName,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case _Syncbase_dbGetResumeMarkerName:
        var params = _SyncbaseDbGetResumeMarkerParams.deserialize(
            message.payload);
        var response = _impl.dbGetResumeMarker(params.name,_SyncbaseDbGetResumeMarkerResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  _Syncbase_dbGetResumeMarkerName,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              _Syncbase_dbGetResumeMarkerName,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case _Syncbase_dbListTablesName:
        var params = _SyncbaseDbListTablesParams.deserialize(
            message.payload);
        var response = _impl.dbListTables(params.name,_SyncbaseDbListTablesResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  _Syncbase_dbListTablesName,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              _Syncbase_dbListTablesName,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case _Syncbase_dbGetSyncgroupNamesName:
        var params = _SyncbaseDbGetSyncgroupNamesParams.deserialize(
            message.payload);
        var response = _impl.dbGetSyncgroupNames(params.name,_SyncbaseDbGetSyncgroupNamesResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  _Syncbase_dbGetSyncgroupNamesName,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              _Syncbase_dbGetSyncgroupNamesName,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case _Syncbase_dbCreateSyncgroupName:
        var params = _SyncbaseDbCreateSyncgroupParams.deserialize(
            message.payload);
        var response = _impl.dbCreateSyncgroup(params.name,params.sgName,params.spec,params.myInfo,_SyncbaseDbCreateSyncgroupResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  _Syncbase_dbCreateSyncgroupName,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              _Syncbase_dbCreateSyncgroupName,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case _Syncbase_dbJoinSyncgroupName:
        var params = _SyncbaseDbJoinSyncgroupParams.deserialize(
            message.payload);
        var response = _impl.dbJoinSyncgroup(params.name,params.sgName,params.myInfo,_SyncbaseDbJoinSyncgroupResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  _Syncbase_dbJoinSyncgroupName,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              _Syncbase_dbJoinSyncgroupName,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case _Syncbase_dbLeaveSyncgroupName:
        var params = _SyncbaseDbLeaveSyncgroupParams.deserialize(
            message.payload);
        var response = _impl.dbLeaveSyncgroup(params.name,params.sgName,_SyncbaseDbLeaveSyncgroupResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  _Syncbase_dbLeaveSyncgroupName,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              _Syncbase_dbLeaveSyncgroupName,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case _Syncbase_dbDestroySyncgroupName:
        var params = _SyncbaseDbDestroySyncgroupParams.deserialize(
            message.payload);
        var response = _impl.dbDestroySyncgroup(params.name,params.sgName,_SyncbaseDbDestroySyncgroupResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  _Syncbase_dbDestroySyncgroupName,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              _Syncbase_dbDestroySyncgroupName,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case _Syncbase_dbEjectFromSyncgroupName:
        var params = _SyncbaseDbEjectFromSyncgroupParams.deserialize(
            message.payload);
        var response = _impl.dbEjectFromSyncgroup(params.name,params.sgName,params.member,_SyncbaseDbEjectFromSyncgroupResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  _Syncbase_dbEjectFromSyncgroupName,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              _Syncbase_dbEjectFromSyncgroupName,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case _Syncbase_dbGetSyncgroupSpecName:
        var params = _SyncbaseDbGetSyncgroupSpecParams.deserialize(
            message.payload);
        var response = _impl.dbGetSyncgroupSpec(params.name,params.sgName,_SyncbaseDbGetSyncgroupSpecResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  _Syncbase_dbGetSyncgroupSpecName,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              _Syncbase_dbGetSyncgroupSpecName,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case _Syncbase_dbSetSyncgroupSpecName:
        var params = _SyncbaseDbSetSyncgroupSpecParams.deserialize(
            message.payload);
        var response = _impl.dbSetSyncgroupSpec(params.name,params.sgName,params.spec,params.version,_SyncbaseDbSetSyncgroupSpecResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  _Syncbase_dbSetSyncgroupSpecName,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              _Syncbase_dbSetSyncgroupSpecName,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case _Syncbase_dbGetSyncgroupMembersName:
        var params = _SyncbaseDbGetSyncgroupMembersParams.deserialize(
            message.payload);
        var response = _impl.dbGetSyncgroupMembers(params.name,params.sgName,_SyncbaseDbGetSyncgroupMembersResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  _Syncbase_dbGetSyncgroupMembersName,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              _Syncbase_dbGetSyncgroupMembersName,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case _Syncbase_tableCreateName:
        var params = _SyncbaseTableCreateParams.deserialize(
            message.payload);
        var response = _impl.tableCreate(params.name,params.perms,_SyncbaseTableCreateResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  _Syncbase_tableCreateName,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              _Syncbase_tableCreateName,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case _Syncbase_tableDestroyName:
        var params = _SyncbaseTableDestroyParams.deserialize(
            message.payload);
        var response = _impl.tableDestroy(params.name,_SyncbaseTableDestroyResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  _Syncbase_tableDestroyName,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              _Syncbase_tableDestroyName,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case _Syncbase_tableExistsName:
        var params = _SyncbaseTableExistsParams.deserialize(
            message.payload);
        var response = _impl.tableExists(params.name,_SyncbaseTableExistsResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  _Syncbase_tableExistsName,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              _Syncbase_tableExistsName,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case _Syncbase_tableGetPermissionsName:
        var params = _SyncbaseTableGetPermissionsParams.deserialize(
            message.payload);
        var response = _impl.tableGetPermissions(params.name,_SyncbaseTableGetPermissionsResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  _Syncbase_tableGetPermissionsName,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              _Syncbase_tableGetPermissionsName,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case _Syncbase_tableSetPermissionsName:
        var params = _SyncbaseTableSetPermissionsParams.deserialize(
            message.payload);
        var response = _impl.tableSetPermissions(params.name,params.perms,_SyncbaseTableSetPermissionsResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  _Syncbase_tableSetPermissionsName,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              _Syncbase_tableSetPermissionsName,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case _Syncbase_tableDeleteRangeName:
        var params = _SyncbaseTableDeleteRangeParams.deserialize(
            message.payload);
        var response = _impl.tableDeleteRange(params.name,params.start,params.limit,_SyncbaseTableDeleteRangeResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  _Syncbase_tableDeleteRangeName,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              _Syncbase_tableDeleteRangeName,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case _Syncbase_tableScanName:
        var params = _SyncbaseTableScanParams.deserialize(
            message.payload);
        var response = _impl.tableScan(params.name,params.start,params.limit,params.stream,_SyncbaseTableScanResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  _Syncbase_tableScanName,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              _Syncbase_tableScanName,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case _Syncbase_tableGetPrefixPermissionsName:
        var params = _SyncbaseTableGetPrefixPermissionsParams.deserialize(
            message.payload);
        var response = _impl.tableGetPrefixPermissions(params.name,params.key,_SyncbaseTableGetPrefixPermissionsResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  _Syncbase_tableGetPrefixPermissionsName,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              _Syncbase_tableGetPrefixPermissionsName,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case _Syncbase_tableSetPrefixPermissionsName:
        var params = _SyncbaseTableSetPrefixPermissionsParams.deserialize(
            message.payload);
        var response = _impl.tableSetPrefixPermissions(params.name,params.prefix,params.perms,_SyncbaseTableSetPrefixPermissionsResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  _Syncbase_tableSetPrefixPermissionsName,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              _Syncbase_tableSetPrefixPermissionsName,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case _Syncbase_tableDeletePrefixPermissionsName:
        var params = _SyncbaseTableDeletePrefixPermissionsParams.deserialize(
            message.payload);
        var response = _impl.tableDeletePrefixPermissions(params.name,params.prefix,_SyncbaseTableDeletePrefixPermissionsResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  _Syncbase_tableDeletePrefixPermissionsName,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              _Syncbase_tableDeletePrefixPermissionsName,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case _Syncbase_rowExistsName:
        var params = _SyncbaseRowExistsParams.deserialize(
            message.payload);
        var response = _impl.rowExists(params.name,_SyncbaseRowExistsResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  _Syncbase_rowExistsName,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              _Syncbase_rowExistsName,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case _Syncbase_rowGetName:
        var params = _SyncbaseRowGetParams.deserialize(
            message.payload);
        var response = _impl.rowGet(params.name,_SyncbaseRowGetResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  _Syncbase_rowGetName,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              _Syncbase_rowGetName,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case _Syncbase_rowPutName:
        var params = _SyncbaseRowPutParams.deserialize(
            message.payload);
        var response = _impl.rowPut(params.name,params.value,_SyncbaseRowPutResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  _Syncbase_rowPutName,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              _Syncbase_rowPutName,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case _Syncbase_rowDeleteName:
        var params = _SyncbaseRowDeleteParams.deserialize(
            message.payload);
        var response = _impl.rowDelete(params.name,_SyncbaseRowDeleteResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  _Syncbase_rowDeleteName,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              _Syncbase_rowDeleteName,
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

  service_describer.ServiceDescription get serviceDescription =>
    new _SyncbaseServiceDescription();
}



