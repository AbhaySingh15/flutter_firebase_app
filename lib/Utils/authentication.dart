import 'package:flutter/material.dart';

// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_auth/Screens/Welcome/welcome_screen.dart';

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(Authentication());
// }

/// We are using a StatefulWidget such that we only create the [Future] once,
/// no matter how many times our widget rebuild.
/// If we used a [StatelessWidget], in the event where [Authentication] is rebuilt, that
/// would re-initialize FlutterFire and make our application re-enter loading state,
/// which is undesired.
class Authentication extends StatefulWidget {
  // Create the initialization Future outside of `build`:
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<Authentication> {
  /// The future is part of the state of our widget. We should not call `initializeApp`
  /// directly inside [build].
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    final SnackBar snackBar = SnackBar(content: Text("Something Went wrong"));
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return WelcomeScreen();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Material(child: CircularProgressIndicator());
      },
    );
  }
}
