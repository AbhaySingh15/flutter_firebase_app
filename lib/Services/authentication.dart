import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/Screens/logged_in.dart';
import 'package:provider/provider.dart';
import 'firebase_auth_service.dart';

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
          var accessToken =
              Provider.of<FirebaseAuthService>(context, listen: false);
          if (accessToken.getFireBaseAuth().currentUser == null) {
            return LoginScreen();
          } else {
            return LoggedIN();
          }
        }

        return Material(child: CircularProgressIndicator());
      },
    );
  }
}
