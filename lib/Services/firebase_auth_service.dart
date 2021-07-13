import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Services/auth_service.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

typedef Snack = ScaffoldFeatureController;

class FirebaseAuthService with ChangeNotifier implements AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseAuth getFireBaseAuth() {
    return _auth;
  }

  Snack snackBarBuilder({required BuildContext context, required String text}) {
    Snack snackBar = ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(text)));
    return snackBar;
  }

  @override
  Future<bool> signInWithEmailAndPassword(
      {required BuildContext context,
      required String email,
      required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      snackBarBuilder(context: context, text: "Successfully Logged in");
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        snackBarBuilder(context: context, text: "No user found for that email");
        return false;
      } else if (e.code == 'wrong-password') {
        snackBarBuilder(
            context: context, text: "Wrong password provided for that user");
        return false;
      } else {
        snackBarBuilder(
            context: context, text: "Sorry something went wrong try again");
        return false;
      }
    }
  }

  @override
  Future<void> createUserWithEmailAndPassword(
      {required BuildContext context,
      required String email,
      required String password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      snackBarBuilder(context: context, text: "Successfully registered");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        snackBarBuilder(
            context: context, text: "The password provided is too weak");
      } else if (e.code == 'email-already-in-use') {
        snackBarBuilder(context: context, text: "Email already in use");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<void> signInWithGoogle(BuildContext context) async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    try {
      await _auth.signInWithCredential(credential);
      Navigator.pushNamed(context, "/loggedInScreen");
      snackBarBuilder(context: context, text: "Successfully logged in");
    } on FirebaseAuthException catch (_) {
      snackBarBuilder(context: context, text: "Authentication failed");
    }
  }

  @override
  Future<void> signInWithFacebook(BuildContext context) async {
    final LoginResult result = await FacebookAuth.instance
        .login(permissions: ["email", "public_profile"]);
    if (result.status == LoginStatus.success) {
      final AccessToken accessToken = result.accessToken!;
      final AuthCredential credential =
          FacebookAuthProvider.credential(accessToken.token);
      try {
        await _auth.signInWithCredential(credential);
        Navigator.pushNamed(context, "/loggedInScreen");
        snackBarBuilder(context: context, text: "Successfully signed in");
      } on FirebaseAuthException catch (_) {
        snackBarBuilder(context: context, text: "Authentication failed");
      }
    }
  }

  @override
  Future<void> signOut() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    final FacebookAuth facebookAuth = FacebookAuth.instance;
    await facebookAuth.logOut();
    return _auth.signOut();
  }
}
