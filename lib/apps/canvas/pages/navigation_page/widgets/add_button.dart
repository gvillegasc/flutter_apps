import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui_app/apps/canvas/pages/to_do_page/to_do_page.dart';
import 'package:flutter_ui_app/global/responsive.dart';

class AddButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (_) => ToDoPage())),
      child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xffFFFFFF),
          ),
          height: responsive.inchR(8),
          width: responsive.inchR(8),
          padding: EdgeInsets.all(responsive.inchR(0.5)),
          child: Container(
            padding: EdgeInsets.all(responsive.inchR(2.2)),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xff6EC8F9), Color(0xff3418DB)])),
            child: SvgPicture.asset(
              "assets/canvas/icons/ic_add.svg",
              color: Color(0xffFFFFFF),
            ),
          )),
    );
  }
}
