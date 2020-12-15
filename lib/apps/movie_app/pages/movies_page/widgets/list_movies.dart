import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui_app/apps/movie_app/pages/detail_movie_page.dart/detail_movie_page.dart';
import 'package:flutter_ui_app/global/responsive.dart';
import 'package:google_fonts/google_fonts.dart';

class ListMovies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    return CarouselSlider(
        options: CarouselOptions(
          viewportFraction: 0.75,
          height: responsive.inchR(55),
        ),
        items: [
          Movie(
            url:
                "https://image.tmdb.org/t/p/w500/6OeGqp18oZucUGziMIRNhLouZ75.jpg",
            name: "The Dalton Gang",
            points: 9.5,
          ),
          Movie(
            url:
                "https://image.tmdb.org/t/p/w500/w85cLr1btxfTExmch6L1vKMH0ti.jpg",
            name: "Matar a Santa",
            points: 7.5,
          ),
          Movie(
            url:
                "https://image.tmdb.org/t/p/w500/x7Dc6FTBYOfwMDEHSGW6EOitidk.jpg",
            name: "Mercenarios de Élite",
            points: 9.0,
          )
        ]);
  }
}

class Movie extends StatelessWidget {
  final String url;
  final String name;
  final double points;

  const Movie(
      {Key key, @required this.url, @required this.name, @required this.points})
      : assert(url != null, name != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Column(
      children: [
        GestureDetector(
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (_) => DetailMoviePage())),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(responsive.inchR(3)),
              boxShadow: [
                BoxShadow(
                  color: Colors.blueGrey.withOpacity(0.35),
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: Offset(0, 9), // changes position of shadow
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(responsive.inchR(3)),
              child: CachedNetworkImage(
                height: responsive.inchR(45),
                width: responsive.inchR(30),
                imageUrl: this.url,
              ),
            ),
          ),
        ),
        SizedBox(height: responsive.inchR(3)),
        Column(
          children: <Widget>[
            Text(
              this.name,
              style: GoogleFonts.openSans(
                  color: Color(0xff12153D),
                  fontSize: responsive.inchR(2.6),
                  fontWeight: FontWeight.w600),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(
                  "assets/movie_app/icons/ic_star.svg",
                  height: responsive.inchR(2),
                ),
                SizedBox(width: responsive.inchR(0.5)),
                Text(
                  "${this.points}",
                  style: GoogleFonts.openSans(
                      color: Color(0xff12153D),
                      fontSize: responsive.inchR(1.8),
                      fontWeight: FontWeight.w600),
                )
              ],
            )
          ],
        )
      ],
    );
  }
}
