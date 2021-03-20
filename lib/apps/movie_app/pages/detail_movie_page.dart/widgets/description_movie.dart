import 'package:flutter/material.dart';
import 'package:flutter_ui_app/global/responsive.dart';
import 'package:google_fonts/google_fonts.dart';

class DescriptionMovie extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: responsive.inchR(3)),
      alignment: Alignment.centerLeft,
      child: Text(
        '''American car designer Carroll Shelby and driver Kn Miles battle corporate interference and the laws of physics to build a revolutionary race car for Ford in order.''',
        textAlign: TextAlign.start,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        style: GoogleFonts.openSans(
            fontSize: responsive.inchR(1.5),
            color: const Color(0xff737599),
            fontWeight: FontWeight.w400),
      ),
    );
  }
}
