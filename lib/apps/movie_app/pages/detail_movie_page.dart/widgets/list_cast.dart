import 'package:flutter/material.dart';
import 'package:flutter_ui_app/global/responsive.dart';

import 'widgets.dart';

class ListCast extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: responsive.inchR(1)),
      height: responsive.heightR(20),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Cast(
            asset: "assets/movie_app/images/img_actor_1.png",
            name: "James Mangold",
            position: "Director",
          ),
          Cast(
            asset: "assets/movie_app/images/img_actor_2.png",
            name: "Matt \nDamon",
            position: "Carroll",
          ),
          Cast(
            asset: "assets/movie_app/images/img_actor_3.png",
            name: "Christian Bale",
            position: "Ken Miles",
          ),
          Cast(
            asset: "assets/movie_app/images/img_actor_4.png",
            name: "Caitriona Balfe",
            position: "Mollie",
          ),
        ],
      ),
    );
  }
}
