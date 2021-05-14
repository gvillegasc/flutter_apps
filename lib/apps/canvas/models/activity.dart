import 'package:flutter/material.dart';

class Activity {
  Activity(
      {required this.name,
      required this.date,
      this.completed,
      required this.hour,
      required this.course,
      required this.color});

  String name;
  String date;
  bool? completed;
  String hour;
  String course;
  Color color;
}
