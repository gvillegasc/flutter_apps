import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ui_app/global/responsive.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int percentaje = 5;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    final safeAreaBottom = MediaQuery.of(context).padding.bottom;
    return Scaffold(
      backgroundColor: const Color(0xff060507),
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (_) {
          _.disallowGlow();
          return true;
        },
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SafeArea(
                bottom: false,
                child: Container(
                  height: 390,
                  width: double.infinity,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        bottom: 0,
                        child: GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => DetailPage(),
                              )),
                          child: Container(
                            height: 390,
                            width: responsive.width,
                            child: SizedBox(
                              width: double.infinity,
                              child: Image(
                                  fit: BoxFit.fitWidth,
                                  image: AssetImage(
                                      'assets/montblanc_app/images/motorcycle_detail.png')),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        child: Container(
                          width: responsive.width,
                          padding: EdgeInsets.only(top: 15),
                          alignment: Alignment.center,
                          child: SvgPicture.asset(
                            'assets/montblanc_app/images/logo.svg',
                            height: 35,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Container(
                          width: responsive.width,
                          alignment: Alignment.center,
                          child: Image(
                            fit: BoxFit.fitWidth,
                            image: AssetImage(
                                'assets/montblanc_app/images/letters.png'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                height: 90,
                width: double.infinity,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    Container(
                        width: 250,
                        height: 80,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Transform.rotate(
                                angle: -math.pi / 2,
                                child: Container(
                                  height: 20,
                                  child: Text("TOP SPEED",
                                      style: GoogleFonts.montserrat(
                                          color:
                                              Color(0xffFFFFFF).withOpacity(.5),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300)),
                                )),
                            Container(
                              height: 75,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text(
                                    "6-SPEED CONSTANT-MESH",
                                    style: GoogleFonts.montserrat(
                                        color: Color(0xffFFFFFF),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  Text(
                                    "169 MPH",
                                    style: GoogleFonts.montserrat(
                                        color: Color(0xffFFFFFF),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    "272 KM/H",
                                    style: GoogleFonts.montserrat(
                                        color: Color(0xffFFFFFF),
                                        fontSize: 11,
                                        fontWeight: FontWeight.w300),
                                  )
                                ],
                              ),
                            ),
                          ],
                        )),
                    Container(
                        width: 250,
                        height: 80,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Transform.rotate(
                                angle: -math.pi / 2,
                                child: Container(
                                  height: 20,
                                  child: Text("POWER",
                                      style: GoogleFonts.montserrat(
                                          color:
                                              Color(0xffFFFFFF).withOpacity(.5),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300)),
                                )),
                            Container(
                              height: 75,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text(
                                    "121 KW",
                                    style: GoogleFonts.montserrat(
                                        color: Color(0xffFFFFFF),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  Text(
                                    "162 HP",
                                    style: GoogleFonts.montserrat(
                                        color: Color(0xffFFFFFF),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    "9.250 RPM",
                                    style: GoogleFonts.montserrat(
                                        color: Color(0xffFFFFFF),
                                        fontSize: 11,
                                        fontWeight: FontWeight.w300),
                                  )
                                ],
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: <Widget>[
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          setState(() {
                            if (percentaje > 0) percentaje--;
                          });
                        },
                        child: Row(children: [
                          Container(
                            width: 10,
                            child: Text('<',
                                style: GoogleFonts.montserrat(
                                    color: Color(0xffFFFFFF),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700)),
                          ),
                          Container(
                            width: 25,
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(horizontal: 15),
                            child: Text('$percentaje',
                                style: GoogleFonts.montserrat(
                                    color: Color(0xffFFFFFF),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700)),
                          ),
                        ]),
                      ),
                      Container(
                        width: responsive.width - 180,
                        height: 2,
                        color: Color(0xffFFFFFF),
                        child: Row(
                          children: [
                            AnimatedContainer(
                              duration: Duration(milliseconds: 250),
                              width: (responsive.width - 180) * percentaje / 10,
                              color: Color(0xffA75B12),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          setState(() {
                            if (percentaje < 10) percentaje++;
                          });
                        },
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: 25,
                              alignment: Alignment.center,
                              margin: EdgeInsets.symmetric(horizontal: 15),
                              child: Text('10',
                                  style: GoogleFonts.montserrat(
                                      color: Color(0xffFFFFFF),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700)),
                            ),
                            Container(
                              width: 10,
                              padding: EdgeInsets.only(right: 20),
                              child: Text('>',
                                  style: GoogleFonts.montserrat(
                                      color: Color(0xffFFFFFF),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700)),
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  margin: EdgeInsets.only(bottom: safeAreaBottom + 20),
                  alignment: Alignment.centerLeft,
                  child: Text(
                      'The bike comes in all black, with a relatively modern appeal. Chrome accents in just the right places make the bike stand out, while the black-on-black satin text on the bike’s fork-guards helps highlight the company’s branding without being too direct or obvious.',
                      style: GoogleFonts.montserrat(
                          fontSize: 12,
                          height: 2,
                          color: Colors.white,
                          fontWeight: FontWeight.w200))),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              bottomRight: Radius.circular(25)),
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Color(0xffA45410), Color(0xffFBEFB7)])),
                      padding: EdgeInsets.all(1.5),
                      child: Container(
                        height: 60,
                        width: 60,
                        child: RaisedButton(
                          color: Color(0xff060507),
                          elevation: 0,
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(25),
                                  bottomRight: Radius.circular(25))),
                          child: Image(
                            height: 15,
                            image: AssetImage(
                              'assets/montblanc_app/icons/heart.png',
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                        height: 63,
                        width: 220,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                bottomRight: Radius.circular(25)),
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Color(0xffA45410),
                                  Color(0xffFBEFB7)
                                ])),
                        padding: EdgeInsets.all(1.5),
                        child: Text(
                          'ADD TO CART',
                          style: GoogleFonts.montserrat(
                              fontSize: 17,
                              color: Color(0xff060507),
                              fontWeight: FontWeight.w900),
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
