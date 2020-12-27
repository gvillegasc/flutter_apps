import 'package:flutter/material.dart';
import 'package:flutter_ui_app/apps/workout_app/pages/description_page/widgets/widgets.dart';
import 'package:flutter_ui_app/global/responsive.dart';

class DescriptionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Scaffold(
      backgroundColor: Color(0xff131429),
      body: Container(
        height: responsive.height,
        width: responsive.width,
        child: Stack(
          children: <Widget>[Introduction(), Description()],
        ),
      ),
    );
  }
}
