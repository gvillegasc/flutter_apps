import 'package:flutter/material.dart';
import 'package:flutter_ui_app/apps/paypal/pages/login_page/widgets/widgets.dart';
import 'package:flutter_ui_app/main.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => MenuApps()));
        return true;
      },
      child: Scaffold(
        backgroundColor: Color(0xffFFFFFF),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[PaypalLogo(), FormBody(), OtherActions()],
            ),
          ),
        ),
      ),
    );
  }
}
