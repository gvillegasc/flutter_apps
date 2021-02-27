import 'package:flutter/material.dart';
import 'package:flutter_ui_app/global/responsive.dart';

class PaypalLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Container(
      margin: EdgeInsets.only(
          top: responsive.heightR(15) + statusBarHeight,
          bottom: responsive.heightR(13)),
      height: responsive.inchR(5),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/paypal/images/img_paypal.png"))),
    );
  }
}
