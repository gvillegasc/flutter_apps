import 'package:flutter/material.dart';
import 'package:flutter_ui_app/apps/movie_app/pages/movies_page/movies_page.dart';

final Map<String, Widget Function(BuildContext)> routesApp = {
  MoviesPage.routeName: (_) => MoviesPage()
};
