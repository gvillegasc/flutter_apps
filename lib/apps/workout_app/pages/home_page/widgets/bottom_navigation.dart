import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui_app/global/responsive.dart';

class BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Positioned(
      bottom: 0,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: responsive.widthR(12)),
        width: responsive.width,
        height: responsive.inchR(8),
        color: Color(0xff242538),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
                child: SvgPicture.asset(
              "assets/workout_app/icons/ic_menu.svg",
              height: responsive.inchR(2.5),
            )),
            Text(
              "Workout",
              style: TextStyle(
                  color: Color(0xff707070), fontSize: responsive.inchR(1.8)),
            ),
            Text(
              "Level",
              style: TextStyle(
                  color: Color(0xff707070), fontSize: responsive.inchR(1.8)),
            ),
            Text(
              "Profile",
              style: TextStyle(
                  color: Color(0xff707070), fontSize: responsive.inchR(1.8)),
            ),
          ],
        ),
      ),
    );
  }
}
