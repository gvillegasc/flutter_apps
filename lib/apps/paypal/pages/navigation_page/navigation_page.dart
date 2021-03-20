import 'package:flutter/material.dart';
import 'package:flutter_ui_app/apps/paypal/pages/navigation_page/widgets/widgets.dart';
import 'package:flutter_ui_app/apps/paypal/providers/navigation_provider.dart';
import 'package:flutter_ui_app/global/responsive.dart';
import 'package:provider/provider.dart';

class NavigationPagePayPal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);

    return ChangeNotifierProvider(
      create: (_) => NavigationProviderPp(),
      child: Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          height: responsive.height,
          width: responsive.width,
          child: Stack(
            children: [
              PagesNavigation(),
              BottomNavigator(),
            ],
          ),
        ),
      ),
    );
  }
}
