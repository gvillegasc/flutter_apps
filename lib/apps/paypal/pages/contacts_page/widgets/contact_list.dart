import 'package:flutter/material.dart';
import 'package:flutter_ui_app/apps/paypal/models/contact_item.dart';
import 'package:flutter_ui_app/apps/paypal/pages/send_money_page/send_money_page.dart';
import 'package:flutter_ui_app/global/responsive.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactList extends StatelessWidget {
  final List<ContactItem> contacts = [
    ContactItem(name: 'Andrew Dillan', email: 'andrew.dillan@gmail.com'),
    ContactItem(name: 'Alex Millton', email: 'alxmillton@yahoo.com'),
    ContactItem(name: 'Don Norman', email: '@donnorman'),
    ContactItem(name: 'Jason Craig', email: '@jcraig90'),
    ContactItem(name: 'Mike Rain', email: 'mikerine@gmail.com'),
    ContactItem(name: 'Nick Aeron', email: 'areonn@mgmail.com'),
    ContactItem(name: 'Vena Sunny', email: '@venasunny'),
    ContactItem(name: 'Zack Dalton', email: '@zdalto'),
  ];
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return SliverPadding(
      padding: EdgeInsets.only(
          bottom: responsive.inchR(8),
          left: responsive.widthR(7.5),
          right: responsive.widthR(7.5)),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
            (_, i) => _Contact(contact: contacts[i]),
            childCount: contacts.length),
      ),
    );
  }
}

class _Contact extends StatelessWidget {
  const _Contact({Key key, @required this.contact}) : super(key: key);

  final ContactItem contact;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);

    return GestureDetector(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (_) => SendMoneyPage(contact: contact))),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: responsive.inchR(.5)),
        height: responsive.inchR(8),
        width: double.infinity,
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
              padding: EdgeInsets.all(responsive.inchR(1.4)),
              child: Container(
                decoration: BoxDecoration(
                    color: const Color(0xffF5F7FA),
                    borderRadius: BorderRadius.circular(responsive.inchR(2.2))),
                child: Center(
                    child: Text(
                  contact.name[0],
                  style: GoogleFonts.manrope(
                      color: const Color(0xff243656),
                      fontWeight: FontWeight.w700,
                      fontSize: responsive.inchR(1.9)),
                )),
              )),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(contact.name,
                  style: GoogleFonts.manrope(
                      color: const Color(0xff243656),
                      fontSize: responsive.inchR(2),
                      fontWeight: FontWeight.w500)),
              Text(contact.email,
                  style: GoogleFonts.manrope(
                      color: const Color(0xff919BAA),
                      fontSize: responsive.inchR(1.6),
                      fontWeight: FontWeight.w400))
            ],
          ))
        ]),
      ),
    );
  }
}
