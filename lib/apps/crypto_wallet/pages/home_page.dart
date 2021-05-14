import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              SafeArea(
                bottom: false,
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: const CircleAvatar(
                        radius: 25,
                        backgroundColor: Color(0xff381840),
                        child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              'assets/canvas/images/img_person_1.jpg'),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Icon(
                      CupertinoIcons.settings_solid,
                      color: Color(0xff381840),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 35, bottom: 18),
                child: Text(
                  'Portfolios',
                  style: GoogleFonts.montserrat(
                      color: const Color(0xff381840),
                      fontSize: 22,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Column(
                children: [
                  _PortfolioCard(
                      title: 'My Portfolio',
                      percentage: 75,
                      percentagePrimaryColor:
                          const Color(0xffFFFFFF).withOpacity(.5),
                      percentageSecondaryColor: const Color(0xff7CC9A3),
                      bgColor: const Color(0xff381840),
                      deposit: '5,100',
                      rate: '12.50',
                      bgWigets: [
                        Positioned(
                            top: -40,
                            right: -50,
                            child: CircleAvatar(
                              radius: 50,
                              backgroundColor:
                                  const Color(0xff4F215A).withOpacity(.9),
                            )),
                        Positioned(
                            top: 25,
                            right: 20,
                            child: CircleAvatar(
                              radius: 22,
                              backgroundColor:
                                  const Color(0xff9E78A8).withOpacity(.9),
                            )),
                      ]),
                  _PortfolioCard(
                      title: 'Carbon',
                      percentage: 20,
                      percentagePrimaryColor: const Color(0xffFDD19D),
                      percentageSecondaryColor:
                          const Color(0xff000000).withOpacity(.15),
                      bgColor: const Color(0xffFF845C),
                      deposit: '2,140',
                      rate: '4.22',
                      bgWigets: [
                        Positioned(
                            top: 10,
                            right: -40,
                            child: Transform.rotate(
                              angle: -pi / 5,
                              child: Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    color: const Color(0xffFE9D75)),
                              ),
                            )),
                        Positioned(
                            top: 40,
                            right: 50,
                            child: Transform.rotate(
                              angle: -pi / 5,
                              child: Container(
                                height: 10,
                                width: 10,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    color: const Color(0xffFE9D75)),
                              ),
                            )),
                        Positioned(
                            top: -10,
                            right: 50,
                            child: Transform.rotate(
                              angle: pi / 10,
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    color: const Color(0xffFF8F66)),
                              ),
                            )),
                      ])
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 35, bottom: 18),
                child: Text(
                  'Transaction',
                  style: GoogleFonts.montserrat(
                      color: const Color(0xff381840),
                      fontSize: 22,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Column(
                children: [
                  const _TransactionCard(
                    title: 'Buy',
                    description: 'BTC',
                    total: '2.40',
                    date: '23 Dec',
                  ),
                  const _TransactionCard(
                    title: 'Sell',
                    description: 'XRP',
                    total: '2.31',
                    date: '21 Dec',
                    plus: false,
                  )
                ],
              ),
              const SafeArea(
                top: false,
                child: SizedBox(
                  height: 30,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _PortfolioCard extends StatelessWidget {
  const _PortfolioCard(
      {Key? key,
      required this.title,
      required this.percentage,
      required this.percentagePrimaryColor,
      required this.percentageSecondaryColor,
      required this.bgColor,
      required this.deposit,
      required this.rate,
      required this.bgWigets})
      : super(key: key);

  final String title;
  final int percentage;
  final Color percentagePrimaryColor;
  final Color percentageSecondaryColor;
  final Color bgColor;
  final String deposit;
  final String rate;
  final List<Widget> bgWigets;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 7),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(40)),
        child: Container(
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
              color: bgColor,
              borderRadius: const BorderRadius.all(Radius.circular(40))),
          child: Stack(
            children: [
              ...bgWigets,
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 70,
                          width: 70,
                          child: Stack(
                            children: [
                              SizedBox(
                                height: double.infinity,
                                width: double.infinity,
                                child: CustomPaint(
                                    painter: _RadialProgress(
                                        percentage,
                                        percentagePrimaryColor,
                                        percentageSecondaryColor,
                                        5)),
                              ),
                              SizedBox(
                                height: double.infinity,
                                width: double.infinity,
                                child: Center(
                                  child: Text(
                                    '$percentage%',
                                    style: GoogleFonts.montserrat(
                                        color: const Color(0xffFFFFFF),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          style: GoogleFonts.montserrat(
                              color: const Color(0xffFFFFFF),
                              fontWeight: FontWeight.w500,
                              fontSize: 17),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Deposit',
                                  style: GoogleFonts.montserrat(
                                      color: const Color(0xffFFFFFF)
                                          .withOpacity(.5),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15),
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  '\$$deposit',
                                  style: GoogleFonts.montserrat(
                                      color: const Color(0xffFFFFFF),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                            const SizedBox(width: 25),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Rate',
                                  style: GoogleFonts.montserrat(
                                      color: const Color(0xffFFFFFF)
                                          .withOpacity(.5),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15),
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  '+$rate%',
                                  style: GoogleFonts.montserrat(
                                      color: const Color(0xffFFFFFF),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _TransactionCard extends StatelessWidget {
  const _TransactionCard(
      {Key? key,
      required this.title,
      required this.description,
      required this.total,
      required this.date,
      this.plus = true})
      : super(key: key);

  final String title;
  final String description;
  final String total;
  final String date;
  final bool plus;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.symmetric(vertical: 7),
      width: double.infinity,
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(top: 2),
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                color: Color(plus ? 0xff7CC9A3 : 0xffED6868).withOpacity(.2),
                borderRadius: BorderRadius.circular(20)),
            child: Transform.rotate(
              angle: -pi / (plus ? -2 : 2),
              child: Icon(
                CupertinoIcons.back,
                size: 25,
                color: Color(plus ? 0xff7CC9A3 : 0xffED6868),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.montserrat(
                        color: const Color(0xff381840),
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(description,
                      style: GoogleFonts.montserrat(
                          color: const Color(0xff000000).withOpacity(.3),
                          fontSize: 14,
                          fontWeight: FontWeight.w400)),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 60,
            width: 60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "${plus ? '+' : '-'}\$$total",
                  style: GoogleFonts.montserrat(
                      color: Color(plus ? 0xff7CC9A3 : 0xffED6868),
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
                Text('$date',
                    style: GoogleFonts.montserrat(
                        color: const Color(0xff000000).withOpacity(.3),
                        fontSize: 14,
                        fontWeight: FontWeight.w400)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _RadialProgress extends CustomPainter {
  _RadialProgress(
    this.percentage,
    this.primaryColor,
    this.secondaryColor,
    this.primaryLine,
  );

  final int percentage;
  final Color primaryColor;
  final Color secondaryColor;
  final double primaryLine;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width * 0.5, size.height / 2);
    final radio = min(size.width * 0.5, size.height * 0.5);

    final paintArco = Paint()
      ..strokeWidth = primaryLine
      ..color = primaryColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final paintArco2 = Paint()
      ..strokeWidth = primaryLine
      ..color = secondaryColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final arcAngle = 2 * pi * (percentage / 100);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radio), -pi / 2,
        arcAngle, false, paintArco);

    final arcAngle2 =
        -(2 * pi * ((93 - ((percentage == 100 ? 93 : percentage))) / 100));

    canvas.drawArc(Rect.fromCircle(center: center, radius: radio), -pi / 1.75,
        arcAngle2, false, paintArco2);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
