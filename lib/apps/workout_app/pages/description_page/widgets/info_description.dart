import 'package:flutter/material.dart';
import 'package:flutter_ui_app/global/responsive.dart';

class InfoDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Positioned(
      bottom: 0,
      left: responsive.widthR(6),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: responsive.widthR(16)),
        width: responsive.widthR(88),
        height: responsive.heightR(7),
        decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(
              color: const Color(0xff808080),
              style: BorderStyle.solid,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(responsive.inchR(2.5))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const InfoItem(
              count: 26,
              name: 'moves',
            ),
            const InfoItem(
              count: 12,
              name: 'Sets',
            ),
            const InfoItem(
              count: 30,
              name: 'min',
            )
          ],
        ),
      ),
    );
  }
}

class InfoItem extends StatelessWidget {
  const InfoItem({Key key, @required this.count, @required this.name})
      : super(key: key);

  final int count;
  final String name;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Row(
      children: <Widget>[
        Text(
          count.toString(),
          style: TextStyle(
              color: const Color(0xff40D876),
              fontWeight: FontWeight.w700,
              fontSize: responsive.heightR(1.85)),
        ),
        SizedBox(
          width: responsive.widthR(1),
        ),
        Text(
          name,
          style: TextStyle(
              color: const Color(0xffFFFFFF),
              fontWeight: FontWeight.w400,
              fontSize: responsive.heightR(1.85)),
        )
      ],
    );
  }
}
