import 'package:flutter/material.dart';
import 'package:flutter_ui_app/global/responsive.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemCategory extends StatelessWidget {
  const ItemCategory({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: responsive.inchR(0.8)),
      padding: EdgeInsets.symmetric(horizontal: responsive.inchR(1.8)),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xffFFFFFF),
        border: Border.all(width: 1.5, color: const Color(0xffE5E5E5)),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Text(
        name,
        style: GoogleFonts.openSans(
            fontWeight: FontWeight.w400,
            color: const Color(0xff12153D),
            fontSize: responsive.inchR(1.65)),
      ),
    );
  }
}
