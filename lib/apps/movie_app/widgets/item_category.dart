import 'package:flutter/material.dart';
import 'package:flutter_ui_app/global/responsive.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemCategory extends StatelessWidget {
  final String name;

  const ItemCategory({Key key, @required this.name})
      : assert(name != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: responsive.inchR(0.8)),
      padding: EdgeInsets.symmetric(horizontal: responsive.inchR(1.8)),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Color(0xffFFFFFF),
        border: Border.all(
            width: 1.5,
            color: Color(0xffE5E5E5) //                   <--- border width here
            ),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Text(
        this.name,
        style: GoogleFonts.openSans(
            fontWeight: FontWeight.w400,
            color: Color(0xff12153D),
            fontSize: responsive.inchR(1.65)),
      ),
    );
  }
}
