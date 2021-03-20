import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui_app/global/responsive.dart';
import 'package:google_fonts/google_fonts.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    final statusBarHeight = MediaQuery.of(context).padding.top;
    return SliverToBoxAdapter(
      child: SizedBox(
        width: responsive.width,
        height: responsive.inchR(31),
        child: Stack(
          children: [
            Container(
              height: responsive.inchR(22),
              width: double.infinity,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xff0070BA), Color(0xff1546A0)])),
              child: Stack(
                children: [
                  Positioned(
                    left: -responsive.inchR(18),
                    child: SizedBox(
                      height: responsive.inchR(42),
                      width: responsive.inchR(42),
                      child: const Image(
                        image: AssetImage(
                          'assets/paypal/images/img_logo_transparent.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: responsive.inchR(7) + statusBarHeight,
                  ),
                  Container(
                    height: responsive.inchR(17),
                    width: responsive.inchR(17),
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/paypal/images/img_person.jpg'))),
                    ),
                  ),
                ],
              ),
            ),
            SafeArea(
              bottom: false,
              child: Container(
                height: responsive.inchR(6.5),
                width: responsive.width,
                padding: EdgeInsets.symmetric(horizontal: responsive.widthR(6)),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                          onTap: () {},
                          child: SvgPicture.asset(
                            'assets/paypal/icons/ic_arrow_back.svg',
                            color: Colors.white,
                          )),
                      Text('Your wallet',
                          style: GoogleFonts.manrope(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: responsive.inchR(2))),
                      SvgPicture.asset(
                        'assets/paypal/icons/ic_write.svg',
                      )
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
