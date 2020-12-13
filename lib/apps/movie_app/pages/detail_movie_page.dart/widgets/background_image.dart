import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_app/global/responsive.dart';

class BackgroundImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Positioned(
      top: 0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(responsive.inchR(5))),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.35),
              spreadRadius: 1,
              blurRadius: 40,
              offset: Offset(0, 9), // changes position of shadow
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(responsive.inchR(5))),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(responsive.inchR(5)))),
            width: responsive.width,
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl:
                  "https://image.tmdb.org/t/p/w500/ckfwfLkl0CkafTasoRw5FILhZAS.jpg",
            ),
            height: responsive.heightR(33),
          ),
        ),
      ),
    );
  }
}
