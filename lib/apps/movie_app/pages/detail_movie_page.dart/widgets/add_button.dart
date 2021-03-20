import 'package:flutter/material.dart';
import 'package:flutter_ui_app/global/responsive.dart';

class AddButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Container(
      height: responsive.inchR(5.5),
      width: responsive.inchR(5.5),
      decoration: BoxDecoration(
          color: const Color(0xffFE6D8E),
          borderRadius: BorderRadius.circular(responsive.inchR(1.5))),
      child: Icon(
        Icons.add,
        color: const Color(0xffFFFFFF),
        size: responsive.inchR(3),
      ),
    );
  }
}
