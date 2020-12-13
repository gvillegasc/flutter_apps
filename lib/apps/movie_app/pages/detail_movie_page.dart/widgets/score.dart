import 'package:flutter/material.dart';
import 'package:flutter_ui_app/global/responsive.dart';
import 'package:google_fonts/google_fonts.dart';

class Score extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: responsive.inchR(3.5),
          width: responsive.inchR(4),
          child: Container(
            padding: EdgeInsets.all(responsive.inchR(0.3)),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: Color(0xff51CF66),
              ),
              alignment: Alignment.center,
              child: Text("86",
                  style: GoogleFonts.openSans(
                      color: Colors.white, fontSize: responsive.inchR(1.5))),
            ),
          ),
        ),
        SizedBox(
          height: responsive.inchR(0.2),
        ),
        Text(
          "Metascore",
          style: GoogleFonts.openSans(
              fontWeight: FontWeight.w600,
              color: Color(0xff12153D),
              fontSize: responsive.inchR(1.8)),
        ),
        SizedBox(
          height: responsive.inchR(0.01),
        ),
        Text("62 critic reviews",
            style: GoogleFonts.openSans(
                fontWeight: FontWeight.w400,
                color: Color(0xff9A9BB2),
                fontSize: responsive.inchR(1.4)))
      ],
    );
  }
}
