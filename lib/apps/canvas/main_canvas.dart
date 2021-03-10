import 'package:flutter/material.dart';
import 'package:flutter_ui_app/apps/canvas/pages/navigation_page/navigation_page.dart';
import 'package:flutter_ui_app/apps/canvas/providers/navigation_provider.dart';
import 'package:provider/provider.dart';

class MainCanvas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => new NavigationProvider(),
        ),
      ],
      child: NavigationPage(),
    );
  }
}
