import 'package:flutter/material.dart';
import 'package:flutter_ui_app/apps/paypal/pages/navigation_page/widgets/widgets.dart';
import 'package:flutter_ui_app/global/responsive.dart';

class NavigationPagePayPal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      body: Container(
        height: responsive.height,
        width: responsive.width,
        child: Stack(
          children: [
            PagesNavigation(),
            BottomNavigator(),
          ],
        ),
      ),
    );
  }
}
