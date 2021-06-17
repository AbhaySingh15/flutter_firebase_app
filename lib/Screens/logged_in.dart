import 'package:flutter/material.dart';
import 'package:flutter_auth/Services/firebase_auth_service.dart';
import 'package:provider/provider.dart';

class LoggedIN extends StatelessWidget {
  const LoggedIN({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
                onPressed: () {
                  Provider.of<FirebaseAuthService>(context, listen: false)
                      .signOut();
                  Navigator.pushNamed(context, '/welcomeScreen');
                },
                child: Text("Sign out")),
          )
        ],
      ),
    );
  }
}
