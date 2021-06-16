import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Firebase {
  final FirebaseAuth auth = FirebaseAuth.instance;
  void register(BuildContext context, TextEditingController email,
      TextEditingController password) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
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

ScaffoldFeatureController snackBarBuilder(
    {required BuildContext context, required String text}) {
  ScaffoldFeatureController snackBar =
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  return snackBar;
}
