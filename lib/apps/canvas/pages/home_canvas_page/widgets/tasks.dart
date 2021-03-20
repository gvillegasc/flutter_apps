import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui_app/global/responsive.dart';

class Tasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);

    return SliverToBoxAdapter(
      child: SizedBox(
        height: responsive.inchR(30),
        width: double.infinity,
        child: Column(
          children: <Widget>[TasksTitle(), TaskList()],
        ),
      ),
    );
  }
}

class TasksTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: responsive.inchR(2.2), vertical: responsive.inchR(1.6)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: responsive.inchR(0.3)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Tareas',
                  style: TextStyle(
                      color: const Color(0xff223E6D),
                      fontWeight: FontWeight.w700,
                      fontSize: responsive.inchR(2.5)),
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/canvas/icons/ic_filter.svg',
                      height: responsive.inchR(1.3),
                    ),
                    SizedBox(
                      width: responsive.inchR(0.5),
                    ),
                    Text(
                      'Filtrar',
                      style: TextStyle(
                          color: const Color(0xff92A5C6),
                          fontWeight: FontWeight.w400,
                          fontSize: responsive.inchR(1.7)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: SizedBox(
              height: responsive.inchR(1),
              width: responsive.inchR(1),
              child: Container(
                color: const Color(0xff367BE2),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
          const Task(
              percent: 50,
              taskName: 'Investigar protocolos \nde internet',
              taskTile: 'Seguridad informatica',
              userImage: 'assets/canvas/images/img_person_1.jpg'),
          const Task(
              percent: 20,
              taskName: 'Investigar arquitectura \nde computadoras',
              taskTile: 'Partes de computadoras',
              userImage: 'assets/canvas/images/img_person_4.jpg'),
        ]));
  }
}

class Task extends StatelessWidget {
  const Task(
      {Key key,
      @required this.percent,
      @required this.taskName,
      @required this.taskTile,
      @required this.userImage})
      : super(key: key);

  final double percent;
  final String taskName;
  final String taskTile;
  final String userImage;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Container(
      height: responsive.inchR(20),
      width: responsive.inchR(20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(responsive.inchR(1)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ]),
      child: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              TaskChart(
                percent: percent,
              ),
              TaskName(
                name: taskName,
              ),
              TaskTile(
                tile: taskTile,
              ),
              SizedBox(
                height: responsive.inchR(2),
              ),
            ],
          ),
          TaskUser(
            userImage: userImage,
          )
        ],
      ),
    );
  }
}

class TaskName extends StatelessWidget {
  const TaskName({Key key, @required this.name}) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Padding(
      padding: EdgeInsets.only(left: responsive.inchR(2)),
      child: Text(
        name,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        style: TextStyle(
            color: const Color(0xff223E6D),
            fontWeight: FontWeight.w700,
            fontSize: responsive.inchR(1.5)),
      ),
    );
  }
}

class TaskChart extends StatelessWidget {
  const TaskChart({Key key, @required this.percent}) : super(key: key);

  final double percent;

  @override
  Widget build(BuildContext context) {
    final _chartKey = GlobalKey<AnimatedCircularChartState>();

    final responsive = Responsive.of(context);

    return Container(
      padding: const EdgeInsets.all(5),
      width: responsive.inchR(10),
      height: responsive.inchR(10),
      child: AnimatedCircularChart(
        key: _chartKey,
        size: Size(responsive.inchR(8), responsive.inchR(8)),
        startAngle: 240,
        initialChartData: <CircularStackEntry>[
          CircularStackEntry(
            <CircularSegmentEntry>[
              CircularSegmentEntry(
                percent,
                const Color(0xff367BE2),
              ),
              CircularSegmentEntry(
                100 - percent,
                const Color(0xffDCEBF5),
              ),
            ],
          ),
        ],
        chartType: CircularChartType.Radial,
        percentageValues: true,
        holeLabel: '$percent%',
        labelStyle: TextStyle(
          color: const Color(0xff367BE2),
          fontWeight: FontWeight.bold,
          fontSize: responsive.inchR(1.6),
        ),
      ),
    );
  }
}

class TaskTile extends StatelessWidget {
  const TaskTile({Key key, @required this.tile}) : super(key: key);

  final String tile;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Padding(
      padding: EdgeInsets.only(left: responsive.inchR(2)),
      child: Row(
        children: <Widget>[
          SizedBox(
            height: responsive.inchR(0.7),
            width: responsive.inchR(0.7),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: const Color(0xffFEB25B),
              ),
            ),
          ),
          SizedBox(width: responsive.inchR(0.7)),
          Text(
            tile,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
                color: const Color(0xff223E6D),
                fontWeight: FontWeight.w300,
                fontSize: responsive.inchR(1.4)),
          ),
        ],
      ),
    );
  }
}

class TaskUser extends StatelessWidget {
  const TaskUser({Key key, this.userImage}) : super(key: key);

  final String userImage;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Positioned(
      top: responsive.inchR(1.5),
      right: responsive.inchR(1.5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(responsive.inchR(10)),
        child: CircleAvatar(
          radius: responsive.inchR(1.5),
          child: Image(
            image: AssetImage(userImage),
          ),
        ),
      ),
    );
  }
}
