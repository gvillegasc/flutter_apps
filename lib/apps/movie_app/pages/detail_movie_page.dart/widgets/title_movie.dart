import 'package:flutter/material.dart';
import 'package:flutter_ui_app/global/responsive.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleMovie extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Ford v Ferrari",
          textAlign: TextAlign.start,
          style: GoogleFonts.openSans(
              fontSize: responsive.inchR(2.7),
              color: Color(0xff12153D),
              fontWeight: FontWeight.w600),
        ),
        Container(
          width: responsive.inchR(17.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "2019",
                style: GoogleFonts.openSans(
                    fontSize: responsive.inchR(1.5),
                    color: Color(0xff9A9BB2),
                    fontWeight: FontWeight.w400),
              ),
              Text(
                "PG-13",
                style: GoogleFonts.openSans(
                    fontSize: responsive.inchR(1.5),
                    color: Color(0xff9A9BB2),
                    fontWeight: FontWeight.w400),
              ),
              Text(
                "2h 32min",
                style: GoogleFonts.openSans(
                    fontSize: responsive.inchR(1.5),
                    color: Color(0xff9A9BB2),
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        )
      ],
    );
  }
}
