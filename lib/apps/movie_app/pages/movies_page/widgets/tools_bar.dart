import 'package:flutter/material.dart';
import 'package:flutter_ui_app/global/responsive.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ToolsBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return SafeArea(
      child: Container(
        height: responsive.inchR(5),
        width: responsive.width,
        padding: EdgeInsets.symmetric(horizontal: responsive.inchR(1)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/ic_menu.svg",
                  height: responsive.inchR(2.7),
                ),
                onPressed: () {}),
            IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/ic_search.svg",
                  height: responsive.inchR(2.7),
                ),
                onPressed: () {})
          ],
        ),
      ),
    );
  }
}
