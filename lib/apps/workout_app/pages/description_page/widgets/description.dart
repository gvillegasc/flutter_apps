import 'package:flutter/material.dart';
import 'package:flutter_ui_app/apps/workout_app/pages/description_page/widgets/widgets.dart';
import 'package:flutter_ui_app/global/responsive.dart';

class Description extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Positioned(
      bottom: 0,
      child: Container(
        height: responsive.heightR(50),
        width: responsive.width,
        padding: EdgeInsets.only(
            top: responsive.heightR(3.5),
            left: responsive.inchR(3),
            right: responsive.inchR(3)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: responsive.heightR(0.5)),
              width: double.infinity,
              child: Text(
                'Advance Workout',
                style: TextStyle(
                    color: const Color(0xffFFFFFF),
                    fontSize: responsive.heightR(3.5),
                    fontWeight: FontWeight.w900),
              ),
            ),
            DescriptionStars(),
            DescriptionMenu(),
            DescriptionText(),
            DescriptionActions()
          ],
        ),
      ),
    );
  }
}
