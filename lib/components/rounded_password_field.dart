import 'package:flutter/material.dart';
import 'package:flutter_auth/components/text_field_container.dart';
import 'package:flutter_auth/Utils/constants.dart';

class RoundedPasswordField extends StatelessWidget {
  //final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  const RoundedPasswordField({
    Key? key,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Password cannot be empty";
          }
        },
        controller: this.controller,
        obscureText: true,
        cursorColor: Consts.kPrimaryColor,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: Consts.kPrimaryColor,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: Consts.kPrimaryColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
