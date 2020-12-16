import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui_app/global/responsive.dart';

class Tasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    return SliverToBoxAdapter(
      child: Container(
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
    final Responsive responsive = Responsive.of(context);
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
                  "Tareas",
                  style: TextStyle(
                      color: Color(0xff223E6D),
                      fontWeight: FontWeight.w700,
                      fontSize: responsive.inchR(2.5)),
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      "assets/canvas/icons/ic_filter.svg",
                      height: responsive.inchR(1.3),
                    ),
                    SizedBox(
                      width: responsive.inchR(0.5),
                    ),
                    Text(
                      "Filtrar",
                      style: TextStyle(
                          color: Color(0xff92A5C6),
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
                color: Color(0xff367BE2),
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
        child: Container(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
          Task(
              percent: 50,
              taskName: "Investigar protocolos \nde internet",
              taskTile: "Seguridad informatica",
              userImage: "assets/canvas/images/img_person_1.jpg"),
          Task(
              percent: 20,
              taskName: "Investigar arquitectura \nde computadoras",
              taskTile: "Partes de computadoras",
              userImage: "assets/canvas/images/img_person_4.jpg"),
        ])));
  }
}

class Task extends StatelessWidget {
  final double percent;
  final String taskName;
  final String taskTile;
  final String userImage;

  const Task(
      {Key key,
      @required this.percent,
      @required this.taskName,
      @required this.taskTile,
      @required this.userImage})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

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
              offset: Offset(0, 3), // changes position of shadow
            ),
          ]),
      child: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              TaskChart(
                percent: this.percent,
              ),
              TaskName(
                name: this.taskName,
              ),
              TaskTile(
                tile: this.taskTile,
              ),
              SizedBox(
                height: responsive.inchR(2),
              ),
            ],
          ),
          TaskUser(
            userImage: this.userImage,
          )
        ],
      ),
    );
  }
}

class TaskName extends StatelessWidget {
  final String name;

  const TaskName({Key key, @required this.name}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Padding(
      padding: EdgeInsets.only(left: responsive.inchR(2)),
      child: Text(
        this.name,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        style: TextStyle(
            color: Color(0xff223E6D),
            fontWeight: FontWeight.w700,
            fontSize: responsive.inchR(1.5)),
      ),
    );
  }
}

class TaskChart extends StatelessWidget {
  final double percent;

  const TaskChart({Key key, @required this.percent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<AnimatedCircularChartState> _chartKey =
        new GlobalKey<AnimatedCircularChartState>();

    final Responsive responsive = Responsive.of(context);

    return Container(
      padding: EdgeInsets.all(5),
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
                this.percent,
                Color(0xff367BE2),
              ),
              CircularSegmentEntry(
                100 - this.percent,
                Color(0xffDCEBF5),
              ),
            ],
          ),
        ],
        chartType: CircularChartType.Radial,
        percentageValues: true,
        holeLabel: '${this.percent}%',
        labelStyle: new TextStyle(
          color: Color(0xff367BE2),
          fontWeight: FontWeight.bold,
          fontSize: responsive.inchR(1.6),
        ),
      ),
    );
  }
}

class TaskTile extends StatelessWidget {
  final String tile;

  const TaskTile({Key key, @required this.tile}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
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
                color: Color(0xffFEB25B),
              ),
            ),
          ),
          SizedBox(width: responsive.inchR(0.7)),
          Text(
            this.tile,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
                color: Color(0xff223E6D),
                fontWeight: FontWeight.w300,
                fontSize: responsive.inchR(1.4)),
          ),
        ],
      ),
    );
  }
}

class TaskUser extends StatelessWidget {
  final String userImage;

  const TaskUser({Key key, this.userImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Positioned(
      top: responsive.inchR(1.5),
      right: responsive.inchR(1.5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(responsive.inchR(10)),
        child: CircleAvatar(
          radius: responsive.inchR(1.5),
          child: Image(
            image: AssetImage(this.userImage),
          ),
        ),
      ),
    );
  }
}
