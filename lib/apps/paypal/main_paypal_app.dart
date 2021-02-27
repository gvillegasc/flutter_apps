import 'package:flutter/material.dart';
import 'package:flutter_ui_app/apps/paypal/pages/login_page/login_page.dart';
import 'package:flutter_ui_app/apps/paypal/providers/navigation_provider.dart';
import 'package:provider/provider.dart';

class MainPayPalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => new NavigationProviderPp(),
        ),
      ],
      child: MaterialApp(
        title: 'PayPal App',
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
      ),
    );
  }
}
