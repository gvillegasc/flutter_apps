import 'package:flutter/material.dart';
import 'package:flutter_ui_app/global/responsive.dart';

class TaskInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: responsive.inchR(3)),
        width: double.infinity,
        height: responsive.inchR(6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[PendingTasks(), ProgressBar()],
        ),
      ),
    );
  }
}

class PendingTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Text(
      "Tienes 3 tareas pendientes",
      style: TextStyle(
          color: Color(0xff98A6BE),
          fontWeight: FontWeight.w400,
          fontSize: responsive.inchR(1.5)),
    );
  }
}

class ProgressBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return SizedBox(
      height: responsive.inchR(1),
      width: responsive.inchR(30),
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xffEFEFEF), borderRadius: BorderRadius.circular(20)),
        padding: EdgeInsets.only(right: responsive.inchR(10)),
        child: Container(
          decoration: BoxDecoration(
              color: Color(0xffEA7979),
              borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }
}
