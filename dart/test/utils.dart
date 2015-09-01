library utils;

import 'package:ether/syncbase_client.dart' show Perms;

// Returns an empty Perms object.
Perms emptyPerms() => new Perms()..json = '{}';

// Returns the current timestamp in ms since epoch.
int timestamp() => new DateTime.now().millisecondsSinceEpoch;

int _nameCounter = timestamp();

// Returns a new unique name.
String uniqueName(String type) {
  type ??= 'unknown';
  _nameCounter++;
  return type + '-' + _nameCounter.toString();
}
