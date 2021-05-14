import 'dart:math' as math;
import 'package:flutter/widgets.dart';

class Responsive {
  Responsive({required this.width, required this.height, required this.inch});

  factory Responsive.fromSize(Size size) {
    final inch = math.sqrt(math.pow(size.width, 2) + math.pow(size.height, 2));
    return Responsive(width: size.width, height: size.height, inch: inch);
  }

  factory Responsive.of(BuildContext context) {
    final data = MediaQuery.of(context);
    final size = data.size;
    final inch = math.sqrt(math.pow(size.width, 2) + math.pow(size.height, 2));
    return Responsive(width: size.width, height: size.height, inch: inch);
  }

  final double width;
  final double height;
  final double inch;

  double widthR(double percent) {
    return width * percent / 100;
  }

  double heightR(double percent) {
    return height * percent / 100;
  }

  double inchR(double percent) {
    return inch * percent / 100;
  }
}
