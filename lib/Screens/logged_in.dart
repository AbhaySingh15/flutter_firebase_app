import 'package:flutter/material.dart';
import 'package:flutter_auth/Services/firebase_auth_service.dart';
import 'package:flutter_auth/Utils/constants.dart';
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
            ClipOval(
              child: FadeInImage.assetNetwork(
                placeholder: 'assets/gifs/loading.gif',
                image: '${user!.photoURL}',
              ),
            ),
            SizedBox(
              height: Consts.loggedInPageMargin,
            ),
            Text("Name: ${user.displayName}"),
            SizedBox(
              height: Consts.loggedInPageMargin,
            ),
            Text("Email: ${user.email}"),
            SizedBox(
              height: Consts.loggedInPageMargin,
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
