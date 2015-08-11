part of syncbase_client;

// NamedResource is the superclass of resources with names.
class NamedResource {
  final String fullName;
  final String relativeName;
  final mojom.SyncbaseProxy _proxy;

  NamedResource._internal(
      mojom.SyncbaseProxy _proxy, String _parentFullName, String relativeName)
      : this._proxy = _proxy,
        this.relativeName = relativeName,
        this.fullName = (_parentFullName == null ? '' : _parentFullName + '/') +
            relativeName {
    if (relativeName.contains('/')) {
      throw 'relativeName cannot contain "/": $relativeName';
    }
  }
}
