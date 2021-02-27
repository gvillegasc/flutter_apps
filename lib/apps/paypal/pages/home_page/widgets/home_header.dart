import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ui_app/apps/paypal/pages/home_page/home_page.dart';
import 'package:flutter_ui_app/global/responsive.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return SliverToBoxAdapter(
        child: Container(
      height: responsive.heightR(35),
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0xff0070BA).withOpacity(0.12),
            spreadRadius: 3,
            blurRadius: 10,
            offset: Offset(3, 7), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(responsive.inchR(5))),
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xff0070BA), Color(0xff1546A0)]),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              height: responsive.heightR(42),
              width: responsive.heightR(42),
              child: Image(
                image: AssetImage(
                  "assets/paypal/images/img_logo_transparent.png",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            right: 30,
            top: 10,
            child: GestureDetector(
              onTap: () {
                final HomeProvider homeProvider =
                    Provider.of<HomeProvider>(context, listen: false);
                homeProvider.changePage();
              },
              child: SafeArea(
                bottom: false,
                child: Container(
                  padding: EdgeInsets.all(2),
                  height: responsive.heightR(7),
                  width: responsive.heightR(7),
                  decoration: BoxDecoration(
                      color: Color(0xff0070BA),
                      borderRadius:
                          BorderRadius.circular(responsive.heightR(2.2))),
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(responsive.heightR(2.2) - 2),
                    child: Image(
                        image:
                            AssetImage("assets/paypal/images/img_person.jpg")),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              left: 0,
              top: responsive.heightR(2),
              child: SafeArea(
                  bottom: false,
                  child: Padding(
                    padding: EdgeInsets.only(left: responsive.widthR(6)),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SvgPicture.asset(
                              "assets/paypal/icons/ic_logo_white.svg"),
                          SizedBox(
                            height: responsive.heightR(3),
                          ),
                          Text("Hello, John!",
                              style: GoogleFonts.manrope(
                                  color: Colors.white.withOpacity(.5),
                                  fontWeight: FontWeight.w400,
                                  fontSize: responsive.inchR(2))),
                          SizedBox(
                            height: responsive.heightR(3.5),
                          ),
                          Text("\$ 272.30",
                              style: GoogleFonts.manrope(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: responsive.inchR(5))),
                          Text("Your Balance",
                              style: GoogleFonts.manrope(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: responsive.inchR(2.3)))
                        ]),
                  )))
        ],
      ),
    ));
  }
}
