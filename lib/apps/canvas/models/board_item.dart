import 'dart:ui';

class BoardItem {
  BoardItem({
    required this.percent,
    required this.color,
    required this.title,
    required this.area,
  });

  int percent;
  Color color;
  String title;
  String area;
}
