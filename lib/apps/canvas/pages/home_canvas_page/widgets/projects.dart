import 'package:flutter/material.dart';
import 'package:flutter_ui_app/apps/canvas/models/user_project.dart';
import 'package:flutter_ui_app/global/responsive.dart';

class Projects extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return SliverToBoxAdapter(
        child: Container(
      width: double.infinity,
      height: responsive.inchR(34),
      child: Column(
        children: <Widget>[ProjectsTitle(), ProjectList()],
      ),
    ));
  }
}

class ProjectsTitle extends StatelessWidget {
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
                  "Proyectos",
                  style: TextStyle(
                      color: Color(0xff223E6D),
                      fontWeight: FontWeight.w700,
                      fontSize: responsive.inchR(2.5)),
                ),
                Text(
                  "Ver todos",
                  style: TextStyle(
                      color: Color(0xff92A5C6),
                      fontWeight: FontWeight.w400,
                      fontSize: responsive.inchR(1.7)),
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

class ProjectList extends StatelessWidget {
  final List<UserProject> userProjects = [
    UserProject(
        date: "01/dec/2020",
        activity: ["Hacer Login", "Crear Homepage", "Crear Landing page"],
        team: "Equipo \nMaravilla",
        color: Color(0xffE86AA7)),
    UserProject(
        date: "03/dec/2020",
        activity: ["Hacer Login", "Crear Homepage"],
        team: "Equipo \nBuena honda",
        color: Color(0xffF7BF12)),
    UserProject(
        date: "01/dec/2020",
        activity: ["Hacer Login", "Crear Homepage", "Crear Landing page"],
        team: "Equipo \nFantastico",
        color: Color(0xff54B39B)),
  ];

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Expanded(
      child: Container(
          padding: EdgeInsets.symmetric(vertical: responsive.inchR(2)),
          child: drawList(responsive)),
    );
  }

  Widget drawList(responsive) {
    final children = <Widget>[];
    children.add(
      SizedBox(
        width: responsive.inchR(1.5),
      ),
    );
    for (var i = 0; i < userProjects.length; i++) {
      children.add(Project(userProject: userProjects[i]));
    }

    return ListView(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      children: children,
    );
  }
}

class Project extends StatelessWidget {
  final UserProject userProject;

  const Project({Key key, @required this.userProject}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Container(
      height: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: responsive.inchR(1)),
      padding: EdgeInsets.symmetric(
          vertical: responsive.inchR(1.5), horizontal: responsive.inchR(1.5)),
      width: responsive.inchR(17),
      decoration: BoxDecoration(
          color: this.userProject.color,
          borderRadius: BorderRadius.circular(responsive.inchR(2))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            this.userProject.date,
            style: TextStyle(
                color: Color(0xffFFFFFF),
                fontWeight: FontWeight.w400,
                fontSize: responsive.inchR(1.5)),
          ),
          UserList(),
          Text(
            "Actividades",
            style: TextStyle(
                color: Color(0xff2B3F5F),
                fontWeight: FontWeight.w700,
                fontSize: responsive.inchR(1.7)),
          ),
          drawWorks(this.userProject.activity),
          SizedBox(
            height: responsive.inchR(1.5),
          ),
          Container(
            child: Text(this.userProject.team,
                style: TextStyle(
                    color: Color(0xffFFFFFF),
                    fontWeight: FontWeight.w500,
                    fontSize: responsive.inchR(1.8))),
          )
        ],
      ),
    );
  }

  Widget drawWorks(List<String> activities) {
    final children = <Widget>[];
    for (int i = 0; i < activities.length; i++) {
      children.add(Work(
        work: activities[i],
      ));
    }

    return Column(
      children: children,
    );
  }
}

class Work extends StatelessWidget {
  final String work;

  const Work({Key key, @required this.work})
      : assert(work != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Row(
      children: <Widget>[
        CircleAvatar(
          radius: responsive.inchR(0.25),
          backgroundColor: Color(0xffFFFFFF),
        ),
        SizedBox(
          width: responsive.inchR(0.3),
        ),
        Text(
          this.work,
          style: TextStyle(
              color: Color(0xffFFFFFF),
              fontWeight: FontWeight.w400,
              fontSize: responsive.inchR(1.35)),
        ),
      ],
    );
  }
}

class User extends StatelessWidget {
  final double distance;
  final String image;

  const User({Key key, @required this.distance, @required this.image})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Positioned(
      left: this.distance,
      child: CircleAvatar(
        backgroundColor: Color(0xffFFFFFF),
        radius: responsive.inchR(1.7),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: CircleAvatar(
            radius: responsive.inchR(1.5),
            child: Image(
              image: AssetImage(this.image),
            ),
          ),
        ),
      ),
    );
  }
}

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Container(
      height: responsive.inchR(3.4),
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          User(
            distance: responsive.inchR(0),
            image: "assets/canvas/images/img_person_1.jpg",
          ),
          User(
            distance: responsive.inchR(2),
            image: "assets/canvas/images/img_person_2.jpg",
          ),
          User(
            distance: responsive.inchR(4),
            image: "assets/canvas/images/img_person_3.jpg",
          ),
          User(
            distance: responsive.inchR(6),
            image: "assets/canvas/images/img_person_4.jpg",
          ),
        ],
      ),
    );
  }
}
