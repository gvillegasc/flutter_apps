import 'package:flutter/material.dart';
import 'package:flutter_ui_app/global/responsive.dart';

class DescriptionMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: responsive.heightR(2.5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Description',
            style: TextStyle(
                color: const Color(0xffFFFFFF),
                fontSize: responsive.heightR(2.7)),
          ),
          Text(
            'Feedback',
            style: TextStyle(
                color: const Color(0xff474747),
                fontSize: responsive.heightR(2.7)),
          ),
          Text(
            'Related',
            style: TextStyle(
                color: const Color(0xff474747),
                fontSize: responsive.heightR(2.7)),
          )
        ],
      ),
    );
  }
}
