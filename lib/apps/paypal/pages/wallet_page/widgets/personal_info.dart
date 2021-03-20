import 'package:flutter/material.dart';
import 'package:flutter_ui_app/global/responsive.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonalInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return SliverToBoxAdapter(
      child: Container(
        width: responsive.width,
        padding: EdgeInsets.symmetric(horizontal: responsive.widthR(7)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Personal info',
                style: GoogleFonts.manrope(
                    color: const Color(0xff243656).withOpacity(.5),
                    fontWeight: FontWeight.w400,
                    fontSize: responsive.inchR(1.75))),
            SizedBox(
              height: responsive.heightR(2),
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: responsive.widthR(25),
                  child: Text('Name',
                      style: GoogleFonts.manrope(
                          color: const Color(0xff243656),
                          fontWeight: FontWeight.w500,
                          fontSize: responsive.inchR(2.1))),
                ),
                Text('John Deo',
                    style: GoogleFonts.manrope(
                        color: const Color(0xff243656),
                        fontWeight: FontWeight.w700,
                        fontSize: responsive.inchR(2.1))),
              ],
            ),
            SizedBox(
              height: responsive.heightR(2),
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: responsive.widthR(25),
                  child: Text('E-mail',
                      style: GoogleFonts.manrope(
                          color: const Color(0xff243656),
                          fontWeight: FontWeight.w500,
                          fontSize: responsive.inchR(2.1))),
                ),
                Text('johnd@testland.com',
                    style: GoogleFonts.manrope(
                        color: const Color(0xff243656),
                        fontWeight: FontWeight.w700,
                        fontSize: responsive.inchR(2.1))),
              ],
            ),
            SizedBox(
              height: responsive.heightR(2),
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: responsive.widthR(25),
                  child: Text('Phone',
                      style: GoogleFonts.manrope(
                          color: const Color(0xff243656),
                          fontWeight: FontWeight.w500,
                          fontSize: responsive.inchR(2.1))),
                ),
                Text('+11 99999999',
                    style: GoogleFonts.manrope(
                        color: const Color(0xff243656),
                        fontWeight: FontWeight.w700,
                        fontSize: responsive.inchR(2.1))),
              ],
            ),
            SizedBox(
              height: responsive.heightR(5),
            ),
          ],
        ),
      ),
    );
  }
}
