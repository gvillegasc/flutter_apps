import 'package:flutter/material.dart';
import 'package:flutter_ui_app/global/responsive.dart';
import 'widgets.dart';

class DetailMovie extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Positioned(
      bottom: 0,
      child: SizedBox(
        width: responsive.width,
        height: responsive.heightR(55),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: responsive.inchR(3)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[TitleMovie(), AddButton()],
              ),
            ),
            SizedBox(height: responsive.heightR(1)),
            CategoriesMovie(),
            SizedBox(height: responsive.heightR(2.5)),
            const SubtitleDetail(subtitle: 'Plot Summary'),
            SizedBox(height: responsive.heightR(1)),
            DescriptionMovie(),
            SizedBox(height: responsive.heightR(2.5)),
            const SubtitleDetail(subtitle: 'Cast & Crew'),
            SizedBox(
              height: responsive.heightR(1),
            ),
            ListCast()
          ],
        ),
      ),
    );
  }
}
