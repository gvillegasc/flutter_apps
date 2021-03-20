import 'package:flutter/material.dart';
import 'package:flutter_ui_app/apps/movie_app/pages/movies_page/widgets/widgets.dart';
import 'package:flutter_ui_app/global/responsive.dart';

class MoviesPage extends StatelessWidget {
  static const String routeName = 'movies';
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: Column(
        children: <Widget>[
          ToolsBar(),
          SizedBox(
            height: responsive.inchR(0.8),
          ),
          OptionMovie(),
          SizedBox(
            height: responsive.inchR(1.2),
          ),
          CategoriesMovie(),
          SizedBox(
            height: responsive.inchR(3),
          ),
          ListMovies(),
        ],
      ),
    );
  }
}
