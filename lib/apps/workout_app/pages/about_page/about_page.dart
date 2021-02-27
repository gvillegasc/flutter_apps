import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui_app/apps/workout_app/pages/home_page/home_page.dart';
import 'package:flutter_ui_app/apps/workout_app/widgets/title_hard_element.dart';
import 'package:flutter_ui_app/global/responsive.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Scaffold(
      body: Container(
        height: responsive.height,
        width: responsive.width,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/workout_app/images/img_about_bg.png"),
          fit: BoxFit.cover,
        )),
        child: Container(
          color: Color(0xB40E1B3F),
          child: Stack(
            children: <Widget>[
              Positioned(
                top: responsive.inchR(8),
                child: TitleHardElement(),
              ),
              About(),
              Actions()
            ],
          ),
        ),
      ),
    );
  }
}

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Positioned(
      top: responsive.heightR(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: responsive.inchR(4)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "About You",
                  style: GoogleFonts.roboto(
                      color: Color(0xffFFFFFF),
                      fontSize: responsive.inchR(4.5),
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  "we want to know more about you, follow the next steps \nto complete the information",
                  style: TextStyle(
                      color: Color(0xffFFFFFF),
                      fontSize: responsive.inchR(1.4),
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ),
          SizedBox(
            height: responsive.inchR(2),
          ),
          Container(
              height: responsive.inchR(30),
              width: responsive.width,
              child: ListView(
                padding: EdgeInsets.symmetric(
                    vertical: responsive.inchR(2),
                    horizontal: responsive.inchR(2)),
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Option(
                    selected: true,
                    option: "I am \nInactive",
                    observation: "I have never trained",
                  ),
                  Option(
                    selected: false,
                    option: "I am \nBeginner",
                    observation: "I have trained few times",
                  ),
                ],
              ))
        ],
      ),
    );
  }
}

class Option extends StatelessWidget {
  final bool selected;
  final String option;
  final String observation;

  const Option(
      {Key key,
      @required this.selected,
      @required this.option,
      @required this.observation})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: responsive.inchR(2.5)),
      width: responsive.inchR(22),
      decoration: BoxDecoration(
          color: Color(0xff232441),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 5,
              offset: Offset(2, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(responsive.inchR(1.5))),
      margin: EdgeInsets.symmetric(horizontal: responsive.inchR(2)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            width: double.infinity,
            child: CircleAvatar(
              radius: responsive.inchR(2),
              backgroundColor: Color(0xff373850),
              child: (this.selected)
                  ? SvgPicture.asset(
                      "assets/workout_app/icons/ic_check.svg",
                      height: responsive.inchR(1.3),
                    )
                  : null,
            ),
          ),
          Text(
            this.option,
            style: GoogleFonts.roboto(
                color: Color(0xff40D876),
                fontSize: responsive.inchR(3.7),
                fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: responsive.inchR(1),
          ),
          Text(
            this.observation,
            style: GoogleFonts.roboto(
              color: Color(0xffFFFFFF),
              fontSize: responsive.inchR(1.6),
            ),
          ),
          SizedBox(
            height: responsive.inchR(3),
          ),
        ],
      ),
    );
  }
}

class Actions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Positioned(
      bottom: responsive.inchR(2.5),
      child: Container(
        padding: EdgeInsets.only(
            left: responsive.inchR(3.5), right: responsive.inchR(2.5)),
        width: responsive.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Skip Intro",
              style: TextStyle(
                  color: Color(0xFF776F6F),
                  fontWeight: FontWeight.w400,
                  fontSize: responsive.inchR(1.8)),
            ),
            FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(responsive.inchR(0.5))),
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (_) => HomePage())),
              child: Text(
                "Next",
                style: TextStyle(
                    color: Color(0xffFFFFFF),
                    fontWeight: FontWeight.w400,
                    fontSize: responsive.inchR(1.8)),
              ),
              color: Color(0xff40D876),
              height: responsive.inchR(4.5),
              minWidth: responsive.inchR(15),
            )
          ],
        ),
      ),
    );
  }
}
