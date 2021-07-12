import 'package:cached_network_image/cached_network_image.dart';
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
            child: CachedNetworkImage(
              imageUrl: "${user!.photoURL}",
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Image.asset(
                "assets/images/no_image.png",
                width: 100,
                height: 100,
              ),
            ),
          ),
          SizedBox(
            height: Consts.loggedInPageMargin,
          ),
          RichText(
            text: TextSpan(style: TextStyle(color: Colors.black), children: [
              TextSpan(
                  text: "Name: ",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: "${user.displayName}"),
            ]),
          ),
          SizedBox(
            height: Consts.loggedInPageMargin,
          ),
          RichText(
              text: TextSpan(style: TextStyle(color: Colors.black), children: [
            TextSpan(
                text: "Email: ", style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: "${user.email}"),
          ])),
          SizedBox(
            height: Consts.loggedInPageMargin,
          ),
          ElevatedButton(
              onPressed: () {
                Provider.of<FirebaseAuthService>(context, listen: false)
                    .signOut();
                Navigator.pushNamed(context, '/loginScreen');
              },
              child: Text("Sign out")),
        ],
      ),
    ));
  }
}
