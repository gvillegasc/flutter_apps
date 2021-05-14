import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui_app/apps/canvas/models/activity.dart';
import 'package:flutter_ui_app/global/responsive.dart';

class ActivityTile extends StatelessWidget {
  const ActivityTile({Key? key, required this.activity}) : super(key: key);

  final Activity activity;
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Container(
      margin: EdgeInsets.only(bottom: responsive.inchR(2)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(responsive.inchR(0.75)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 0.5), // changes position of shadow
          ),
        ],
      ),
      width: double.infinity,
      height: responsive.inchR(9),
      child: Row(
        children: <Widget>[
          ActivityInfo(activity: activity),
          ActivityDetail(activity: activity)
        ],
      ),
    );
  }
}

class Users extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return SizedBox(
      height: responsive.inchR(3.4),
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 0,
            top: responsive.inchR(0.5),
            child: CircleAvatar(
              backgroundColor: const Color(0xffFFFFFF),
              radius: responsive.inchR(1.3),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: CircleAvatar(
                  radius: responsive.inchR(1.1),
                  child: const Image(
                    image: AssetImage('assets/canvas/images/img_person_1.jpg'),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: responsive.inchR(1.5),
            top: responsive.inchR(0.5),
            child: CircleAvatar(
              backgroundColor: const Color(0xffFFFFFF),
              radius: responsive.inchR(1.3),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: CircleAvatar(
                  radius: responsive.inchR(1.1),
                  child: const Image(
                    image: AssetImage('assets/canvas/images/img_person_2.jpg'),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ActivityInfo extends StatelessWidget {
  const ActivityInfo({Key? key, required this.activity}) : super(key: key);

  final Activity activity;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Container(
      padding: EdgeInsets.all(responsive.inchR(1.7)),
      width: responsive.widthR(39),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            activity.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: const Color(0xff223E6D),
                fontSize: responsive.inchR(1.5)),
          ),
          Text(
            activity.date,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                color: const Color(0xff367BE2),
                fontSize: responsive.inchR(1.4)),
          )
        ],
      ),
    );
  }
}

class ActivityDetail extends StatelessWidget {
  const ActivityDetail({Key? key, required this.activity}) : super(key: key);

  final Activity activity;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        (activity.completed == null)
            ? Container(
                height: responsive.inchR(4),
              )
            : (activity.completed!)
                ? Container(
                    width: double.infinity,
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(
                        right: responsive.widthR(11), top: responsive.inchR(1)),
                    child: SvgPicture.asset(
                      'assets/canvas/icons/ic_check.svg',
                      height: responsive.inchR(3),
                      color: const Color(0xff36E26F),
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                          width: responsive.widthR(14),
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                              vertical: responsive.inchR(0.5)),
                          decoration: BoxDecoration(
                              color: activity.color,
                              borderRadius: BorderRadius.circular(
                                  responsive.inchR(0.85))),
                          child: Text(
                            activity.course,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: const Color(0xffFFFFFF),
                                fontSize: responsive.inchR(1.2)),
                          )),
                      Container(
                        height: responsive.inchR(4),
                        width: responsive.widthR(10),
                        alignment: Alignment.center,
                        child: Stack(
                          children: <Widget>[Users()],
                        ),
                      ),
                      Icon(
                        Icons.more_vert,
                        color: const Color(0xff92A5C6),
                        size: responsive.inchR(2.5),
                      ),
                      SizedBox(
                        width: responsive.widthR(1),
                      ),
                    ],
                  ),
        Container(
          width: double.infinity,
          alignment: Alignment.centerRight,
          padding: EdgeInsets.only(
              right: responsive.widthR(7), bottom: responsive.inchR(1)),
          child: Text(
            activity.hour,
            style: TextStyle(
                color: const Color(0xff92A5C6),
                fontSize: responsive.inchR(1.5)),
          ),
        )
      ],
    ));
  }
}
