class DummyModel{
  int _a;

  DummyModel(this._a);

  int get a => _a;

  set a(int value) {
    _a = value;
  }
}

class UserModel{
  int _uid;
  String _email;

  UserModel(this._uid, this._email);

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  int get uid => _uid;

  set uid(int value) {
    _uid = value;
  }

  @override
  String toString() {
    return 'UserModel{_uid: $_uid, _email: $_email}';
  }
}