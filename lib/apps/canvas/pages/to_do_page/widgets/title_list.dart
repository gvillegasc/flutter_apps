import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui_app/global/responsive.dart';

class TitleList extends StatelessWidget {
  final String title;

  const TitleList({Key key, @required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: responsive.inchR(2.5), vertical: responsive.inchR(2)),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "ACTIVIDADES",
              style: TextStyle(
                  color: Color(0xff92A5C6),
                  fontSize: responsive.inchR(1.3),
                  fontWeight: FontWeight.w700),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  this.title,
                  style: TextStyle(
                      color: Color(0xff223E6D),
                      fontSize: responsive.inchR(3.3),
                      fontWeight: FontWeight.w700),
                ),
                Padding(
                  padding: EdgeInsets.only(right: responsive.inchR(1.5)),
                  child: SvgPicture.asset(
                    "assets/canvas/icons/ic_pen.svg",
                    height: responsive.inchR(2),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
