import 'package:flutter/material.dart';
import 'package:flutter_auth/Services/firebase_auth_service.dart';
import 'package:provider/provider.dart';

class LoggedIN extends StatelessWidget {
  const LoggedIN({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<FirebaseAuthService>(context, listen: false)
        .getFireBaseAuth()
        .currentUser;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeInImage.assetNetwork(
              placeholder: 'assets/gifs/loading.gif',
              image: '${user!.photoURL}',
            ),
            SizedBox(
              height: 7,
            ),
            Text("Name: ${user.displayName}"),
            SizedBox(
              height: 7,
            ),
            Text("Email: ${user.email}"),
            SizedBox(
              height: 7,
            ),
            ElevatedButton(
                onPressed: () {
                  Provider.of<FirebaseAuthService>(context, listen: false)
                      .signOut();
                  Navigator.pushNamed(context, '/loginScreen');
                },
                child: Text("Sign out"))
          ],
        ),
      ),
    );
  }
}
