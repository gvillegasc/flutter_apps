import 'package:flutter/material.dart';
import 'package:flutter_ui_app/global/responsive.dart';

class SpaceSeparation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return SliverToBoxAdapter(
      child: Container(
        height: responsive.inchR(10),
      ),
    );
  }
}
