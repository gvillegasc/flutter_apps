import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ui_app/apps/paypal/providers/navigation_provider.dart';
import 'package:flutter_ui_app/global/responsive.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BottomNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final NavigationProviderPp navigationBLoC =
        Provider.of<NavigationProviderPp>(context);
    final Responsive responsive = Responsive.of(context);

    return Positioned(
      bottom: 0,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(responsive.inchR(3)),
                topRight: Radius.circular(responsive.inchR(3)))),
        width: responsive.width,
        height: responsive.inchR(8),
        child: BubbleBottomBar(
          opacity: 1,
          backgroundColor: Colors.transparent,
          currentIndex: navigationBLoC.actualPage,
          onTap: (i) => navigationBLoC.changePage(i),
          elevation: 0,
          hasNotch: true,
          hasInk: true,
          items: <BubbleBottomBarItem>[
            navigationItem("ic_home.svg", "Home", responsive),
            navigationItem("ic_persons.svg", "Contacts", responsive),
            navigationItem("ic_billing.svg", "Wallet", responsive),
            navigationItem("ic_settings.svg", "Settings", responsive),
          ],
        ),
      ),
    );
  }

  BubbleBottomBarItem navigationItem(
      String icon, String name, Responsive responsive) {
    return BubbleBottomBarItem(
        backgroundColor: Colors.white,
        icon: SvgPicture.asset(
          "assets/paypal/icons/$icon",
          color: Color(0xff243656),
        ),
        activeIcon: SvgPicture.asset("assets/paypal/icons/$icon",
            color: Color(0xff0070BA)),
        title: Text(
          name,
          style: GoogleFonts.manrope(
              color: Color(0xff0070BA),
              fontSize: responsive.inchR(1.6),
              fontWeight: FontWeight.w400),
        ));
  }
}
