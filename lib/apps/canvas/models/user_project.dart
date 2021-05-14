import 'dart:ui';

class UserProject {
  UserProject({
    required this.date,
    required this.activity,
    required this.team,
    required this.color,
  });

  String date;
  List<String> activity;
  String team;
  Color color;
}
