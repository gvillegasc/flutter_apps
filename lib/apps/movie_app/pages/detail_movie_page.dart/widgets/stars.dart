import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui_app/global/responsive.dart';
import 'package:google_fonts/google_fonts.dart';

class Stars extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SvgPicture.asset(
          'assets/movie_app/icons/ic_star_yellow.svg',
          height: responsive.inchR(3.5),
        ),
        SizedBox(
          height: responsive.inchR(0.2),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              '8.2',
              style: GoogleFonts.openSans(
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff12153D),
                  fontSize: responsive.inchR(1.8)),
            ),
            Text(
              '/10',
              style: GoogleFonts.openSans(
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff12153D),
                  fontSize: responsive.inchR(1.4)),
            ),
          ],
        ),
        SizedBox(
          height: responsive.inchR(0.01),
        ),
        Text('150,212',
            style: GoogleFonts.openSans(
                fontWeight: FontWeight.w400,
                color: const Color(0xff9A9BB2),
                fontSize: responsive.inchR(1.4)))
      ],
    );
  }
}
