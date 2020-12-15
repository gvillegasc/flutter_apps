import 'package:flutter/material.dart';
import 'package:flutter_ui_app/global/responsive.dart';
import 'widgets.dart';

class InfoMovie extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Positioned(
        top: responsive.heightR(27),
        right: 0,
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.35),
                spreadRadius: 1,
                blurRadius: 40,
                offset: Offset(0, 9), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(responsive.inchR(6)),
                topLeft: Radius.circular(responsive.inchR(6))),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(responsive.inchR(6)),
                topLeft: Radius.circular(responsive.inchR(6))),
            child: Container(
              color: Color(0xffFFFFFF),
              padding: EdgeInsets.only(
                  top: responsive.inchR(1.5),
                  left: responsive.inchR(4),
                  right: responsive.inchR(2)),
              height: responsive.inchR(11.5),
              width: responsive.widthR(90),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[Stars(), Rate(), Score()],
              ),
            ),
          ),
        ));
  }
}
