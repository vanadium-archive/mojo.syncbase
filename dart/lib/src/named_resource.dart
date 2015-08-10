part of syncbase_client;

// NamedResource is the superclass of resources with names.
class NamedResource {
  final String _parentFullName;
  final String fullName;
  final String relativeName;
  final mojom.SyncbaseProxy _proxy;

  NamedResource._internal(_proxy, _parentFullName, relativeName)
      : this._proxy = _proxy,
        this._parentFullName = _parentFullName,
        this.relativeName = relativeName,
        this.fullName = _parentFullName + '/' + relativeName {
    if (relativeName.contains('/')) {
      throw 'relativeName cannot contain "/": $relativeName';
    }
  }
}
