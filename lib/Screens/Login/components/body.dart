import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/components/background.dart';
import 'package:flutter_auth/Screens/Signup/components/or_divider.dart';
import 'package:flutter_auth/Screens/Signup/components/social_icon.dart';
import 'package:flutter_auth/Services/firebase_auth_service.dart';
import 'package:flutter_auth/components/already_have_an_account_acheck.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/rounded_input_field.dart';
import 'package:flutter_auth/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: size.height * 0.05,
              ),
              Text(
                "LOGIN",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              SizedBox(height: size.height * 0.03),
              SvgPicture.asset(
                "assets/icons/login.svg",
                height: size.height * 0.23,
              ),
              SizedBox(height: size.height * 0.03),
              RoundedInputField(
                controller: _emailController,
                hintText: "Your Email",
              ),
              RoundedPasswordField(
                controller: _passwordController,
              ),
              RoundedButton(
                text: "LOGIN",
                press: () async {
                  if (_formKey.currentState!.validate()) {
                    bool loggedIn = await Provider.of<FirebaseAuthService>(
                            context,
                            listen: false)
                        .signInWithEmailAndPassword(
                            context: context,
                            email: _emailController.text,
                            password: _passwordController.text);
                    if (loggedIn)
                      Navigator.pushNamed(context, '/loggedInScreen');
                  }
                },
              ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                press: () {
                  Navigator.pushNamed(context, '/signUpScreen');
                },
              ),
              OrDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SocalIcon(
                    iconSrc: "assets/icons/facebook.svg",
                    press: () async {
                      await Provider.of<FirebaseAuthService>(context,
                              listen: false)
                          .signInWithFacebook(context);
                    },
                  ),
                  SocalIcon(
                    iconSrc: "assets/icons/twitter.svg",
                    press: () {},
                  ),
                  SocalIcon(
                    iconSrc: "assets/icons/google-plus.svg",
                    press: () async {
                      await Provider.of<FirebaseAuthService>(context,
                              listen: false)
                          .signInWithGoogle(context);
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
