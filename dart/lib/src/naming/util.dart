// Copyright 2015 The Vanadium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:convert' show UTF8;

// TODO(aghassemi): Move these naming utilities outside of Syncbase when we have
// a Dart Vanadium library

// Makes a string representable as a name element by escaping slashes.
String encodeAsNameElement(String name) {
  return escape(name, '/');
}

// Decodes an encoded name element.
// It throws exception when encountering wrongly encoded names.
// Note that this is more than the inverse of EncodeAsNameElement since it
// can handle more hex encodings than / and %.
// This is intentional since we'll most likely want to add other letters to
// the set to be encoded.
String decodeFromNameElement(String name) {
  return unescape(name);
}

// Encodes a string replacing the characters in <special> and % with a
// %<hex> escape.
String escape(String text, String special) {
  const String encodedPecent = '%25';
  const String percent = '%';

  // Replace % with %25 first.
  var encodedText = text.replaceAll(percent, encodedPecent);

  // For all characters in special, replace occurrences with their hex encoding.
  // Note that we want to support any Unicode character in special, single-byte
  // or not. For example a three-byte 읔 character, becomes %EC%9D%94.
  for (var i = 0; i < special.length; i++) {
    var char = special[i];
    if (char == '%') {
      // Ignore % in special, we have already escaped %.
      continue;
    }
    var bytes = UTF8.encoder.convert(char);
    var hex = '';
    for (var byte in bytes) {
      hex += percent;
      hex += _byteToHex(byte);
    }
    encodedText = encodedText.replaceAll(char, hex);
  }

  return encodedText;
}

// Decodes %<hex> encodings in a string into the relevant character.
// It throws exception when encountering wrongly encoded text.
String unescape(String text) {
  // Note that this function is a slightly modified version of _uriDecode() code
  // in Dart sdk/lib/core/uri.dart (https://goo.gl/1ppJIj).
  // The biggest difference is that, unlike _uriDecode(), our code DOES NOT
  // expect non-ASCII characters to have been percent encoded in text.
  // Dart's _uriDecode() however expects character above 127 to have been
  // percent encoded or it will throw an argument exception when it encounters a
  // character above 127.
  const int percent = 0x25;

  // First check whether there are any characters which need special handling.
  bool notEncoded = true;
  for (int i = 0; i < text.length && notEncoded; i++) {
    var codeUnit = text.codeUnitAt(i);
    notEncoded = codeUnit != percent;
  }
  if (notEncoded) {
    return text;
  }
  List<int> bytes = new List();
  for (int i = 0; i < text.length; i++) {
    var codeUnit = text.codeUnitAt(i);
    if (codeUnit == percent) {
      if (i + 3 > text.length) {
        throw new ArgumentError('Truncated or malformed encoded string');
      }
      bytes.add(_hexCharPairToByte(text, i + 1));
      i += 2;
    } else {
      bytes.addAll(UTF8.encoder.convert(text[i]));
    }
  }
  return UTF8.decode(bytes);
}

// Converts a byte to 0 padded hex string.
// Note that this function is the same as byteToHex() code
// in Dart sdk/lib/core/uri.dart (https://goo.gl/1ppJIj)
String _byteToHex(int byte) {
  const String hex = '0123456789ABCDEF';
  var buffer = new StringBuffer();
  buffer.writeCharCode(hex.codeUnitAt(byte >> 4));
  buffer.writeCharCode(hex.codeUnitAt(byte & 0x0f));
  return buffer.toString();
}

// Converts a hex string to a byte.
// Note that this function is the same code as _hexCharPairToByte()
// in Dart sdk/lib/core/uri.dart (https://goo.gl/1ppJIj)
int _hexCharPairToByte(String s, int pos) {
  int byte = 0;
  for (int i = 0; i < 2; i++) {
    var charCode = s.codeUnitAt(pos + i);
    if (0x30 <= charCode && charCode <= 0x39) {
      byte = byte * 16 + charCode - 0x30;
    } else {
      // Check ranges A-F (0x41-0x46) and a-f (0x61-0x66).
      charCode |= 0x20;
      if (0x61 <= charCode && charCode <= 0x66) {
        byte = byte * 16 + charCode - 0x57;
      } else {
        throw new ArgumentError("Truncated or malformed encoded string");
      }
    }
  }
  return byte;
}
