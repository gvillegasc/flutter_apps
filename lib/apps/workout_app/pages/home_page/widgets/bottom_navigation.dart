import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui_app/global/responsive.dart';

class BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    final safeAreaBottom = MediaQuery.of(context).padding.bottom;
    return Positioned(
      bottom: 0,
      child: Container(
        padding: EdgeInsets.only(
            left: responsive.widthR(12),
            right: responsive.widthR(12),
            bottom: safeAreaBottom),
        width: responsive.width,
        height: responsive.inchR(8) + safeAreaBottom,
        color: const Color(0xff242538),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SvgPicture.asset(
              'assets/workout_app/icons/ic_menu.svg',
              height: responsive.inchR(2.5),
            ),
            Text(
              'Workout',
              style: TextStyle(
                  color: const Color(0xff707070),
                  fontSize: responsive.inchR(1.8)),
            ),
            Text(
              'Level',
              style: TextStyle(
                  color: const Color(0xff707070),
                  fontSize: responsive.inchR(1.8)),
            ),
            Text(
              'Profile',
              style: TextStyle(
                  color: const Color(0xff707070),
                  fontSize: responsive.inchR(1.8)),
            ),
          ],
        ),
      ),
    );
  }
}
