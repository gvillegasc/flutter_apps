import 'package:flutter/material.dart';
import 'package:flutter_ui_app/apps/movie_app/pages/movies_page/widgets/widgets.dart';
import 'package:flutter_ui_app/global/responsive.dart';

class MoviesPage extends StatelessWidget {
  static final String routeName = "movies";
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
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
