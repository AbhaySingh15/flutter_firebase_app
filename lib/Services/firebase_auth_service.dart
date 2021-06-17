import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Services/auth_service.dart';

typedef Snack = ScaffoldFeatureController;

class FirebaseAuthService with ChangeNotifier implements AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
  Future<void> signOut() async {
    await _auth.signOut();
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
}
