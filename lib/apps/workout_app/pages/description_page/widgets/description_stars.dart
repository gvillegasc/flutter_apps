import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui_app/global/responsive.dart';

class DescriptionStars extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return SizedBox(
      width: responsive.heightR(1.6) * 8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SvgPicture.asset(
            'assets/workout_app/icons/ic_star.svg',
            height: responsive.heightR(1.6),
          ),
          SvgPicture.asset(
            'assets/workout_app/icons/ic_star.svg',
            height: responsive.heightR(1.6),
          ),
          SvgPicture.asset(
            'assets/workout_app/icons/ic_star.svg',
            height: responsive.heightR(1.6),
          ),
          SvgPicture.asset(
            'assets/workout_app/icons/ic_star.svg',
            height: responsive.heightR(1.6),
            color: const Color(0xff24253C),
          ),
          SvgPicture.asset(
            'assets/workout_app/icons/ic_star.svg',
            height: responsive.heightR(1.6),
            color: const Color(0xff24253C),
          )
        ],
      ),
    );
  }
}
