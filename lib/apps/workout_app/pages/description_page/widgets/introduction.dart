import 'package:flutter/material.dart';
import 'package:flutter_ui_app/apps/workout_app/pages/description_page/widgets/widgets.dart';
import 'package:flutter_ui_app/global/responsive.dart';

class Introduction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Container(
      height: responsive.heightR(50),
      width: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/workout_app/images/img_advance_bg.png'),
              fit: BoxFit.cover)),
      child: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Color(0xff131429), Color(0x46131429)])),
          ),
          ActionsNavigation(),
          InfoDescription()
        ],
      ),
    );
  }
}
