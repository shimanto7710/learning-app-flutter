import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:learning_app_flutter/core/glitch.dart';

import 'firebase_service.dart';

class FirebaseRepo {
  final FirebaseAuth _firebaseAuth;
  FirebaseService _firebaseService;

  // DatabaseReference _databaseReference;

  FirebaseRepo(this._firebaseAuth){
    _firebaseService=FirebaseService(_firebaseAuth);
  }

  Future<Either<Glitch, UserCredential>> authenticate(
      {String email, String password}) async {
    final result= await _firebaseService.signIn(email: email, password: password);

    return result.fold((l) {
      // ignore: unrelated_type_equality_checks
      if (l == 'user-not-found') {
        // print(l);
        return Left(UserNotFoundGlitch());
      // ignore: unrelated_type_equality_checks
      } else if (l == 'wrong-password') {
        // print(l);
        return Left(WrongPassWordGlitch());
      }
      else{
        // print("no internet connection");
        return Left(NoInternetGlitch());
      }
    },(r){
      // print(r);
      return Right(r);
    });
  }

  Future<Either<Glitch, UserCredential>> registration(
      {String email, String password}) async {
    final result= await _firebaseService.registration(email: email, password: password);

    return result.fold((l) {
      // ignore: unrelated_type_equality_checks
      if (l == 'user-not-found') {
        // print(l);
        return Left(UserNotFoundGlitch());
        // ignore: unrelated_type_equality_checks
      } else if (l == 'wrong-password') {
        // print(l);
        return Left(WrongPassWordGlitch());
      }
      else{
        // print("no internet connection");
        return Left(NoInternetGlitch());
      }
    },(r){
      // print(r);
      return Right(r);
    });
  }


}
