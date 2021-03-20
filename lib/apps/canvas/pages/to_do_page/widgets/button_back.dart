import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ButtonBack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: SvgPicture.asset('assets/canvas/icons/ic_back.svg'),
        onPressed: () => Navigator.pop(context));
  }
}
