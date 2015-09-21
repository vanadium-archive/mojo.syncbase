library naming_util_test;

import 'package:test/test.dart';

import 'package:ether/src/naming/util.dart' as naming;

main() {
  var tests = [
    ['', ''],
    ['/', '%2F'],
    ['%', '%25'],
    ['/The % rain in /% Spain', '%2FThe %25 rain in %2F%25 Spain'],
    ['/%/%', '%2F%25%2F%25'],
    ['ᚸӲ읔+קAل', 'ᚸӲ읔+קAل'],
    ['ᚸ/Ӳ%읔/ק%A+ل', 'ᚸ%2FӲ%25읔%2Fק%25A+ل'],
  ];

  test('encoding name elements', () {
    for (var t in tests) {
      expect(naming.encodeAsNameElement(t[0]), equals(t[1]));
    }
  });

  test('decoding name elements encoded by our encoder', () {
    for (var t in tests) {
      expect(naming.decodeFromNameElement(t[1]), equals(t[0]));
    }
  });

  test('decoding name elements encoded by third-party percent encoder', () {
    for (var t in tests) {
      var uriEncoded = Uri.encodeComponent(t[0]);
      expect(naming.decodeFromNameElement(uriEncoded), equals(t[0]));
    }
  });

  test('escape and unescape with multiple special characters', () {
    var test = 'ᚸ/Ӳ%읔/ק%A+ل';
    // Escape multiple characters, also % in special should be ignored since
    // % is always escaped regardless.
    var escaped = naming.escape(test, '/읔%');
    expect(escaped, isNot(contains('읔')));
    expect(escaped, contains('Ӳ'));
    expect(naming.unescape(escaped), equals(test));
  });
}
