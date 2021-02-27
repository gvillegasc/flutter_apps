import 'package:flutter/material.dart';
import 'package:flutter_ui_app/apps/paypal/models/activity_item.dart';
import 'package:flutter_ui_app/apps/paypal/pages/home_page/widgets/activity_tile.dart';
import 'package:flutter_ui_app/global/responsive.dart';
import 'package:google_fonts/google_fonts.dart';

class ActivitiesList extends StatelessWidget {
  final List<ActivityItem> activities = [
    ActivityItem(day: "Today", persons: [
      Person(
          image: "ic_home_item_1.svg",
          name: "Mike Rine",
          ago: "1 minute ago",
          total: 250,
          more: true),
      Person(
          image: "ic_home_item_2.svg",
          name: "Google Drive",
          ago: "2 hours ago",
          total: 138.5,
          more: false),
      Person(
          image: "ic_home_item_3.svg",
          name: "Casey Smith",
          ago: "9 hours ago",
          total: 531,
          more: true)
    ]),
    ActivityItem(day: "Yesterday", persons: [
      Person(
          image: "ic_home_item_4.svg",
          name: "Apple Store",
          ago: "Yesterday at 11:45 AM",
          total: 250,
          more: false),
      Person(
          image: "ic_home_item_5.svg",
          name: "Pizza Delivery",
          ago: "Yesterday at 2:30 PM",
          total: 58.9,
          more: false),
      Person(
          image: "ic_home_item_6.svg",
          name: "Amazon.com",
          ago: "Yesterday at 6:28 PM",
          total: 300,
          more: false),
      Person(
          image: "ic_home_item_4.svg",
          name: "Apple Store",
          ago: "Yesterday at 1:20 PM",
          total: 150.5,
          more: false)
    ])
  ];
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return SliverPadding(
      padding: EdgeInsets.only(bottom: responsive.inchR(8)),
      sliver: SliverList(
          delegate: SliverChildBuilderDelegate(
        (_, i) => _Activity(activity: activities[i]),
        childCount: activities.length,
      )),
    );
  }
}

class _Activity extends StatelessWidget {
  final ActivityItem activity;

  const _Activity({Key key, @required this.activity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    return Padding(
      padding: EdgeInsets.only(
          left: responsive.widthR(6),
          right: responsive.widthR(6),
          bottom: responsive.inchR(3)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: responsive.inchR(1)),
            child: Text(
              activity.day,
              style: GoogleFonts.manrope(
                  color: Color(0xff919BAA), fontSize: responsive.inchR(1.7)),
            ),
          ),
          ..._generateList(activity.persons)
        ],
      ),
    );
  }

  List<ActivityTile> _generateList(List<Person> persons) {
    return List.generate(
        persons.length,
        (i) => ActivityTile(
              person: persons[i],
            ));
  }
}
