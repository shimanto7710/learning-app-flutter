class Glitch {
  String message;
  Glitch({
    this.message,
  });

  @override
  String toString() => 'Glitch(message: $message)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Glitch &&
        o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}


class NoInternetGlitch extends Glitch {
  NoInternetGlitch() : super(message: "Unable to connect to internet");

}
class UserNotFoundGlitch extends Glitch{

  UserNotFoundGlitch() : super(message: "User Not Found");
}

class WrongPassWordGlitch extends Glitch {
  WrongPassWordGlitch() : super(message: "Wrong Password");

}