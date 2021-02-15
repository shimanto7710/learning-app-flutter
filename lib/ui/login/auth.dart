
import 'package:firebase_auth/firebase_auth.dart';
class AuthServices{
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future signInAnon() async {
    try{
      UserCredential userCredential = await _auth.signInAnonymously();
      User user= userCredential.user;
      print("signIn successfully");
      return user;

    }
    catch (e){

      print("signIn error "+e);
      return null;
    }
  }

}