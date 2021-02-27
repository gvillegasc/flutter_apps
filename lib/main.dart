import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui_app/apps/dialog_flow/main_dialog_flow.dart';
import 'package:flutter_ui_app/apps/movie_app/main_movie_app.dart';
import 'package:flutter_ui_app/apps/paypal/main_paypal_app.dart';
import 'package:flutter_ui_app/apps/workout_app/main_workout_app.dart';
import 'package:flutter_ui_app/apps/canvas/main_canvas.dart';
import 'package:flutter_ui_app/global/responsive.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      title: 'Flutter UI',
      debugShowCheckedModeBanner: false,
      home: MenuApps(),
    );
  }
}

class MenuApps extends StatelessWidget {
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
            onPressed: () => _onPressed(context, MainMovieApp()),
          ),
          RaisedButton(
            child: Text("Canvas"),
            onPressed: () => _onPressed(context, MainCanvas()),
          ),
          RaisedButton(
            child: Text("Workout"),
            onPressed: () => _onPressed(context, MainWorkoutApp()),
          ),
          RaisedButton(
            child: Text("Dialog Flow"),
            onPressed: () => _onPressed(context, MainDialogFlow()),
          ),
          RaisedButton(
            child: Text("PayPal"),
            onPressed: () => _onPressed(context, MainPayPalApp()),
          )
        ],
      ),
    );
  }
}

void _onPressed(BuildContext context, Widget child) {
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (_) => child),
  );
}
