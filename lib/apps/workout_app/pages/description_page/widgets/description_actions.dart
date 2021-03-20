import 'package:flutter/material.dart';
import 'package:flutter_ui_app/global/responsive.dart';
import 'package:google_fonts/google_fonts.dart';

class DescriptionActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Expanded(
        child: SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            onPressed: () {},
            color: const Color(0xff40D876),
            child: Text(
              'Begin Train for \$5.00',
              style: GoogleFonts.roboto(
                  color: const Color(0xffFFFFFF),
                  fontSize: responsive.heightR(2.4)),
            ),
            height: responsive.heightR(6.5),
            minWidth: responsive.inchR(38),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(responsive.heightR(0.5))),
          ),
          SizedBox(
            height: responsive.inchR(2),
          ),
          ButtonTheme(
            height: responsive.heightR(6.5),
            minWidth: responsive.inchR(38),
            child: OutlineButton(
                highlightedBorderColor: const Color(0xff40D876),
                child: Text(
                  'Begin Train Demo',
                  style: GoogleFonts.roboto(
                      color: const Color(0xffFFFFFF),
                      fontSize: responsive.heightR(2.4)),
                ),
                onPressed: () {},
                borderSide: const BorderSide(
                  color: Color(0xff40D876),
                  style: BorderStyle.solid,
                  width: 1,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(responsive.heightR(0.5)))),
          ),
        ],
      ),
    ));
  }
}
