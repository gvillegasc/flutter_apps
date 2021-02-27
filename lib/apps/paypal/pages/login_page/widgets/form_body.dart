import 'package:flutter/material.dart';
import 'package:flutter_ui_app/apps/paypal/pages/login_page/widgets/button_login.dart';
import 'package:flutter_ui_app/apps/paypal/pages/login_page/widgets/custom_text_field.dart';

class FormBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CustomTextField(
          hintText: "Enter your name or e-mail",
          keyboardType: TextInputType.emailAddress,
        ),
        CustomTextField(
          hintText: "Password",
          isPassword: true,
        ),
        ButtonLogin()
      ],
    );
  }
}
