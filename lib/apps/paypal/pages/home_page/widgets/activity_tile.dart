import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui_app/apps/paypal/models/activity_item.dart';
import 'package:flutter_ui_app/apps/paypal/pages/home_page/home_page.dart';

import 'package:flutter_ui_app/global/responsive.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ActivityTile extends StatelessWidget {
  final Person person;

  const ActivityTile({Key key, @required this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    return GestureDetector(
      onTap: () {
        final HomeProvider homeProvider =
            Provider.of<HomeProvider>(context, listen: false);
        homeProvider.changePage();
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: responsive.inchR(.5)),
        width: double.infinity,
        height: responsive.inchR(8),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.07),
                spreadRadius: -10,
                blurRadius: 20,
                offset: Offset(0, 20), // changes position of shadow
              )
            ],
            borderRadius: BorderRadius.circular(responsive.inchR(2))),
        child: Row(children: <Widget>[
          Container(
              width: responsive.inchR(8),
              padding: EdgeInsets.all(responsive.inchR(1.75)),
              height: double.infinity,
              child: SvgPicture.asset(
                "assets/paypal/icons/${this.person.image}",
              )),
          Expanded(
              child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(this.person.name,
                    style: GoogleFonts.manrope(
                        color: Color(0xff243656),
                        fontSize: responsive.inchR(2.1),
                        fontWeight: FontWeight.w500)),
                Text(
                  this.person.ago,
                  style: GoogleFonts.manrope(
                      color: Color(0xff919BAA),
                      fontSize: responsive.inchR(1.6),
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          )),
          Container(
            width: responsive.widthR(20),
            height: double.infinity,
            padding: EdgeInsets.only(right: responsive.widthR(2.5)),
            alignment: Alignment.centerRight,
            child: Text(
              "${this.person.more ? "+" : "-"}\$${this.person.total.toString().replaceAll(RegExp(r"([.]*0)(?!.*\d)"), "")}",
              style: GoogleFonts.manrope(
                  color:
                      this.person.more ? Color(0xff37D39B) : Color(0xffF47090),
                  fontWeight: FontWeight.w600,
                  fontSize: responsive.inchR(1.75)),
            ),
          )
        ]),
      ),
    );
  }
}
