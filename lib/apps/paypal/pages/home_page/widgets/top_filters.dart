import 'package:flutter/material.dart';
import 'package:flutter_ui_app/global/responsive.dart';
import 'package:google_fonts/google_fonts.dart';

class TopFilters extends StatefulWidget {
  @override
  _TopFiltersState createState() => _TopFiltersState();
}

class _TopFiltersState extends State<TopFilters> {
  int filterValue = 1;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return SliverToBoxAdapter(
      child: Container(
        height: responsive.inchR(9),
        width: responsive.width,
        padding: EdgeInsets.symmetric(horizontal: responsive.widthR(6)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: responsive.inchR(6),
              width: responsive.widthR(80),
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                  color: const Color(0xffF5F7FA),
                  borderRadius: BorderRadius.circular(responsive.inchR(1.5))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _filter(
                    1,
                    (responsive.widthR(80) - 8) / 4.5,
                    'All',
                  ),
                  _filter(
                    2,
                    (responsive.widthR(80) - 8) / 2.8,
                    'Income',
                  ),
                  _filter(
                    3,
                    (responsive.widthR(80) - 8) / 2.5,
                    'Outcome',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _filter(int value, double width, String text) {
    final responsive = Responsive.of(context);

    return GestureDetector(
      onTap: () {
        setState(() {
          filterValue = value;
        });
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Color(value == filterValue ? 0xff005EA6 : 0x00FFFFFF),
            borderRadius: BorderRadius.circular(responsive.inchR(1.5))),
        height: responsive.inchR(5.5),
        width: width,
        child: Text(text,
            style: GoogleFonts.manrope(
                color: Color(value == filterValue ? 0xffFFFFFF : 0xff8D97A8),
                fontWeight: FontWeight.w500,
                fontSize: responsive.inchR(1.8))),
      ),
    );
  }
}
