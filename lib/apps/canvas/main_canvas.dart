import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui_app/apps/canvas/pages/navigation_page/navigation_page.dart';
import 'package:flutter_ui_app/apps/canvas/providers/navigation_provider.dart';
import 'package:provider/provider.dart';

class MainCanvas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => new NavigationProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Movie App',
        debugShowCheckedModeBanner: false,
        home: NavigationPage(),
      ),
    );
  }
}
