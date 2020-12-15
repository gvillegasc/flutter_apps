import 'package:flutter/material.dart';
import 'package:flutter_ui_app/apps/canvas/pages/navigation_page/widgets/widgets.dart';
import 'package:flutter_ui_app/global/responsive.dart';

class BottomNavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      child: BottomAppBar(
        notchMargin: 10,
        elevation: 2,
        child: Container(
          height: responsive.inchR(7),
          margin: EdgeInsets.only(
              left: responsive.inchR(1), right: responsive.inchR(1)),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ItemNavbar(value: 0, icon: 'ic_home.svg', name: "Inicio"),
              ItemNavbar(value: 1, icon: 'ic_canvas.svg', name: "Canvas"),
              SizedBox(
                width: responsive.widthR(30),
              ),
              ItemNavbar(value: 2, icon: 'ic_courses.svg', name: "Cursos"),
              ItemNavbar(value: 3, icon: "ic_profile.svg", name: "Perfil"),
            ],
          ),
        ),
        // clipBehavior: Clip.antiAlias,
        shape: CircularNotchedRectangle(),
        color: Colors.white,
      ),
    );
  }
}
