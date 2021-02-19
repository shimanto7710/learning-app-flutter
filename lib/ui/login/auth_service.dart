import 'package:dartz/dartz_unsafe.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:learning_app_flutter/model/user_model.dart';

class AuthServices {
  final FirebaseAuth _firebaseAuth;

  // DatabaseReference _databaseReference;

  AuthServices(this._firebaseAuth);

  /// Changed to idTokenChanges as it updates depending on more cases.
  Stream<User> get authStateChanges => _firebaseAuth.idTokenChanges();

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
  Future<UserCredential> signIn({String email, String password}) async {
    try {
      // addUser();
      // getUserData();
      // addUserById(UserModel(2,"asd"));

      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      print("user info " + userCredential.user.email);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }

      return null;
    }
  }

  /// There are a lot of different ways on how you can do exception handling.
  /// This is to make it as easy as possible but a better way would be to
  /// use your own custom class that would take the exception and return better
  /// error messages. That way you can throw, return or whatever you prefer with that instead.
  Future<bool> signUp({String email, String password}) async {
    try {

      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      // print(userCredential);

      final count= await getUserCount() ;
      print(count);
      addUserById(UserModel(count,userCredential.user.email));

      return true;
    } on FirebaseAuthException catch (e) {
      return false;
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
      snapshot111=snapshot;
    });

    if (snapshot111.value!=null) {
      print(snapshot111.value);

      var count=0;
      snapshot111.value.forEach((key,values) {
        // print(values["Password"]);
        count++;
      });
      return count;
    }else{
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

  addUserById(UserModel user){
    var dbRef = FirebaseDatabase.instance.reference().child("user");
    dbRef.child(user.uid.toString()).set({
      'uid': user.uid.toString(),
      'email': user.email.toString()
    });
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
