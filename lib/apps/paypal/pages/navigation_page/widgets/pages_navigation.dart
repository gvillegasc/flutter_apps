import 'package:flutter/material.dart';
import 'package:flutter_ui_app/apps/paypal/pages/contacts_page/contacts_page.dart';
import 'package:flutter_ui_app/apps/paypal/pages/home_page/home_page.dart';
import 'package:flutter_ui_app/apps/paypal/pages/settings_page/settings_page.dart';
import 'package:flutter_ui_app/apps/paypal/pages/wallet_page/wallet_page.dart';
import 'package:flutter_ui_app/apps/paypal/providers/navigation_provider.dart';
import 'package:provider/provider.dart';

class PagesNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProviderPp>(context);
    return PageView(
      controller: navigationProvider.pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        HomePagePaypal(),
        ContactsPage(),
        WalletPage(),
        SettingsPage()
      ],
    );
  }
}
