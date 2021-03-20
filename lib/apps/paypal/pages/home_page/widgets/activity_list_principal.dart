import 'package:flutter/material.dart';
import 'package:flutter_ui_app/apps/paypal/models/activity_item.dart';
import 'package:flutter_ui_app/apps/paypal/pages/home_page/widgets/activity_tile.dart';
import 'package:flutter_ui_app/global/responsive.dart';

class ActivityListPrincipal extends StatelessWidget {
  final List<Person> persons = [
    Person(
        image: 'ic_home_item_1.svg',
        name: 'Mike Rine',
        ago: '1 minute ago',
        total: 250,
        more: true),
    Person(
        image: 'ic_home_item_2.svg',
        name: 'Google Drive',
        ago: '2 hours ago',
        total: 138.5,
        more: false),
    Person(
        image: 'ic_home_item_3.svg',
        name: 'Casey Smith',
        ago: '9 hours ago',
        total: 531,
        more: true),
    Person(
        image: 'ic_home_item_3.svg',
        name: 'Cesar Done',
        ago: '10 hours ago',
        total: 203,
        more: true)
  ];
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return SliverPadding(
      padding: EdgeInsets.only(
          left: responsive.widthR(7),
          right: responsive.widthR(7),
          bottom: responsive.inchR(8)),
      sliver: SliverList(
          delegate: SliverChildBuilderDelegate(
        (_, i) => ActivityTile(person: persons[i]),
        childCount: persons.length,
      )),
    );
  }
}
