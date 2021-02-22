import 'package:dartz/dartz.dart';
import 'package:dartz/dartz_unsafe.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:learning_app_flutter/model/category_model.dart';
import 'package:learning_app_flutter/model/login_model.dart';
import 'dart:convert';

class FirebaseService {
  final FirebaseAuth _firebaseAuth;

  // DatabaseReference _databaseReference;

  FirebaseService(this._firebaseAuth);

  /// Changed to idTokenChanges as it updates depending on more cases.
  // Stream<User> get authStateChanges => _firebaseAuth.idTokenChanges();

  // Future signInAnon() async {
  //   // Firebase.initializeApp();
  //   try{
  //     UserCredential userCredential = await _auth.signInAnonymously();
  //     User user= userCredential.user;
  //     print("signIn successfully");
  //     return user;
  //
  //   }
  //   catch (e){
  //
  //     print("signIn error "+e);
  //     return null;
  //   }
  // }

  /// There are a lot of different ways on how you can do exception handling.
  /// This is to make it as easy as possible but a better way would be to
  /// use your own custom class that would take the exception and return better
  /// error messages. That way you can throw, return or whatever you prefer with that instead.
  Future<Either<dynamic, UserCredential>> signIn(
      {String email, String password}) async {
    try {
      // addUser();
      // getUserData();
      // addUserById(UserModel(2,"asd"));

      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      return Right(userCredential);
    } on FirebaseAuthException catch (e) {
      // print(e.code);
      return Left(e.code);
    }
  }

  Future<Either<Exception, bool>> authenticate({uid: String}) async {
    try {
      var dbRef = FirebaseDatabase.instance.reference().child("user");

      DataSnapshot result;
      await dbRef.equalTo(uid).once().then((DataSnapshot snapshot) {
        result = snapshot;
      });

      // Map<dynamic, dynamic> values = result.value;
      // values.forEach((key, values) {
      //
      // });

      if(result!=null){
         return Right(true);
      }else{
        return Right(false);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return Left(e);
      } else if (e.code == 'wrong-password') {
        return Left(e);
      }

      return null;
    }
  }

  /// There are a lot of different ways on how you can do exception handling.
  /// This is to make it as easy as possible but a better way would be to
  /// use your own custom class that would take the exception and return better
  /// error messages. That way you can throw, return or whatever you prefer with that instead.
  Future<Either<dynamic,UserCredential>> registration({String email, String password}) async {

    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      final count = await getUserCount();
      addUserById(UserModel(count, userCredential.user.email));

      return Right(userCredential);
    } on FirebaseAuthException catch (e) {
      return Left(e);
    }
  }

  // addUser(User user) async {
  //
  //   FirebaseDatabase database = new FirebaseDatabase();
  //   DatabaseReference _userRef=database.reference().child('user');
  //
  //
  //
  //   final TransactionResult transactionResult =
  //   await _userRef.runTransaction((MutableData mutableData) async {
  //     mutableData.value = (mutableData.value ?? 0) + 1;
  //
  //     return mutableData;
  //   });
  //
  //   if (transactionResult.committed) {
  //     _userRef.push().set(UserModel(1, "_email")).then((_) {
  //       print('Transaction  committed.');
  //     });
  //   } else {
  //     print('Transaction not committed.');
  //     if (transactionResult.error != null) {
  //       print(transactionResult.error.message);
  //     }
  //   }
  // }

  /// This won't pop routes so you could do something like
  /// Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
  /// after you called this method if you want to pop all routes.
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  // addUser() async {
  //   FirebaseDatabase database = new FirebaseDatabase();
  //   DatabaseReference _userRef = database.reference().child('user');
  //
  //   final TransactionResult transactionResult =
  //       await _userRef.runTransaction((MutableData mutableData) async {
  //     mutableData.value = (mutableData.value ?? 0) + 1;
  //
  //     return mutableData;
  //   });
  //
  //   if (transactionResult.committed) {
  //     _userRef.push().set(<String, String>{
  //       "name": "" + "user.name sfsd",
  //       "age": "" + "user.age sdfsd",
  //       "email": "" + "user.email sdfsfd",
  //       "mobile": "" + "user.mobile sdfsfds",
  //     }).then((_) {
  //       print('Transaction  committed.');
  //     });
  //   } else {
  //     print('Transaction not committed.');
  //     if (transactionResult.error != null) {
  //       print(transactionResult.error.message);
  //     }
  //   }
  // }

  Future<int> getUserCount() async {
    var dbRef = FirebaseDatabase.instance.reference().child("user");
    DataSnapshot snapshot111;
    await dbRef.once().then((DataSnapshot snapshot) {
      snapshot111 = snapshot;
    });

    if (snapshot111.value != null) {
      List<dynamic> resultList = snapshot111.value;
      // dynamic Obj =  snapshot111.value.toString();
      // print(resultList);
      var count = 0;
      for (var i = 0; i < resultList.length; i++) {
        Map<dynamic, dynamic> map = Map.from(resultList[i]);
        // list.add(BaseModel(model: modelType, key: i.toString(), snapshot: map));
        count++;
      }
      return count;
    } else {
      return 0;
    }

    // await dbRef.once().then((DataSnapshot snapshot) {
    //   if (snapshot.value.isNotEmpty) {
    //     // print(snapshot.value);
    //
    //     var count=0;
    //     snapshot.value.forEach((key,values) {
    //       // print(values["Password"]);
    //       count++;
    //     });
    //     print(count);
    //     return count;
    //   }else{
    //     return 0;
    //   }
    // });
  }

  addUserById(UserModel user) {
    var dbRef = FirebaseDatabase.instance.reference().child("user");
    dbRef
        .child(user.uid.toString())
        .set({'uid': user.uid.toString(), 'email': user.email.toString()});
  }

// void updateUser(User user) async {
//
//   FirebaseDatabase database = new FirebaseDatabase();
//   DatabaseReference _userRef=database.reference().child('user');
//
//   await _userRef.child(user.id).update({
//     "name": "" + user.name,
//     "age": "" + user.age,
//     "email": "" + user.email,
//     "mobile": "" + user.mobile,
//   }).then((_) {
//     print('Transaction  committed.');
//   });
// }

// void deleteUser(User user) async {
//   await _userRef.child(user.id).remove().then((_) {
//     print('Transaction  committed.');
//   });
// }

}
