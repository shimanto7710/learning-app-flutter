import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:learning_app_flutter/network/firebaseRepo.dart';

import '../../network/firebase_service.dart';

class LoginProvider extends ChangeNotifier {
  FirebaseRepo _firebaseRepo;

  bool _isLogin = false;

  bool get isLogin => _isLogin;

  set isLogin(bool value) {
    _isLogin = value;
  }

  LoginProvider() {
    _firebaseRepo = FirebaseRepo(FirebaseAuth.instance);
  }

  Future<Void> authenticate({String email, String password}) async {
    final result = await _firebaseRepo.authenticate(
        email: email, password: password);

    result.fold((l) {
      _isLogin = false;
      print("login failed");
      print(l);
    }, (r) {
      print("login successful");
      print(r);
      _isLogin = true;
    });

    notifyListeners();
  }

  // ignore: missing_return
  Future<Void> registrationByFirebase({String email, String password}) async {
    final result = await _firebaseRepo.registration(
        email: email, password: password);

    result.fold((l) {
      print(l);
    }, (r) {
      print(r);
    });

    // notifyListeners();
  }

  void debug() {
    print("hey bro");
  }
}
