import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_ui_app/global/responsive.dart';

class OptionMovie extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Container(
      height: responsive.inchR(7),
      width: responsive.width,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          SizedBox(width: responsive.inchR(1.1)),
          OptionSelected(
            name: "In Theater",
            selected: true,
          ),
          OptionSelected(
            name: "Box Office",
            selected: false,
          ),
          OptionSelected(
            name: "Coming Soon",
            selected: false,
          )
        ],
      ),
    );
  }
}

class OptionSelected extends StatelessWidget {
  final String name;
  final bool selected;

  const OptionSelected({Key key, @required this.name, @required this.selected})
      : assert(name != null, selected != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: responsive.inchR(1.7)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            this.name,
            style: GoogleFonts.openSans(
                fontWeight: FontWeight.w600,
                fontSize: responsive.inchR(2.8),
                color: (this.selected) ? Color(0xff12153D) : Color(0xffE5E5E5)),
          ),
          SizedBox(height: responsive.inchR(1)),
          SizedBox(
            height: 4,
            width: responsive.inchR(4),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: (this.selected) ? Color(0xffFE6D8E) : Color(0xffFFFFFF),
              ),
              alignment: Alignment.bottomLeft,
            ),
          )
        ],
      ),
    );
  }
}
