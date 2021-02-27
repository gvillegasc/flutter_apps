import 'package:flutter/material.dart';
import 'package:flutter_ui_app/apps/paypal/models/contact_item.dart';
import 'package:flutter_ui_app/apps/paypal/pages/send_money_page/widgets/widgets.dart';
import 'package:flutter_ui_app/apps/paypal/widgets/actions_app_bar.dart';

class SendMoneyPage extends StatelessWidget {
  final ContactItem contact;

  const SendMoneyPage({Key key, @required this.contact}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          physics: NeverScrollableScrollPhysics(),
          slivers: [
            ActionsAppBar(
              title: "SendMoney",
              onPressed: () => Navigator.pop(context),
            ),
            Receiver(contact: contact),
            Calculator()
          ],
        ),
      ),
    );
  }
}
