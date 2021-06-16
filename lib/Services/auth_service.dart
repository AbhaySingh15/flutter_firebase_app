import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

@immutable
class MyAppUser {
  const MyAppUser({
    required this.uid,
    required this.email,
    required this.photoUrl,
    required this.displayName,
  });

  final String uid;
  final String email;
  final String photoUrl;
  final String displayName;
}

abstract class AuthService {
  Future<MyAppUser> currentUser();

  Future<bool> signInWithEmailAndPassword(
      {required BuildContext context,
      required String email,
      required String password});
  Future<void> createUserWithEmailAndPassword(
      {required BuildContext context,
      required String email,
      required String password});

  Future<void> signOut();

  void dispose();
}
