import 'package:firebase_auth/firebase_auth.dart';
import 'package:sreecoffe/user/user.dart';
import 'package:sreecoffe/services/database.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

class Authservice {
  final FirebaseAuth auth = FirebaseAuth.instance;
  // ignore: unused_element
  Userd _userFromFirebaseUser(User user) {
    return user != null ? Userd(uid: user.uid) : null;
  }

  //auth change stream
  Stream<Userd> get user {
    return auth.authStateChanges().map(_userFromFirebaseUser);
  }

//sign in anon
  /* Future signin() async {
    try {
      UserCredential result = await auth.signInAnonymously();
      User user = result.user;
      _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
*/
//sign in with email
  Future signinWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      print("rached suthentication");
      print(
        user.uid,
      );
      return _userFromFirebaseUser(user);
    } catch (e) {
      print('[AuthService] error signInAnon: ${e.toString()}');
      return null;
    }
  }

//register
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      print("rached register");
      print(
        user.uid,
      );

//create a document for the user with the uid
      await DatabaseService(uid: user.uid)
          .updateUserData('0', 'new crew member', 100);
    } catch (e) {
      return null;
    }
  }

//sign out
  Future signout() async {
    try {
      return await auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
