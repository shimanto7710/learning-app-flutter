
import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import 'auth_service.dart';

class LoginProvider extends ChangeNotifier {

  AuthServices _authServices;
  bool _isLogin=false;


  bool get isLogin => _isLogin;

  LoginProvider(){
    _authServices =AuthServices(FirebaseAuth.instance);
  }

  TextEditingController emailTextFieldController;
  TextEditingController passTextFieldController;

  /// Changed to idTokenChanges as it updates depending on more cases.
  Stream<User> get authStateChanges => _authServices.authStateChanges;

  Future<Void> loginByFirebase() async{
    // _authServices =AuthServices(FirebaseAuth.instance);
    // dynamic result= _authServices.signInAnon();
    Future<UserCredential> result= _authServices.signIn(email: "shimanto@gmail.com",password: "000000");
    if(result!=null){
      print("login successful");

    }else{
      print("login error");
    }
    notifyListeners();
  }


  void debug(){
    print("hey bro");
  }

  String passText(){
    return passTextFieldController.text;
  }

}