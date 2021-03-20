import 'package:flutter/material.dart';
import 'package:flutter_ui_app/apps/canvas/pages/canvas_page/canvas_page.dart';
import 'package:flutter_ui_app/apps/canvas/pages/courses_page/courses_page.dart';
import 'package:flutter_ui_app/apps/canvas/pages/home_canvas_page/home_canvas_page.dart';
import 'package:flutter_ui_app/apps/canvas/pages/profile_page/profile_page.dart';
import 'package:flutter_ui_app/apps/canvas/providers/navigation_provider.dart';
import 'package:provider/provider.dart';

class PagesNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);

    return PageView(
      controller: navigationProvider.pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: <Widget>[
        HomeCanvasPage(),
        CanvasPage(),
        CoursesPage(),
        ProfilePage()
      ],
    );
  }
}
