import 'package:flutter/material.dart';
import 'package:flutter_ui_app/global/responsive.dart';

class PopularSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return SliverToBoxAdapter(
      child: Container(
        width: double.infinity,
        height: responsive.inchR(28),
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: responsive.inchR(2)),
              height: responsive.inchR(6),
              child: Text(
                "Popular Workout",
                style: TextStyle(
                    color: Color(0xffFFFFFF),
                    fontSize: responsive.inchR(2.8),
                    fontWeight: FontWeight.w800),
              ),
            ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                padding:
                    EdgeInsets.symmetric(horizontal: responsive.inchR(1.25)),
                children: <Widget>[
                  PopularItem(
                      image: "assets/workout_app/images/img_popular_1.png",
                      name: "Yoga exercises"),
                  PopularItem(
                      image: "assets/workout_app/images/img_popular_2.png",
                      name: "Example exercises"),
                  PopularItem(
                      image: "assets/workout_app/images/img_popular_3.png",
                      name: "Example exercises"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PopularItem extends StatelessWidget {
  final String image;
  final String name;

  const PopularItem({Key key, @required this.image, @required this.name})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: responsive.inchR(0.75)),
      child: Column(
        children: <Widget>[
          Container(
            height: responsive.inchR(19),
            width: responsive.inchR(16),
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(this.image),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(responsive.inchR(2))),
          ),
          Expanded(
              child: Container(
            alignment: Alignment.center,
            child: Text(
              this.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: Color(0xffFFFFFFF),
                  fontWeight: FontWeight.w400,
                  fontSize: responsive.inchR(1.37)),
            ),
          ))
        ],
      ),
    );
  }
}
