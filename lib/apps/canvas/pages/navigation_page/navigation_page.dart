import 'package:flutter/material.dart';
import 'package:flutter_ui_app/apps/canvas/pages/navigation_page/widgets/widgets.dart';
import 'package:flutter_ui_app/main.dart';

class NavigationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => MenuApps()));
        return true;
      },
      child: Scaffold(
        extendBody: true,
        resizeToAvoidBottomPadding: false,
        body: PagesNavigation(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: AddButton(),
        bottomNavigationBar: BottomNavbar(),
      ),
    );
  }
}
