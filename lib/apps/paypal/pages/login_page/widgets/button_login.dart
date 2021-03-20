import 'package:flutter/material.dart';
import 'package:flutter_ui_app/apps/paypal/pages/navigation_page/navigation_page.dart';
import 'package:flutter_ui_app/global/responsive.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (_) => NavigationPagePayPal())),
      child: Container(
        margin: EdgeInsets.only(
            top: responsive.heightR(5), bottom: responsive.heightR(6)),
        height: responsive.inchR(7.5),
        width: responsive.widthR(75),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xff0070BA), Color(0xff1546A0)]),
            boxShadow: [
              BoxShadow(
                color: const Color(0xff0070BA).withOpacity(0.12),
                spreadRadius: 3,
                blurRadius: 10,
                offset: const Offset(3, 7),
              ),
            ],
            color:const Color(0xff0070BA),
            borderRadius: BorderRadius.circular(responsive.inchR(2.5))),
        child: Text(
          'Login',
          style: GoogleFonts.manrope(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: responsive.inchR(2.2)),
        ),
      ),
    );
  }
}
