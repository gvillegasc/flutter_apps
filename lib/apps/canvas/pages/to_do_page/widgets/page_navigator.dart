import 'package:flutter/material.dart';
import 'package:flutter_ui_app/apps/canvas/pages/to_do_page/widgets/widgets.dart';
import 'package:flutter_ui_app/apps/canvas/providers/to_do_navigation_provider.dart';
import 'package:flutter_ui_app/global/responsive.dart';
import 'package:provider/provider.dart';

class PageNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final toDoNavigationProvider = Provider.of<ToDoNavigationProvider>(context);
    final responsive = Responsive.of(context);
    return Container(
      // height: double.infinity,
      width: responsive.widthR(82),
      color: const Color(0xffFFFFFFF),
      child: PageView(
        scrollDirection: Axis.vertical,
        controller: toDoNavigationProvider.pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[ToDoList(), DoingList(), DoneList()],
      ),
    );
  }
}
