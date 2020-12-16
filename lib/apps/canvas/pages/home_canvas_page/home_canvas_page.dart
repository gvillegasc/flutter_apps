import 'package:flutter/material.dart';
import 'package:flutter_ui_app/apps/canvas/pages/home_canvas_page/widgets/widgets.dart';
import 'package:flutter_ui_app/global/responsive.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';

class HomeCanvasPage extends StatelessWidget {
  final GlobalKey<AnimatedCircularChartState> _chartKey =
      new GlobalKey<AnimatedCircularChartState>();
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Scaffold(
      body: Container(
        width: responsive.width,
        height: responsive.height,
        child: CustomScrollView(
          slivers: <Widget>[
            UserInfo(),
            TaskInfo(),
            Projects(),
            Tasks(),
            SliverToBoxAdapter(
              child: Container(
                height: responsive.inchR(10),
              ),
            )
          ],
        ),
      ),
    );
  }
}
