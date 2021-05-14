import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui_app/apps/paypal/models/activity_item.dart';
import 'package:flutter_ui_app/apps/paypal/pages/home_page/home_page.dart';
import 'package:flutter_ui_app/global/responsive.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ActivityTile extends StatelessWidget {
  const ActivityTile({Key? key, required this.person}) : super(key: key);

  final Person person;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);

    return GestureDetector(
      onTap: () =>
          Provider.of<HomeProvider>(context, listen: false)..changePage(),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: responsive.inchR(.5)),
        width: double.infinity,
        height: responsive.inchR(8),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.07),
                spreadRadius: -10,
                blurRadius: 20,
                offset: const Offset(0, 20),
              )
            ],
            borderRadius: BorderRadius.circular(responsive.inchR(2))),
        child: Row(children: <Widget>[
          Container(
              width: responsive.inchR(8),
              padding: EdgeInsets.all(responsive.inchR(1.75)),
              height: double.infinity,
              child: SvgPicture.asset(
                'assets/paypal/icons/${person.image}',
              )),
          Expanded(
              child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(person.name,
                    style: GoogleFonts.manrope(
                        color: const Color(0xff243656),
                        fontSize: responsive.inchR(2.1),
                        fontWeight: FontWeight.w500)),
                Text(
                  person.ago,
                  style: GoogleFonts.manrope(
                      color: const Color(0xff919BAA),
                      fontSize: responsive.inchR(1.6),
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          )),
          Container(
            width: responsive.widthR(20),
            height: double.infinity,
            padding: EdgeInsets.only(right: responsive.widthR(2.5)),
            alignment: Alignment.centerRight,
            child: Text(
              '''${person.more ? '+' : '-'}\$${_changeValue(person.total.toString())}''',
              style: GoogleFonts.manrope(
                  color: Color(person.more ? 0xff37D39B : 0xffF47090),
                  fontWeight: FontWeight.w600,
                  fontSize: responsive.inchR(1.75)),
            ),
          )
        ]),
      ),
    );
  }

  String _changeValue(String text) {
    return text.replaceAll(RegExp(r'([.]*0)(?!.*\d)'), '');
  }
}
