import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui_app/apps/canvas/providers/navigation_provider.dart';
import 'package:flutter_ui_app/global/responsive.dart';
import 'package:provider/provider.dart';

class ItemNavbar extends StatelessWidget {
  final int value;
  final String icon;
  final String name;

  const ItemNavbar(
      {Key key, @required this.value, @required this.icon, @required this.name})
      : assert(
          value != null,
          icon != null,
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    final NavigationProvider navigationProvider =
        Provider.of<NavigationProvider>(context);

    return GestureDetector(
      onTap: () {
        navigationProvider.actualPage = this.value;
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        width: responsive.widthR(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              "assets/canvas/icons/${this.icon}",
              height: responsive.inchR(2.2),
              color: navigationProvider.actualPage == this.value
                  ? Color(0xff367BE2)
                  : Color(0xffBBC7DB),
            ),
            Text(
              this.name,
              style: TextStyle(
                  color: navigationProvider.actualPage == this.value
                      ? Color(0xff367BE2)
                      : Color(0xffBBC7DB),
                  fontWeight: FontWeight.w600,
                  height: responsive.inchR(0.02),
                  fontSize: responsive.inchR(1.3)),
            )
          ],
        ),
      ),
    );
  }
}
