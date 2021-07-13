import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Services/firebase_auth_service.dart';
import 'package:flutter_auth/Utils/constants.dart';
import 'package:provider/provider.dart';

class LoggedIN extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<FirebaseAuthService>(context, listen: false)
        .getFireBaseAuth()
        .currentUser;
    String? providerId;
    String? name;
    String? email;
    String? userImage;
    for (UserInfo profile in user!.providerData) {
      providerId = profile.providerId;
      name = profile.displayName;
      email = profile.email;
      userImage = profile.photoURL;
    }

    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipOval(
            child: CachedNetworkImage(
              imageUrl: "$userImage",
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
          buildRichText(value: providerId, field: "ProviderId"),
          SizedBox(
            height: Consts.loggedInPageMargin,
          ),
          buildRichText(value: name, field: "Name"),
          SizedBox(
            height: Consts.loggedInPageMargin,
          ),
          buildRichText(value: email, field: "Email"),
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

  RichText buildRichText({required String? value, required String field}) {
    return RichText(
      text: TextSpan(style: TextStyle(color: Colors.black), children: [
        TextSpan(
            text: "$field: ", style: TextStyle(fontWeight: FontWeight.bold)),
        TextSpan(text: "$value"),
      ]),
    );
  }
}
