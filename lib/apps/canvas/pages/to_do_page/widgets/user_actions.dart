import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui_app/apps/canvas/providers/to_do_navigation_provider.dart';
import 'package:flutter_ui_app/global/responsive.dart';
import 'package:provider/provider.dart';

class UserActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    final toDoNavigationProvider = Provider.of<ToDoNavigationProvider>(context);
    return Column(
      children: <Widget>[
        SizedBox(
          height: responsive.heightR(3),
        ),
        Option(
            icon: 'assets/canvas/icons/ic_add.svg',
            color: const Color(0xffFEB25B),
            value: -1,
            onTap: () {}),
        SizedBox(
          height: responsive.heightR(6),
        ),
        Option(
            icon: 'assets/canvas/icons/ic_book.svg',
            color: const Color(0xffFE5B60),
            value: 0,
            onTap: () => navigate(0, toDoNavigationProvider)),
        SizedBox(
          height: responsive.heightR(2.5),
        ),
        Option(
            icon: 'assets/canvas/icons/ic_setting.svg',
            color: const Color(0xff54B39B),
            value: 1,
            onTap: () => navigate(1, toDoNavigationProvider)),
        SizedBox(
          height: responsive.heightR(2.5),
        ),
        Option(
            icon: 'assets/canvas/icons/ic_check.svg',
            color: const Color(0xff615BFE),
            value: 2,
            onTap: () => navigate(2, toDoNavigationProvider)),
      ],
    );
  }

  void navigate(int valuePage, ToDoNavigationProvider toDoNavigationProvider) {
    toDoNavigationProvider.actualPage = valuePage;
  }
}

class Option extends StatelessWidget {
  const Option(
      {Key key,
      @required this.icon,
      @required this.color,
      @required this.value,
      @required this.onTap})
      : super(key: key);

  final String icon;
  final Color color;
  final int value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    final actualPage = Provider.of<ToDoNavigationProvider>(context).actualPage;
    return SizedBox(
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: responsive.widthR(3.5)),
            child: GestureDetector(
              onTap: onTap,
              child: Container(
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                ),
                padding: EdgeInsets.all(responsive.inchR(1)),
                height: responsive.inchR(4.5),
                width: responsive.inchR(4.5),
                child: SvgPicture.asset(
                  icon,
                  color: const Color(0xffFFFFFF),
                ),
              ),
            ),
          ),
          (value == actualPage)
              ? Positioned(
                  right: responsive.widthR(-2.3),
                  child: SvgPicture.asset(
                    'assets/canvas/icons/ic_selector.svg',
                    height: responsive.inchR(4),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
