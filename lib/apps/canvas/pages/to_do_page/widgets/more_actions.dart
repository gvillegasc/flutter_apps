import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui_app/global/responsive.dart';

class MoreActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Column(
      children: <Widget>[
        SvgPicture.asset('assets/canvas/icons/ic_calendar.svg'),
        SizedBox(
          height: responsive.heightR(5),
        ),
        Container(
          height: 1,
          width: responsive.widthR(15),
          color: const Color(0xffFFFFFF),
        ),
        SizedBox(
          height: responsive.heightR(4),
        ),
        UserList()
      ],
    );
  }
}

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Container(
      height: responsive.heightR(18),
      alignment: Alignment.center,
      child: Stack(
        children: [
          User(
            distance: responsive.inchR(0),
            image: 'assets/canvas/images/img_person_1.jpg',
          ),
          User(
            distance: responsive.inchR(2.7),
            image: 'assets/canvas/images/img_person_2.jpg',
          ),
          User(
            distance: responsive.inchR(5),
            image: 'assets/canvas/images/img_person_3.jpg',
          ),
          User(
            distance: responsive.inchR(7.5),
            image: 'assets/canvas/images/img_person_4.jpg',
          ),
          Positioned(
            left: responsive.widthR(5),
            top: responsive.inchR(10),
            child: CircleAvatar(
              backgroundColor: const Color(0xffFFFFFF),
              radius: responsive.inchR(2.1),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: CircleAvatar(
                  backgroundColor: const Color(0xff367BE2),
                  radius: responsive.inchR(1.9),
                  child: SvgPicture.asset('assets/canvas/icons/ic_add.svg'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class User extends StatelessWidget {
  const User({Key key, @required this.distance, @required this.image})
      : super(key: key);

  final double distance;
  final String image;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Positioned(
      left: responsive.widthR(5),
      top: distance,
      child: CircleAvatar(
        backgroundColor: const Color(0xffFFFFFF),
        radius: responsive.inchR(2.1),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: CircleAvatar(
            radius: responsive.inchR(1.9),
            child: Image(
              image: AssetImage(image),
            ),
          ),
        ),
      ),
    );
  }
}
