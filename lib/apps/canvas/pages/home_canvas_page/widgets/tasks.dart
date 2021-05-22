import 'dart:math';

import 'package:flutter/material.dart';
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
          children: <Widget>[_TasksTitle(), _TaskList()],
        ),
      ),
    );
  }
}

class _TasksTitle extends StatelessWidget {
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

class _TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
          const _Task(
              percent: 50,
              taskName: 'Investigar protocolos \nde internet',
              taskTile: 'Seguridad informatica',
              userImage: 'assets/canvas/images/img_person_1.jpg'),
          const _Task(
              percent: 20,
              taskName: 'Investigar arquitectura \nde computadoras',
              taskTile: 'Partes de computadoras',
              userImage: 'assets/canvas/images/img_person_4.jpg'),
        ]));
  }
}

class _Task extends StatelessWidget {
  const _Task(
      {Key? key,
      required this.percent,
      required this.taskName,
      required this.taskTile,
      required this.userImage})
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
          _TaskUser(
            userImage: userImage,
          )
        ],
      ),
    );
  }
}

class TaskName extends StatelessWidget {
  const TaskName({Key? key, required this.name}) : super(key: key);

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
  const TaskChart({Key? key, required this.percent}) : super(key: key);

  final double percent;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: Container(
        padding: const EdgeInsets.all(12),
        width: responsive.inchR(10),
        height: responsive.inchR(10),
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              child: CustomPaint(
                  painter: _RadialProgress(
                      percentage: percent,
                      primaryColor: const Color(0xff367BE2),
                      secondaryColor: const Color(0xffDCEBF5),
                      primaryLine: 3)),
            ),
            Container(
              height: double.infinity,
              width: double.infinity,
              child: Center(
                child: Text(
                  '$percent%',
                  style: TextStyle(
                    color: const Color(0xff367BE2),
                    fontWeight: FontWeight.bold,
                    fontSize: responsive.inchR(1.6),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TaskTile extends StatelessWidget {
  const TaskTile({Key? key, required this.tile}) : super(key: key);

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

class _TaskUser extends StatelessWidget {
  const _TaskUser({Key? key, required this.userImage}) : super(key: key);

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

class _RadialProgress extends CustomPainter {
  _RadialProgress({
    required this.percentage,
    required this.primaryColor,
    required this.secondaryColor,
    required this.primaryLine,
  });

  final double percentage;
  final Color primaryColor;
  final Color secondaryColor;
  final double primaryLine;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width * 0.5, size.height / 2);
    final radio = min(size.width * 0.5, size.height * 0.5);

    final paintArco = Paint()
      ..strokeWidth = primaryLine
      ..color = primaryColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final paintArco2 = Paint()
      ..strokeWidth = primaryLine
      ..color = secondaryColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final arcAngle = 2 * pi * (percentage / 100);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radio), -pi / 2,
        arcAngle, false, paintArco);

    final arcAngle2 =
        -(2 * pi * ((93 - ((percentage == 100 ? 93 : percentage))) / 100));

    canvas.drawArc(Rect.fromCircle(center: center, radius: radio), -pi / 1.75,
        arcAngle2, false, paintArco2);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
