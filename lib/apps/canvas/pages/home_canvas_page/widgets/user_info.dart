import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui_app/global/responsive.dart';

class UserInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return SliverToBoxAdapter(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: responsive.inchR(8)),
        height: responsive.inchR(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[UserPhoto(), UserName(), Search()],
        ),
      ),
    );
  }
}

class UserName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Container(
        width: responsive.widthR(50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  "Hola,",
                  style: TextStyle(
                      color: Color(0xff223E6D),
                      fontSize: responsive.inchR(1.8),
                      fontWeight: FontWeight.w700),
                ),
                Text(" Diana Lucia",
                    style: TextStyle(
                        color: Color(0xff223E6D),
                        fontSize: responsive.inchR(1.8),
                        fontWeight: FontWeight.w400)),
              ],
            ),
            Text("Sigue cumpliendo tus metas",
                style: TextStyle(
                    color: Color(0xff92A5C6),
                    fontSize: responsive.inchR(1.6),
                    fontWeight: FontWeight.w400)),
          ],
        ));
  }
}

class UserPhoto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return CircleAvatar(
      radius: responsive.inchR(4.0),
      backgroundColor: Color(0xffADE6FE),
      child: CircleAvatar(
        radius: responsive.inchR(3.7),
        backgroundColor: Color(0xffFFFFFF),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(responsive.inchR(10)),
          child: CircleAvatar(
            radius: responsive.inchR(3.3),
            child: Image(
              image: AssetImage("assets/canvas/images/img_person_1.jpg"),
            ),
          ),
        ),
      ),
    );
  }
}

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Container(
        child: IconButton(
      icon: SvgPicture.asset(
        "assets/canvas/icons/ic_search.svg",
        height: responsive.inchR(2),
      ),
      onPressed: () {},
    ));
  }
}
