import 'package:flutter/material.dart';
import 'package:flutter_ui_app/global/responsive.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleHardElement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Container(
      width: responsive.width,
      height: responsive.inchR(4),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'HARD',
            style: GoogleFonts.bebasNeue(
                letterSpacing: 3,
                color: const Color(0xffFFFFFFF),
                fontSize: responsive.inchR(4)),
          ),
          SizedBox(
            width: responsive.inchR(1.5),
          ),
          Text(
            'ELEMENT',
            style: GoogleFonts.bebasNeue(
                letterSpacing: 3,
                color: const Color(0xff40D876),
                fontSize: responsive.inchR(4)),
          )
        ],
      ),
    );
  }
}
