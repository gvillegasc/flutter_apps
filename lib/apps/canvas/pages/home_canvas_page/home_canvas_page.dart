import 'package:flutter/material.dart';
import 'package:flutter_ui_app/apps/canvas/pages/home_canvas_page/widgets/widgets.dart';
import 'package:flutter_ui_app/global/responsive.dart';

class HomeCanvasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: responsive.width,
          height: responsive.height,
          child: CustomScrollView(
            slivers: <Widget>[UserInfo()],
          ),
        ),
      ),
    );
  }
}
