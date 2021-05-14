import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui_app/apps/canvas/providers/navigation_provider.dart';
import 'package:flutter_ui_app/global/responsive.dart';
import 'package:provider/provider.dart';

class ItemNavbar extends StatelessWidget {
  const ItemNavbar(
      {Key? key, required this.value, required this.icon, required this.name})
      : super(key: key);

  final int value;
  final String icon;
  final String name;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    final navigationProvider = Provider.of<NavigationProvider>(context);

    return GestureDetector(
      onTap: () {
        navigationProvider.actualPage = value;
      },
      behavior: HitTestBehavior.translucent,
      child: SizedBox(
        width: responsive.widthR(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset('assets/canvas/icons/$icon',
                height: responsive.inchR(2.2),
                color: Color(navigationProvider.actualPage == value
                    ? 0xff367BE2
                    : 0xffBBC7DB)),
            Text(
              name,
              style: TextStyle(
                  color: Color(navigationProvider.actualPage == value
                      ? 0xff367BE2
                      : 0xffBBC7DB),
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
