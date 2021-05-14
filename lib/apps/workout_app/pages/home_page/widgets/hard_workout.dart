import 'package:flutter/material.dart';
import 'package:flutter_ui_app/apps/workout_app/pages/description_page/description_page.dart';
import 'package:flutter_ui_app/global/responsive.dart';

class HardSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return SliverToBoxAdapter(
      child: SizedBox(
        width: double.infinity,
        height: responsive.inchR(28),
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: responsive.inchR(2)),
              height: responsive.inchR(6),
              child: Text(
                'Hard Workout',
                style: TextStyle(
                    color: const Color(0xffFFFFFF),
                    fontSize: responsive.inchR(2.8),
                    fontWeight: FontWeight.w800),
              ),
            ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding:
                    EdgeInsets.symmetric(horizontal: responsive.inchR(1.25)),
                children: <Widget>[
                  const HardItem(
                      image: 'img_popular_1.png', name: 'Yoga exercises'),
                  const HardItem(
                      image: 'img_popular_2.png', name: 'Example exercises'),
                  const HardItem(
                      image: 'img_popular_3.png', name: 'Example exercises'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class HardItem extends StatelessWidget {
  const HardItem({Key? key, required this.image, required this.name})
      : super(key: key);

  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: responsive.inchR(0.75)),
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => DescriptionPage())),
            child: Container(
              height: responsive.inchR(19),
              width: responsive.inchR(16),
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/workout_app/images/$image'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(responsive.inchR(2))),
            ),
          ),
          Expanded(
              child: Container(
            alignment: Alignment.center,
            child: Text(
              name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: const Color(0xffFFFFFFF),
                  fontWeight: FontWeight.w400,
                  fontSize: responsive.inchR(1.37)),
            ),
          ))
        ],
      ),
    );
  }
}
