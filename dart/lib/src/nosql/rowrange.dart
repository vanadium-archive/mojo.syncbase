part of syncbase_client;

const String _nullASCII = '\x00';

class RowRange {
  List<int> start;
  List<int> limit;

  RowRange(this.start, this.limit);

  RowRange.prefix(String prefix)
      : start = UTF8.encode(prefix),
        limit = _prefixRangeLimit(prefix);

  RowRange.singleRow(String key)
      : start = UTF8.encode(key),
        limit = UTF8.encode(key + _nullASCII);
}

// prefixRangeLimit returns the limit of the row range for the given prefix.
List<int> _prefixRangeLimit(String prefix) {
  // A string is a []byte, i.e. can be thought of as a base-256 number. The code
  // below effectively adds 1 to this number, then chops off any trailing \x00
  // bytes. If the input string consists entirely of \xff bytes, we return an
  // empty string.
  List<int> bytes = UTF8.encode(prefix);
  while (bytes.length > 0) {
    var last = bytes.length - 1;
    if (bytes[last] == 255) {
      bytes.removeAt(last); // remove trailing \x00
    } else {
      bytes[last] += 1; // add 1
      break; // no carry
    }
  }

  return bytes;
}
