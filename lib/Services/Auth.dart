import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/Models/user_model.dart';

class AuthServices {
  final FirebaseAuth auth = FirebaseAuth.instance;

  UserModel? userwithfirebaseuserid(User? user) {
    return user != null ? UserModel(uid: user.uid) : null;
  }

  // create the stream for checking auth changes in the user
  Stream<UserModel?> get user {
    return auth.authStateChanges().map(userwithfirebaseuserid);
  }

  Future SignInAnony() async {
    try {
      UserCredential result = await auth.signInAnonymously();
      User user = result.user!;
      return userwithfirebaseuserid(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  Future signout() async {
    try {
      auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  Future regwith_emailAndPassword(String email, String password) async {
    try {
      UserCredential result = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return userwithfirebaseuserid(user);
    } catch (error) {
      print(error.toString());
    }
  }

  Future signinwith_emailAndPassword(String email, String password) async {
    try {
      UserCredential result = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return userwithfirebaseuserid(user);
    } catch (error) {
      print(error.toString());
    }
  }
}
