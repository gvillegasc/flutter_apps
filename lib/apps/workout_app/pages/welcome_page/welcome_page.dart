import 'package:flutter/material.dart';
import 'package:flutter_ui_app/apps/workout_app/pages/about_page/about_page.dart';
import 'package:flutter_ui_app/apps/workout_app/widgets/title_hard_element.dart';
import 'package:flutter_ui_app/global/responsive.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Scaffold(
      body: Container(
        height: responsive.height,
        width: responsive.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/workout_app/images/img_welcome_bg.png'),
          fit: BoxFit.cover,
        )),
        child: Container(
          color: const Color(0xB40E1B3F),
          child: Stack(
            children: <Widget>[
              Positioned(
                top: responsive.inchR(8),
                child: TitleHardElement(),
              ),
              Welcome(),
              Buttons()
            ],
          ),
        ),
      ),
    );
  }
}

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Positioned(
      top: responsive.heightR(45),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: responsive.inchR(3)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Welcome',
              style: GoogleFonts.roboto(
                  color: const Color(0xffFFFFFF),
                  fontSize: responsive.inchR(5),
                  fontWeight: FontWeight.w700),
            ),
            Text(
              'train and live the new experience of \nexercising at home',
              style: TextStyle(
                  color: const Color(0xffFFFFFF),
                  fontSize: responsive.inchR(1.6),
                  fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
    );
  }
}

class Buttons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Positioned(
      bottom: 0,
      child: SizedBox(
        width: responsive.width,
        child: Column(
          children: <Widget>[
            FlatButton(
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (_) => AboutPage())),
              color: const Color(0xff40D876),
              child: Text(
                'Try Now',
                style: GoogleFonts.roboto(
                    color: const Color(0xffFFFFFF),
                    fontSize: responsive.inchR(2.1)),
              ),
              height: responsive.inchR(6),
              minWidth: responsive.inchR(38),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
            ),
            SizedBox(
              height: responsive.inchR(2),
            ),
            ButtonTheme(
              height: responsive.inchR(6),
              minWidth: responsive.inchR(38),
              child: OutlineButton(
                  highlightedBorderColor: const Color(0xffFFFFFF),
                  child: Text(
                    'Login',
                    style: GoogleFonts.roboto(
                        color: const Color(0xffFFFFFF),
                        fontSize: responsive.inchR(2.1)),
                  ),
                  onPressed: () {},
                  borderSide: const BorderSide(
                    color: Colors.white,
                    style: BorderStyle.solid,
                    width: 1.8,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0))),
            ),
            SizedBox(
              height: responsive.inchR(6),
            ),
            Text('Change language',
                style: GoogleFonts.roboto(
                    color: const Color(0xff40D876),
                    fontSize: responsive.inchR(1.5))),
            SizedBox(
              height: responsive.inchR(3),
            ),
          ],
        ),
      ),
    );
  }
}
