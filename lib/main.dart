import 'package:flutter/material.dart';
import 'package:flutter_auth/Services/firebase_auth_service.dart';
import 'package:flutter_auth/Utils/constants.dart';
import 'package:provider/provider.dart';
import 'Utils/routes.dart';

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
    return ChangeNotifierProvider(
      create: (context) => FirebaseAuthService(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Auth',
        //themeMode: ThemeMode.dark,
        theme: ThemeData(
          primaryColor: Consts.kPrimaryColor,
          scaffoldBackgroundColor: Colors.white,
        ),
        // darkTheme: ThemeData(
        //     primaryColor: Consts.kPrimaryColor, brightness: Brightness.dark),
        routes: {
          '/': Routes.homeScreen,
          '/signUpScreen': Routes.signUpScreen,
          '/loginScreen': Routes.loginScreen,
          '/loggedInScreen': Routes.loggedInScreen,
        },
      ),
    );
  }
}
