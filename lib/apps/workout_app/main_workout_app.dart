import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui_app/apps/workout_app/pages/welcome_page/welcome_page.dart';

class MainWorkoutApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ));
    return MaterialApp(
      title: 'Worlouk App',
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}
