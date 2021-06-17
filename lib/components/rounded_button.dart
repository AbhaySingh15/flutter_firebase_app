import 'package:flutter/material.dart';
import 'package:flutter_auth/Utils/constants.dart';

class RoundedButton extends StatelessWidget {
  final String? text;
  final Function? press;
  final Color color, textColor;
  const RoundedButton({
    Key? key,
    this.text,
    this.press,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 9),
      padding: EdgeInsets.symmetric(vertical: 6),
      width: size.width * 0.8,
      decoration: BoxDecoration(
          color: this.color, borderRadius: BorderRadius.circular(35)),
      child: TextButton(
        style: ButtonStyle(splashFactory: NoSplash.splashFactory),
        onPressed: press as void Function()?,
        child: Center(
          child: Text(
            text!,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}
