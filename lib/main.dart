import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui_app/apps/movie_app/pages/movies_page/movies_page.dart';
import 'package:flutter_ui_app/global/responsive.dart';
import 'package:flutter_ui_app/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return MaterialApp(
      title: 'Flutter UI',
      routes: routesApp,
      debugShowCheckedModeBanner: false,
      home: Menu(),
    );
  }
}

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter UI'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(width: responsive.width),
          RaisedButton(
            child: Text("Movie app"),
            onPressed: () => Navigator.pushNamed(context, MoviesPage.routeName),
          )
        ],
      ),
    );
  }
}
