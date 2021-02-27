import 'package:flutter/material.dart';
import 'package:flutter_ui_app/apps/paypal/pages/wallet_page/widgets/widgets.dart';

class WalletPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: CustomScrollView(
          slivers: [Header(), PersonalInfo(), BankingCards()],
        ),
      ),
    );
  }
}
