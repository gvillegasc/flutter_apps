import 'package:flutter/material.dart';
import 'package:flutter_ui_app/apps/movie_app/widgets/item_category.dart';
import 'package:flutter_ui_app/global/responsive.dart';

class CategoriesMovie extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: responsive.heightR(2)),
      height: responsive.heightR(3.7),
      width: double.infinity,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          ItemCategory(name: "Action"),
          ItemCategory(name: "Comedy"),
          ItemCategory(name: "Drama")
        ],
      ),
    );
  }
}
