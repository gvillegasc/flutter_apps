import 'package:flutter/material.dart';

class Activity {
  Activity(
      {this.name,
      this.date,
      this.completed,
      this.hour,
      this.course,
      this.color});

  String name;
  String date;
  bool completed;
  String hour;
  String course;
  Color color;
}
