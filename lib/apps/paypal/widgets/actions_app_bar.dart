import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui_app/global/responsive.dart';
import 'package:google_fonts/google_fonts.dart';

class ActionsAppBar extends StatelessWidget {
  final String actionIcon;
  final VoidCallback onPressed;
  final String title;

  const ActionsAppBar(
      {Key key, this.actionIcon, this.onPressed, @required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return SliverToBoxAdapter(
      child: SafeArea(
        bottom: false,
        child: Container(
          height: responsive.inchR(6.5),
          width: responsive.width,
          padding: EdgeInsets.symmetric(horizontal: responsive.widthR(6)),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                    onTap: this.onPressed == null ? () {} : this.onPressed,
                    child: SvgPicture.asset(
                        "assets/paypal/icons/ic_arrow_back.svg")),
                Text(this.title,
                    style: GoogleFonts.manrope(
                        color: Color(0xff243656),
                        fontWeight: FontWeight.w700,
                        fontSize: responsive.inchR(2))),
                this.actionIcon == null
                    ? Container(width: responsive.widthR(5))
                    : SvgPicture.asset("assets/paypal/icons/${this.actionIcon}")
              ]),
        ),
      ),
    );
  }
}
