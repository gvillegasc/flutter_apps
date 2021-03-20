import 'package:flutter/material.dart';
import 'package:flutter_ui_app/global/responsive.dart';

class GroupTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return SliverToBoxAdapter(
      child: Container(
        height: responsive.inchR(5),
        padding: EdgeInsets.symmetric(horizontal: responsive.inchR(2)),
        child: Text(
          'Grupos',
          style: TextStyle(
              color: const Color(0xff223E6D),
              fontWeight: FontWeight.w700,
              fontSize: responsive.inchR(2.8)),
        ),
      ),
    );
  }
}
