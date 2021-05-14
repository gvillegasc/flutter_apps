import 'package:flutter/material.dart';
import 'package:flutter_ui_app/global/responsive.dart';
import 'package:google_fonts/google_fonts.dart';

class SubtitleDetail extends StatelessWidget {
  const SubtitleDetail({Key? key, required this.subtitle}) : super(key: key);

  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: responsive.inchR(3)),
      alignment: Alignment.centerLeft,
      child: Text(
        subtitle,
        textAlign: TextAlign.start,
        style: GoogleFonts.openSans(
            fontSize: responsive.inchR(2.2),
            color: const Color(0xff12153D),
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
