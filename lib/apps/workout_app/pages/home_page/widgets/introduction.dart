import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui_app/apps/workout_app/pages/home_page/widgets/widgets.dart';
import 'package:flutter_ui_app/global/responsive.dart';

class Introduction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return SliverToBoxAdapter(
        child: Container(
      height: responsive.inchR(50),
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/workout_app/images/img_home_bg.png'))),
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Color(0xff131429), Color(0x7C191B35)])),
        child: Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[UserInfo(), Searcher()],
            ),
            Center(
              child: SvgPicture.asset('assets/workout_app/icons/ic_play.svg'),
            )
          ],
        ),
      ),
    ));
  }
}
