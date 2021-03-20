import 'package:flutter/material.dart';
import 'package:flutter_ui_app/apps/canvas/pages/navigation_page/widgets/widgets.dart';
import 'package:flutter_ui_app/global/responsive.dart';

class BottomNavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return ClipRRect(
      borderRadius: const BorderRadius.only(
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
              const ItemNavbar(value: 0, icon: 'ic_home.svg', name: 'Inicio'),
              const ItemNavbar(value: 1, icon: 'ic_canvas.svg', name: 'Canvas'),
              SizedBox(
                width: responsive.widthR(30),
              ),
              const ItemNavbar(
                  value: 2, icon: 'ic_courses.svg', name: 'Cursos'),
              const ItemNavbar(
                  value: 3, icon: 'ic_profile.svg', name: 'Perfil'),
            ],
          ),
        ),
        // clipBehavior: Clip.antiAlias,
        shape: const CircularNotchedRectangle(),
        color: const Color(0xffFFFFFF),
      ),
    );
  }
}
