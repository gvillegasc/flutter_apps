import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ui_app/global/responsive.dart';
import 'package:google_fonts/google_fonts.dart';

class UserActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: responsive.heightR(3), horizontal: responsive.widthR(7)),
        child: Row(children: <Widget>[
          Container(
            height: responsive.inchR(17),
            width: responsive.inchR(15.5),
            padding: EdgeInsets.only(left: responsive.inchR(2.5)),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(responsive.inchR(3)),
                gradient: LinearGradient(
                  colors: [Color(0xff0070BA), Color(0xff1546A0)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SvgPicture.asset(
                  "assets/paypal/icons/ic_upload.svg",
                  height: responsive.inchR(3.75),
                ),
                Text("Send\nMoney",
                    style: GoogleFonts.manrope(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: responsive.inchR(2)))
              ],
            ),
          ),
          SizedBox(width: responsive.widthR(4.5)),
          Container(
            height: responsive.inchR(17),
            width: responsive.inchR(15.5),
            padding: EdgeInsets.only(left: responsive.inchR(2.5)),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(responsive.inchR(3)),
                color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SvgPicture.asset(
                  "assets/paypal/icons/ic_download.svg",
                  height: responsive.inchR(3.75),
                ),
                Text("Request\nPayment",
                    style: GoogleFonts.manrope(
                        color: Color(0xff1546A0),
                        fontWeight: FontWeight.w600,
                        fontSize: responsive.inchR(2)))
              ],
            ),
          )
        ]),
      ),
    );
  }
}
