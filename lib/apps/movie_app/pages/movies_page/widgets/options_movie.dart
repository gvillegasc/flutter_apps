import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_ui_app/global/responsive.dart';

class OptionMovie extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return SizedBox(
      height: responsive.inchR(7),
      width: responsive.width,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          SizedBox(width: responsive.inchR(1.1)),
          const OptionSelected(
            name: 'In Theater',
            selected: true,
          ),
          const OptionSelected(
            name: 'Box Office',
            selected: false,
          ),
          const OptionSelected(
            name: 'Coming Soon',
            selected: false,
          )
        ],
      ),
    );
  }
}

class OptionSelected extends StatelessWidget {
  const OptionSelected({Key key, @required this.name, @required this.selected})
      : assert(name != null, selected != null),
        super(key: key);

  final String name;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: responsive.inchR(1.7)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            name,
            style: GoogleFonts.openSans(
                fontWeight: FontWeight.w600,
                fontSize: responsive.inchR(2.8),
                color: Color(selected ? 0xff12153D : 0xffE5E5E5)),
          ),
          SizedBox(height: responsive.inchR(1)),
          SizedBox(
            height: 4,
            width: responsive.inchR(4),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color(selected ? 0xffFE6D8E : 0xffFFFFFF),
              ),
              alignment: Alignment.bottomLeft,
            ),
          )
        ],
      ),
    );
  }
}
