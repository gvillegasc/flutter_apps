import 'package:flutter/material.dart';
import 'package:flutter_ui_app/apps/canvas/pages/canvas_page/widgets/widgets.dart';
import 'package:flutter_ui_app/apps/canvas/widgets/space_separation.dart';
import 'package:flutter_ui_app/global/responsive.dart';

class CanvasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Scaffold(
      body: Container(
        width: responsive.width,
        height: responsive.height,
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: <Widget>[
            UserInfo(),
            BoardTitle(),
            BoardList(),
            GroupTitle(),
            GroupList(),
            SpaceSeparation()
          ],
        ),
      ),
    );
  }
}
