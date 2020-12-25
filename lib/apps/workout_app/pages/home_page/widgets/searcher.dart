import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui_app/global/responsive.dart';

class Searcher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Container(
      height: responsive.inchR(13),
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: responsive.inchR(3)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    "Find ",
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Color(
                          0xff40D876,
                        ),
                        fontSize: responsive.inchR(3)),
                  ),
                  Text(
                    "your Workout",
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Color(
                          0xffFFFFFF,
                        ),
                        fontSize: responsive.inchR(3)),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(right: responsive.inchR(2.5)),
                child: SvgPicture.asset(
                  "assets/workout_app/icons/ic_filter.svg",
                  height: responsive.inchR(2.2),
                ),
              )
            ],
          ),
          SizedBox(
            height: responsive.inchR(3),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: responsive.inchR(1)),
            alignment: Alignment.center,
            height: responsive.inchR(6),
            decoration: BoxDecoration(
                color: Color(0xff232441),
                borderRadius: BorderRadius.circular(responsive.inchR(5))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: responsive.inchR(5),
                  width: responsive.widthR(60),
                  padding: EdgeInsets.only(left: responsive.inchR(3)),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "SEARCH WORKOUT",
                    style: TextStyle(
                        color: Color(0xffFFFFFF),
                        letterSpacing: 1.3,
                        fontSize: responsive.inchR(1.4)),
                  ),
                ),
                IconButton(
                    icon: SvgPicture.asset(
                      "assets/workout_app/icons/ic_search.svg",
                      height: responsive.inchR(2),
                    ),
                    onPressed: null)
              ],
            ),
          )
        ],
      ),
    );
  }
}
