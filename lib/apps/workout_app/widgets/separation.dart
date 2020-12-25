import 'package:flutter/material.dart';

class Separation extends StatelessWidget {
  final double height;

  const Separation({Key key, @required this.height}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: this.height,
      ),
    );
  }
}
