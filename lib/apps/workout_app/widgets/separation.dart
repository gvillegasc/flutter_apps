import 'package:flutter/material.dart';

class Separation extends StatelessWidget {
  const Separation({Key key, @required this.height}) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: height,
      ),
    );
  }
}
