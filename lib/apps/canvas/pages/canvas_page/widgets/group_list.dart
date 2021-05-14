import 'package:flutter/material.dart';
import 'package:flutter_ui_app/apps/canvas/models/user_group.dart';
import 'package:flutter_ui_app/global/responsive.dart';

class GroupList extends StatelessWidget {
  final List<UserGroup> groups = [
    UserGroup(
        group: 'Grupo 72 - Equipo 1',
        color: const Color(0xffFE5BC2),
        course: 'Arquitectura de software',
        period: 'Periodo determinado'),
    UserGroup(
        group: 'Grupo 72 - Equipo 3',
        color: const Color(0xff367BE2),
        course: 'Arquitectura de computadoras',
        period: 'Periodo determinado'),
    UserGroup(
        group: 'Grupo 73 - Equipo 1',
        color: const Color(0xff196F3D),
        course: 'Ingenieria de requerimientos',
        period: 'Periodo determinado'),
  ];
  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
            (_, index) => Group(group: groups[index]),
            childCount: groups.length));
  }
}

class Group extends StatelessWidget {
  const Group({Key? key, required this.group}) : super(key: key);

  final UserGroup group;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: responsive.widthR(5)),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: responsive.inchR(1)),
        height: responsive.inchR(9),
        width: responsive.widthR(90),
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
        child: ClipRRect(
          borderRadius: BorderRadius.circular(responsive.inchR(0.75)),
          child: Row(
            children: <Widget>[
              Container(
                width: responsive.widthR(1.5),
                height: double.infinity,
                color: group.color,
              ),
              Expanded(
                  child: Container(
                padding:
                    EdgeInsets.symmetric(horizontal: responsive.inchR(2.5)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      group.group,
                      style: TextStyle(
                          color: const Color(0xff223E6D),
                          fontSize: responsive.inchR(1.7),
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      group.course,
                      style: TextStyle(
                          color: const Color(0xff367BE2),
                          fontSize: responsive.inchR(1.6),
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      group.period,
                      style: TextStyle(
                          color: const Color(0xff92A5C6),
                          fontSize: responsive.inchR(1.4),
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
