import 'package:flutter/material.dart';
import 'package:flutter_ui_app/global/responsive.dart';

class Back extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Positioned(
        top: responsive.inchR(3),
        left: responsive.inchR(2),
        child: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios,
            size: responsive.inchR(2.2),
          ),
        ));
  }
}
