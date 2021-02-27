import 'package:flutter/material.dart';
import 'package:flutter_ui_app/apps/workout_app/pages/home_page/widgets/widgets.dart';
import 'package:flutter_ui_app/apps/workout_app/widgets/separation.dart';
import 'package:flutter_ui_app/global/responsive.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    final double safeAreaBottom = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      backgroundColor: Color(0xff131429),
      body: Container(
        height: responsive.height,
        width: responsive.width,
        child: Stack(
          children: [
            CustomScrollView(
              slivers: <Widget>[
                Introduction(),
                Filter(),
                PopularSection(),
                HardSection(),
                Separation(height: responsive.inchR(9) + safeAreaBottom)
              ],
            ),
            BottomNavigation()
          ],
        ),
      ),
    );
  }
}
