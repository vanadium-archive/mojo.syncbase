// Copyright 2015 The Vanadium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of syncbase_client;

// escape escapes a component name for use in a Syncbase object name. In
// particular, it replaces bytes "%" and "/" with the "%" character followed by
// the byte's two-digit hex code. Clients using the client library need not
// escape names themselves; the client library does so on their behalf.
String escape(String s) {
  return naming.encodeAsNameElement(s);
}

// unescape applies the inverse of escape. Throws exception if the given string
// is not a valid escaped string.
String unescape(String s) {
  return naming.decodeFromNameElement(s);
}
