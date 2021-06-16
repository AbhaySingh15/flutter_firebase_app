import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_auth/Screens/Welcome/welcome_screen.dart';

class Authentication extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<Authentication> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    final SnackBar snackBar = SnackBar(content: Text("Something Went wrong"));
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return WelcomeScreen();
        }

        return Material(child: CircularProgressIndicator());
      },
    );
  }
}