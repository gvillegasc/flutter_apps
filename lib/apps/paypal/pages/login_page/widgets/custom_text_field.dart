import 'package:flutter/material.dart';
import 'package:flutter_ui_app/global/responsive.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      required this.hintText,
      this.isPassword = false,
      this.keyboardType = TextInputType.text})
      : super(key: key);

  final String hintText;
  final bool isPassword;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: responsive.inchR(.8)),
      width: responsive.widthR(75),
      child: Container(
        alignment: Alignment.center,
        height: responsive.inchR(7),
        padding: EdgeInsets.symmetric(horizontal: responsive.widthR(5)),
        decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xffF5F7FA),
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(responsive.inchR(2.5))),
        child: TextField(
            textAlign: TextAlign.center,
            keyboardType: keyboardType,
            obscureText: isPassword,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: GoogleFonts.manrope(
                    color: const Color(0xff919CAA),
                    fontSize: responsive.inchR(1.7)))),
      ),
    );
  }
}
