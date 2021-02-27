import 'package:flutter/material.dart';
import 'package:flutter_ui_app/global/responsive.dart';
import 'package:flutter_ui_app/apps/paypal/pages/home_page/home_page.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ActivityTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: responsive.widthR(7)),
        width: responsive.width,
        height: responsive.inchR(4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Activity",
              style: GoogleFonts.manrope(
                  color: Color(0xff243656),
                  fontWeight: FontWeight.w700,
                  fontSize: responsive.inchR(2.3)),
            ),
            GestureDetector(
              onTap: () {
                final HomeProvider homeProvider =
                    Provider.of<HomeProvider>(context, listen: false);
                homeProvider.changePage();
              },
              behavior: HitTestBehavior.translucent,
              child: Text(
                "View all",
                style: GoogleFonts.manrope(
                    color: Color(0xff919BAA),
                    fontWeight: FontWeight.w400,
                    fontSize: responsive.inchR(1.6)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
