import 'package:flutter/material.dart';
import 'package:flutter_ui_app/apps/workout_app/pages/description_page/widgets/widgets.dart';
import 'package:flutter_ui_app/global/responsive.dart';

class DescriptionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Scaffold(
      backgroundColor: const Color(0xff131429),
      body: SizedBox(
        height: responsive.height,
        width: responsive.width,
        child: Stack(
          children: <Widget>[Introduction(), Description()],
        ),
      ),
    );
  }
}
