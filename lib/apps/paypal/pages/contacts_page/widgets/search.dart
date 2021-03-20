import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ui_app/global/responsive.dart';
import 'package:google_fonts/google_fonts.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return SliverToBoxAdapter(
      child: SizedBox(
        height: responsive.inchR(8),
        width: responsive.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: responsive.widthR(85),
              height: responsive.inchR(6.5),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xffF5F7FA),
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(responsive.inchR(2)),
              ),
              child: Row(
                children: <Widget>[
                  Container(
                    width: responsive.inchR(6.5),
                    padding: EdgeInsets.all(responsive.inchR(1.75)),
                    height: double.infinity,
                    child: SvgPicture.asset(
                      'assets/paypal/icons/ic_search.svg',
                      color: const Color(0xff919CAA),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            border: InputBorder.none,
                            hintText: 'Enter a name or e-mail',
                            hintStyle: GoogleFonts.manrope(
                                color: const Color(0xff919CAA),
                                fontWeight: FontWeight.w500,
                                fontSize: responsive.inchR(1.7)))),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
