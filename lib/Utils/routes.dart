import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/Screens/Signup/signup_screen.dart';
import 'package:flutter_auth/Screens/Welcome/welcome_screen.dart';
import 'package:flutter_auth/Services/authentication.dart';

class Routes {
  static final signUpScreen = (context) => SignUpScreen();
  static final loginScreen = (context) => LoginScreen();
  static final welcomeScreen = (context) => WelcomeScreen();
  static final firebaseAuthentication = (context) => Authentication();
}
