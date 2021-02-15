
import 'dart:ffi';

import 'package:flutter/cupertino.dart';

import 'auth.dart';

class LoginProvider extends ChangeNotifier {

  AuthServices _authServices;

  TextEditingController emailTextFieldController;
  TextEditingController passTextFieldController;

  Future<Void> loginByFirebase() async{
    _authServices =AuthServices();
    dynamic result= _authServices.signInAnon();
    notifyListeners();
  }


  void debug(){
    print("hey bro");
  }

  String passText(){
    return passTextFieldController.text;
  }

}