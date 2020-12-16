import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui_app/global/responsive.dart';

class BoardTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return SliverToBoxAdapter(
      child: Container(
        height: responsive.inchR(5),
        padding: EdgeInsets.symmetric(horizontal: responsive.inchR(2)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Tablero",
              style: TextStyle(
                  color: Color(0xff223E6D),
                  fontWeight: FontWeight.w700,
                  fontSize: responsive.inchR(2.8)),
            ),
            Row(
              children: [
                SvgPicture.asset(
                  "assets/canvas/icons/ic_filter.svg",
                  height: responsive.inchR(1.3),
                ),
                SizedBox(
                  width: responsive.inchR(0.5),
                ),
                Text(
                  "Filtrar",
                  style: TextStyle(
                      color: Color(0xff92A5C6),
                      fontWeight: FontWeight.w400,
                      fontSize: responsive.inchR(1.7)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
