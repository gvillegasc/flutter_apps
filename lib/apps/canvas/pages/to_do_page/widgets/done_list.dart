import 'package:flutter/material.dart';
import 'package:flutter_ui_app/apps/canvas/models/activity.dart';
import 'package:flutter_ui_app/apps/canvas/pages/to_do_page/widgets/widgets.dart';

class DoneList extends StatelessWidget {
  final List<Activity> activities = [
    Activity(
        name: "Hacer el login para el sistema",
        date: "20/febrero/2021",
        completed: true,
        course: "Backend",
        color: Color(0xff367BE2),
        hour: "10:00 am"),
    Activity(
        name: "Hacer la vista del login para el sistema",
        date: "21/febrero/2021",
        completed: true,
        course: "Frontend",
        color: Color(0xffFE5B60),
        hour: "10:00 am"),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          TitleList(
            title: "Realizado",
          ),
          ActivityList(activities: activities)
        ],
      ),
    );
  }
}
