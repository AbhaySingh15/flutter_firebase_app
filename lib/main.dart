import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';
import 'components/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      routes: {
        '/': Routes.firebaseAuthentication,
        '/welcomeScreen': Routes.welcomeScreen,
        '/signUpScreen': Routes.signUpScreen,
        '/loginScreen': Routes.loginScreen,
      },
    );
  }
}
