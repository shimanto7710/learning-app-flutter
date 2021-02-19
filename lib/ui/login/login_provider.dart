
import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';

import 'auth_service.dart';

class LoginProvider extends ChangeNotifier {

  AuthServices _authServices;

  bool _isLogin=false;


  bool get isLogin => _isLogin;

  set isLogin(bool value) {
    _isLogin = value;
  }

  LoginProvider(){
    _authServices =AuthServices(FirebaseAuth.instance);
  }



  /// Changed to idTokenChanges as it updates depending on more cases.
  Stream<User> get authStateChanges => _authServices.authStateChanges;

  Future<Void> loginByFirebase() async{
    // _authServices =AuthServices(FirebaseAuth.instance);
    // dynamic result= _authServices.signInAnon();
    Future<UserCredential> result= _authServices.signIn(email: "shimanto@gmail.com",password: "000000");
    if(result!=null){
      print("login successful");
      _isLogin=true;

    }else{
      print("login error");
    }
    _isLogin=true;
    notifyListeners();
  }

  // ignore: missing_return
  Future<Void> registrationByFirebase() async{
    // _authServices =AuthServices(FirebaseAuth.instance);
    // dynamic result= _authServices.signInAnon();
    Future<bool> result= _authServices.signUp(email: "shimantoahmed@gmail.com",password: "000000");
    if(result!=null){
      print("registration successful");
      // _isLogin=true;

    }else{
      print("registration error");
    }
    // notifyListeners();
  }


  void debug(){
    print("hey bro");
  }



}