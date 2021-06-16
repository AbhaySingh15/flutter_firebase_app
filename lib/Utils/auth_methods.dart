import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Firebase {
  static final FirebaseAuth auth = FirebaseAuth.instance;
  void _register(BuildContext context, TextEditingController email,
      TextEditingController password) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      //_userEmail = userCredential.user!.email.toString();
      snackBarBuilder(text: "Successfully registered");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        snackBarBuilder(text: "The password provided is too weak");
      } else if (e.code == 'email-already-in-use') {
        snackBarBuilder(text: "Email already in use");
      }
    } catch (e) {
      print(e);
    }
  }
}
