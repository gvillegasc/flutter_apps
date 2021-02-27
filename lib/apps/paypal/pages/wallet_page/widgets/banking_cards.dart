import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui_app/global/responsive.dart';
import 'package:google_fonts/google_fonts.dart';

class BankingCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return SliverToBoxAdapter(
      child: Container(
        width: responsive.width,
        padding: EdgeInsets.symmetric(horizontal: responsive.widthR(7)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("My banking cards",
                    style: GoogleFonts.manrope(
                        color: Color(0xff243656).withOpacity(.5),
                        fontWeight: FontWeight.w400,
                        fontSize: responsive.inchR(1.75))),
                Row(
                  children: <Widget>[
                    SvgPicture.asset("assets/paypal/icons/ic_add.svg",
                        height: responsive.inchR(1.5)),
                    SizedBox(
                      width: 2,
                    ),
                    Text("Add",
                        style: GoogleFonts.manrope(
                            color: Color(0xff243656).withOpacity(.5),
                            fontWeight: FontWeight.w400,
                            fontSize: responsive.inchR(1.75))),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: responsive.heightR(2),
            ),
            _CardTile(
              icon: "ic_visa.svg",
              cardName: "Visa",
              cardNumber: "4*** **** ****2 4746",
            ),
            _CardTile(
              icon: "ic_master_card.svg",
              cardName: "MasterCard",
              cardNumber: "4*** **** ****3 2863",
            ),
            _CardTile(
              icon: "ic_visa.svg",
              cardName: "Visa",
              cardNumber: "4*** **** ****2 5054",
            ),
            _CardTile(
              icon: "ic_master_card.svg",
              cardName: "MasterCard",
              cardNumber: "4*** **** ****6 2364",
            ),
            SizedBox(
              height: responsive.inchR(9),
            ),
          ],
        ),
      ),
    );
  }
}

class _CardTile extends StatelessWidget {
  final String icon;
  final String cardName;
  final String cardNumber;

  const _CardTile({Key key, this.icon, this.cardName, this.cardNumber})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    return Container(
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
              offset: Offset(0, 20), // changes position of shadow
            )
          ],
          borderRadius: BorderRadius.circular(responsive.inchR(2))),
      child: Row(children: <Widget>[
        Container(
            width: responsive.inchR(8),
            padding: EdgeInsets.all(responsive.inchR(1.75)),
            height: double.infinity,
            child: SvgPicture.asset(
              "assets/paypal/icons/${this.icon}",
            )),
        Expanded(
            child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(this.cardName,
                  style: GoogleFonts.manrope(
                      color: Color(0xff243656),
                      fontSize: responsive.inchR(2.1),
                      fontWeight: FontWeight.w500)),
              Text(
                this.cardNumber,
                style: GoogleFonts.manrope(
                    color: Color(0xff919BAA),
                    fontSize: responsive.inchR(1.6),
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        )),
      ]),
    );
  }
}
