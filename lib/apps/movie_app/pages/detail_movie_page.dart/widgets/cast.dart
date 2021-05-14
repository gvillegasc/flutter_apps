import 'package:flutter/material.dart';
import 'package:flutter_ui_app/global/responsive.dart';
import 'package:google_fonts/google_fonts.dart';

class Cast extends StatelessWidget {
  const Cast(
      {Key? key,
      required this.asset,
      required this.name,
      required this.position})
      : super(key: key);

  final String asset;
  final String name;
  final String position;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return SizedBox(
      width: responsive.inchR(7.5),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: responsive.heightR(0.6),
          ),
          Image(
            image: AssetImage(asset),
            height: responsive.heightR(8),
          ),
          SizedBox(
            height: responsive.heightR(1),
          ),
          Text(
            name,
            textAlign: TextAlign.center,
            style: GoogleFonts.openSans(
                fontSize: responsive.inchR(1.4),
                color: const Color(0xff12153D),
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: responsive.heightR(0.5),
          ),
          Text(
            position,
            textAlign: TextAlign.center,
            style: GoogleFonts.openSans(
                fontSize: responsive.inchR(1.4),
                color: const Color(0xff9A9BB2),
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
