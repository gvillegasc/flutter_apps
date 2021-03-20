import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui_app/global/responsive.dart';
import 'package:google_fonts/google_fonts.dart';

class Rate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SvgPicture.asset(
          'assets/movie_app/icons/ic_star_outline.svg',
          height: responsive.inchR(3.5),
        ),
        SizedBox(
          height: responsive.inchR(0.2),
        ),
        Text(
          'Rate This',
          style: GoogleFonts.openSans(
              fontWeight: FontWeight.w600,
              color: const Color(0xff12153D),
              fontSize: responsive.inchR(1.8)),
        ),
        SizedBox(
          height: responsive.inchR(2),
        ),
      ],
    );
  }
}
