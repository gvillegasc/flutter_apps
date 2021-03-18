import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui_app/apps/button_options/main_button_options.dart';
import 'package:flutter_ui_app/apps/dialog_flow/main_dialog_flow.dart';
import 'package:flutter_ui_app/apps/menu_ui/main_menu_ui.dart';
import 'package:flutter_ui_app/apps/movie_app/main_movie_app.dart';
import 'package:flutter_ui_app/apps/paypal/main_paypal_app.dart';
import 'package:flutter_ui_app/apps/top_menu/main_top_menu.dart';
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
  final List<_AppItem> apps = [
    _AppItem(name: "Movie app", image: "movie_app.png", widget: MainMovieApp()),
    _AppItem(name: "Canvas", image: "canvas_app.png", widget: MainCanvas()),
    _AppItem(
        name: "Workout", image: "workout_app.png", widget: MainWorkoutApp()),
    _AppItem(
        name: "Dialog Flow",
        image: "dialog_flow_app.png",
        widget: MainDialogFlow()),
    _AppItem(name: "PayPal", image: "paypal_app.png", widget: MainPayPalApp()),
    _AppItem(
        name: "Button Options",
        image: "button_options_app.png",
        widget: MainButtonOptions()),
    _AppItem(
        name: "Top Menu", image: "top_menu_app.png", widget: MainTopMenu()),
    _AppItem(name: "Menu UI", image: "menu_ui_app.png", widget: MainMenuUi()),
  ];
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter UI'),
        ),
        body: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 2 / 1.5,
          mainAxisSpacing: 7,
          crossAxisSpacing: 7,
          padding: EdgeInsets.all(10),
          shrinkWrap: true,
          children: List.generate(
              apps.length,
              (i) => GestureDetector(
                    onTap: () => _onPressed(context, apps[i].widget),
                    child: Container(
                      height: responsive.inchR(10),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image:
                                  AssetImage("assets/apps/${apps[i].image}")),
                          borderRadius: BorderRadius.circular(10)),
                      child: Stack(
                        children: [
                          Container(
                            height: double.infinity,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black.withOpacity(.6),
                            ),
                          ),
                          Center(
                            child: Text(
                              apps[i].name,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20),
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
        ));
  }
}

void _onPressed(BuildContext context, Widget child) {
  Navigator.of(context).push(
    MaterialPageRoute(builder: (_) => child),
  );
}

class _AppItem {
  _AppItem({
    @required this.name,
    @required this.image,
    @required this.widget,
  });

  String name;
  String image;
  Widget widget;
}
