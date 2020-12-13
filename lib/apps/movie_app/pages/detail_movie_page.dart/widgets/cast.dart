import 'package:flutter/material.dart';
import 'package:flutter_ui_app/global/responsive.dart';
import 'package:google_fonts/google_fonts.dart';

class Cast extends StatelessWidget {
  final String asset;
  final String name;
  final String position;

  const Cast(
      {Key key,
      @required this.asset,
      @required this.name,
      @required this.position})
      : assert(asset != null, name != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Container(
      width: responsive.inchR(10),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: responsive.heightR(0.6),
          ),
          Image(
            image: AssetImage(this.asset),
            height: responsive.heightR(9),
          ),
          SizedBox(
            height: responsive.heightR(1),
          ),
          Text(
            this.name,
            textAlign: TextAlign.center,
            style: GoogleFonts.openSans(
                fontSize: responsive.inchR(1.6),
                color: Color(0xff12153D),
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: responsive.heightR(0.5),
          ),
          Text(
            this.position,
            textAlign: TextAlign.center,
            style: GoogleFonts.openSans(
                fontSize: responsive.inchR(1.6),
                color: Color(0xff9A9BB2),
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
