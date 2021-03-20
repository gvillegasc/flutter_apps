import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui_app/global/responsive.dart';

class ActionsNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Positioned(
      top: responsive.heightR(5),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: responsive.inchR(3)),
        width: responsive.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: responsive.inchR(0.6),
                  horizontal: responsive.inchR(2)),
              decoration: BoxDecoration(
                  color: const Color(0xff40D976),
                  borderRadius: BorderRadius.circular(responsive.inchR(3))),
              child: Row(
                children: <Widget>[
                  SvgPicture.asset('assets/workout_app/icons/ic_clock.svg'),
                  SizedBox(
                    width: responsive.inchR(1.5),
                  ),
                  Text(
                    '3 Hours',
                    style: TextStyle(
                        color: const Color(0xffFFFFFF),
                        fontSize: responsive.inchR(1.5)),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: CircleAvatar(
                backgroundColor: const Color(0xffFFFFFF),
                radius: responsive.inchR(1.5),
                child: SvgPicture.asset(
                  'assets/workout_app/icons/ic_close.svg',
                  height: responsive.inchR(1.5),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
