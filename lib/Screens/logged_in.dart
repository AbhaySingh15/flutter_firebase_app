import 'package:flutter/material.dart';

class LoggedIN extends StatelessWidget {
  const LoggedIN({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(onPressed: () {}, child: Text("Sign out")),
          )
        ],
      ),
    );
  }
}
