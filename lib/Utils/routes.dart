import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/Screens/MainScreen/main_screen.dart';
import 'package:flutter_auth/Screens/Signup/signup_screen.dart';
import 'package:flutter_auth/Screens/logged_in.dart';
import 'package:flutter_auth/Services/authentication.dart';

class Routes {
  static final signUpScreen = (context) => SignUpScreen();
  static final loginScreen = (context) => LoginScreen();
  static final firebaseAuthentication = (context) => Authentication();
  static final loggedInScreen = (context) => LoggedIN();
  static final homeScreen = (context) => MainScreen();
}
