import 'package:flutter/material.dart';
import 'package:flutter_ui_app/apps/paypal/pages/login_page/widgets/widgets.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[PaypalLogo(), FormBody(), OtherActions()],
        ),
      ),
    );
  }
}
