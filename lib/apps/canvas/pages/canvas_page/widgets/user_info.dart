import 'package:flutter/material.dart';

import 'package:flutter_ui_app/global/responsive.dart';

class UserInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return SliverToBoxAdapter(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: responsive.inchR(4)),
        height: responsive.inchR(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            UserPhoto(),
            UserName(),
          ],
        ),
      ),
    );
  }
}

class UserName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return SizedBox(
        width: responsive.widthR(50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Cuenta canvas',
              style: TextStyle(
                  color: const Color(0xff223E6D),
                  fontSize: responsive.inchR(1.8),
                  fontWeight: FontWeight.w700),
            ),
            Text('diana_lucio@testland.ts',
                style: TextStyle(
                    color: const Color(0xff92A5C6),
                    fontSize: responsive.inchR(1.6),
                    fontWeight: FontWeight.w400)),
          ],
        ));
  }
}

class UserPhoto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: responsive.inchR(3)),
      child: CircleAvatar(
        radius: responsive.inchR(3.3),
        backgroundColor: const Color(0xffADE6FE),
        child: CircleAvatar(
          radius: responsive.inchR(3.0),
          backgroundColor: const Color(0xffFFFFFF),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(responsive.inchR(10)),
            child: CircleAvatar(
              radius: responsive.inchR(2.7),
              child: const Image(
                image: AssetImage('assets/canvas/images/img_person_1.jpg'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
