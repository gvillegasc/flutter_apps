import 'package:flutter/material.dart';
import 'package:flutter_ui_app/apps/canvas/models/activity.dart';
import 'package:flutter_ui_app/apps/canvas/pages/to_do_page/widgets/widgets.dart';
import 'package:flutter_ui_app/global/responsive.dart';

class ActivityList extends StatelessWidget {
  final List<Activity> activities;

  const ActivityList({Key key, @required this.activities}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Expanded(
        child: ListView.builder(
      padding: EdgeInsets.symmetric(
          vertical: responsive.inchR(1), horizontal: responsive.widthR(5)),
      itemCount: activities.length,
      itemBuilder: (_, index) {
        return ActivityTile(activity: activities[index]);
      },
    ));
  }
}
