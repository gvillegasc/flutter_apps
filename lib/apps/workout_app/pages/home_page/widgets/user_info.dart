import 'package:flutter/material.dart';
import 'package:flutter_ui_app/global/responsive.dart';

class UserInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Container(
      child: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: responsive.inchR(2)),
          height: responsive.inchR(8),
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: responsive.inchR(3)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    "Hey,",
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Color(
                          0xff40D876,
                        ),
                        fontSize: responsive.inchR(2.8)),
                  ),
                  Text(
                    " Miau",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color(
                          0xffFFFFFF,
                        ),
                        fontSize: responsive.inchR(2.8)),
                  )
                ],
              ),
              CircleAvatar(
                backgroundColor: Color(
                  0xff40D876,
                ),
                radius: responsive.inchR(2.7),
                child: CircleAvatar(
                  radius: responsive.inchR(2.4),
                  backgroundImage:
                      AssetImage("assets/workout_app/images/img_person_1.jpg"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
