import 'package:flutter/material.dart';
import 'package:flutter_ui_app/global/responsive.dart';
import 'package:google_fonts/google_fonts.dart';

class SubtitleDetail extends StatelessWidget {
  final String subtitle;

  const SubtitleDetail({Key key, @required this.subtitle})
      : assert(subtitle != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: responsive.inchR(3)),
      alignment: Alignment.centerLeft,
      child: Text(
        this.subtitle,
        textAlign: TextAlign.start,
        style: GoogleFonts.openSans(
            fontSize: responsive.inchR(2.2),
            color: Color(0xff12153D),
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
