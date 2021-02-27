import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ui_app/global/responsive.dart';
import 'package:google_fonts/google_fonts.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String inputValue = "120";
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return SliverToBoxAdapter(
        child: Container(
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: responsive.widthR(4)),
            width: responsive.widthR(85),
            height: responsive.heightR(9),
            decoration: BoxDecoration(
                border: Border.all(color: Color(0xff0070BA), width: 2),
                borderRadius: BorderRadius.circular(responsive.inchR(2.5))),
            child: Row(children: <Widget>[
              Text(
                "\$ ",
                style: GoogleFonts.manrope(
                    color: Color(0xff243656),
                    fontSize: responsive.heightR(5.5),
                    height: 1.2,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                inputValue,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.manrope(
                    color: Color(0xff243656),
                    fontSize: responsive.heightR(5.5),
                    height: 1.2,
                    fontWeight: FontWeight.w600),
              )
            ]),
          ),
          SizedBox(
            height: responsive.heightR(2),
          ),
          Container(
            height: responsive.heightR(50),
            width: responsive.widthR(85),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      _CircleButton(
                          value: "1",
                          onTap: () {
                            setState(() {
                              if (inputValue.length <= 7) {
                                inputValue += "1";
                              }
                            });
                          }),
                      _CircleButton(
                          value: "2",
                          onTap: () {
                            setState(() {
                              if (inputValue.length <= 7) {
                                inputValue += "2";
                              }
                            });
                          }),
                      _CircleButton(
                          value: "3",
                          onTap: () {
                            setState(() {
                              if (inputValue.length <= 7) {
                                inputValue += "3";
                              }
                            });
                          }),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      _CircleButton(
                          value: "4",
                          onTap: () {
                            setState(() {
                              if (inputValue.length <= 7) {
                                inputValue += "4";
                              }
                            });
                          }),
                      _CircleButton(
                          value: "5",
                          onTap: () {
                            setState(() {
                              if (inputValue.length <= 7) {
                                inputValue += "5";
                              }
                            });
                          }),
                      _CircleButton(
                          value: "6",
                          onTap: () {
                            if (inputValue.length <= 7) {
                              setState(() {
                                inputValue += "6";
                              });
                            }
                          }),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      _CircleButton(
                          value: "7",
                          onTap: () {
                            setState(() {
                              if (inputValue.length <= 7) {
                                inputValue += "7";
                              }
                            });
                          }),
                      _CircleButton(
                          value: "8",
                          onTap: () {
                            setState(() {
                              if (inputValue.length <= 7) {
                                inputValue += "8";
                              }
                            });
                          }),
                      _CircleButton(
                          value: "9",
                          onTap: () {
                            setState(() {
                              if (inputValue.length <= 7) {
                                inputValue += "9";
                              }
                            });
                          }),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      _CircleButton(
                          value: "0",
                          onTap: () {
                            setState(() {
                              if (inputValue.length <= 7) {
                                inputValue += "0";
                              }
                            });
                          }),
                      _CircleButton(
                          value: ".",
                          onTap: () {
                            setState(() {
                              if (inputValue.length <= 7 &&
                                  !inputValue.contains(".")) {
                                inputValue += ".";
                              }
                            });
                          }),
                      _CircleButton(
                          icon: "ic_delete.svg",
                          onTap: () {
                            setState(() {
                              if (inputValue.length != 0) {
                                inputValue = inputValue.substring(
                                    0, inputValue.length - 1);
                              }
                            });
                          }),
                    ]),
              ],
            ),
          ),
          SafeArea(
            top: false,
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(vertical: responsive.heightR(3)),
              width: responsive.widthR(85),
              height: responsive.heightR(9),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xff0070BA), Color(0xff1546A0)]),
                  borderRadius: BorderRadius.circular(responsive.inchR(2.5))),
              child: Text("Send",
                  style: GoogleFonts.manrope(
                      color: Colors.white,
                      fontSize: responsive.heightR(2.5),
                      fontWeight: FontWeight.w600)),
            ),
          )
        ],
      ),
    ));
  }
}

class _CircleButton extends StatelessWidget {
  final String value;
  final VoidCallback onTap;
  final String icon;

  const _CircleButton({Key key, this.value, @required this.onTap, this.icon})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: -8,
              blurRadius: 10,
              offset: Offset(7, 7), // changes position of shadow
            ),
          ],
        ),
        child: CircleAvatar(
          child: (this.value != null)
              ? Text(this.value,
                  style: GoogleFonts.manrope(
                      color: Color(0xff243656),
                      fontSize: responsive.heightR(3.5),
                      fontWeight: FontWeight.w600))
              : SvgPicture.asset("assets/paypal/icons/${this.icon}"),
          backgroundColor: Colors.white,
          radius: responsive.heightR(5),
        ),
      ),
    );
  }
}
