import 'package:flutter/material.dart';
import 'package:flutter_ui_app/global/responsive.dart';
import 'package:google_fonts/google_fonts.dart';

class OtherActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Column(
      children: <Widget>[
        Text(
          'Having trouble logging in?',
          style: GoogleFonts.manrope(
              color: const Color(0xff929BAA), fontSize: responsive.inchR(1.7)),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: responsive.heightR(2.5)),
          height: 2,
          width: responsive.widthR(10),
          color: const Color(0xffF6F7FA),
        ),
        Text(
          'Sign up',
          style: GoogleFonts.manrope(
              color: const Color(0xff929BAA), fontSize: responsive.inchR(1.7)),
        )
      ],
    );
  }
}
