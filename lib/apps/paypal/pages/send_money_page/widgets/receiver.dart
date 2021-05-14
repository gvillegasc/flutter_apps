import 'package:flutter/material.dart';
import 'package:flutter_ui_app/apps/paypal/models/contact_item.dart';
import 'package:flutter_ui_app/global/responsive.dart';
import 'package:google_fonts/google_fonts.dart';

class Receiver extends StatelessWidget {
  const Receiver({Key? key, required this.contact}) : super(key: key);

  final ContactItem contact;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: responsive.widthR(7)),
        height: responsive.heightR(10),
        margin: EdgeInsets.only(bottom: responsive.heightR(3)),
        width: responsive.width,
        child: Row(
          children: <Widget>[
            Container(
              height: responsive.heightR(8),
              width: responsive.heightR(8),
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                  color: const Color(0xffF5F7FA),
                  borderRadius: BorderRadius.circular(responsive.heightR(3))),
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.circular(responsive.heightR(3) - 2)),
                child: Container(
                    decoration: BoxDecoration(
                        color: const Color(0xffF5F7FA),
                        borderRadius:
                            BorderRadius.circular(responsive.heightR(3) - 4)),
                    child: Center(
                        child: Text(
                      contact.name[0],
                      style: GoogleFonts.manrope(
                          color: const Color(0xff243656),
                          fontWeight: FontWeight.w700,
                          fontSize: responsive.heightR(2.5)),
                    ))),
              ),
            ),
            SizedBox(
              width: responsive.widthR(4),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: responsive.heightR(1)),
                Text(
                  'To:',
                  style: GoogleFonts.manrope(
                      color: const Color(0xff243656).withOpacity(.5),
                      fontWeight: FontWeight.w500,
                      fontSize: responsive.heightR(1.8)),
                ),
                Text(
                  contact.name,
                  style: GoogleFonts.manrope(
                      color: const Color(0xff243656),
                      fontWeight: FontWeight.w500,
                      fontSize: responsive.heightR(2.3)),
                ),
                Text(
                  contact.email,
                  style: GoogleFonts.manrope(
                      height: responsive.heightR(.13),
                      color: const Color(0xff243656).withOpacity(.5),
                      fontWeight: FontWeight.w500,
                      fontSize: responsive.heightR(1.8)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
