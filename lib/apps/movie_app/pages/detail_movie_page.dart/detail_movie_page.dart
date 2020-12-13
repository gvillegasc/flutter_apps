import 'package:flutter/material.dart';
import 'package:flutter_ui_app/apps/movie_app/pages/detail_movie_page.dart/widgets/widgets.dart';
import 'package:flutter_ui_app/global/responsive.dart';

class DetailMoviePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Scaffold(
      body: Container(
        height: responsive.height,
        width: responsive.width,
        child: Stack(
          children: <Widget>[
            BackgroundImage(),
            InfoMovie(),
            Back(),
            DetailMovie()
          ],
        ),
      ),
    );
  }
}
