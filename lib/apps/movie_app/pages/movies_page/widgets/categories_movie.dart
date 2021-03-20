import 'package:flutter/material.dart';
import 'package:flutter_ui_app/apps/movie_app/widgets/item_category.dart';
import 'package:flutter_ui_app/global/responsive.dart';

class CategoriesMovie extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Container(
      height: responsive.inchR(7),
      width: responsive.width,
      padding: EdgeInsets.symmetric(vertical: responsive.inchR(1.7)),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          SizedBox(width: responsive.inchR(2)),
          const ItemCategory(name: 'Action'),
          const ItemCategory(name: 'Crime'),
          const ItemCategory(name: 'Comedy'),
          const ItemCategory(name: 'Drama'),
          const ItemCategory(name: 'Terror'),
        ],
      ),
    );
  }
}
