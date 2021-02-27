import 'package:flutter/material.dart';
import 'package:flutter_ui_app/apps/movie_app/pages/movies_page/movies_page.dart';

class MainMovieApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      debugShowCheckedModeBanner: false,
      home: MoviesPage(),
    );
  }
}
