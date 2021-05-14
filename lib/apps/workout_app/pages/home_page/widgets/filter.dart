import 'package:flutter/material.dart';
import 'package:flutter_ui_app/global/responsive.dart';

class Filter extends StatefulWidget {
  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  int filterSelected = 1;
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.only(
            top: responsive.inchR(3), bottom: responsive.inchR(2)),
        width: double.infinity,
        height: responsive.inchR(5),
        alignment: Alignment.center,
        child: ListView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: responsive.inchR(2)),
          children: <Widget>[
            FilterItem(
                name: 'Popular',
                filterSelected: filterSelected,
                value: 1,
                onTap: () => selectFilter(1)),
            FilterItem(
                name: 'Hard workout',
                filterSelected: filterSelected,
                value: 2,
                onTap: () => selectFilter(2)),
            FilterItem(
                name: 'Full body',
                filterSelected: filterSelected,
                value: 3,
                onTap: () => selectFilter(3)),
            FilterItem(
                name: 'Crossfit',
                filterSelected: filterSelected,
                value: 4,
                onTap: () => selectFilter(4)),
          ],
        ),
      ),
    );
  }

  void selectFilter(int value) {
    setState(() {
      filterSelected = value;
    });
  }
}

class FilterItem extends StatelessWidget {
  const FilterItem(
      {Key? key,
      required this.name,
      required this.filterSelected,
      required this.value,
      required this.onTap})
      : super(key: key);

  final String name;
  final int filterSelected;
  final int value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Container(
      alignment: Alignment.center,
      child: SizedBox(
          height: responsive.inchR(3.2),
          child: GestureDetector(
            onTap: onTap,
            child: Container(
                padding:
                    EdgeInsets.symmetric(horizontal: responsive.inchR(2.5)),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(responsive.inchR(2.5)),
                  border: Border.all(
                    color: (filterSelected == value)
                        ? const Color(0xff40D876)
                        : Colors.transparent,
                    style: BorderStyle.solid,
                    width: 1.0,
                  ),
                ),
                child: Text(
                  name,
                  style: TextStyle(
                      color: const Color(0xffFFFFFF),
                      fontWeight: FontWeight.w400,
                      fontSize: responsive.inchR(1.6)),
                )),
          )),
    );
  }
}
