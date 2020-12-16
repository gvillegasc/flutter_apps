import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui_app/apps/canvas/models/board_item.dart';
import 'package:flutter_ui_app/global/responsive.dart';

class BoardList extends StatelessWidget {
  final List<BoardItem> boardList = [
    BoardItem(
        percent: 20,
        color: Color(0xff615BFE),
        title: "Experiencia de usuario",
        area: "IT7-2"),
    BoardItem(
        percent: 100,
        color: Color(0xffFE5B60),
        title: "Administración del tiempo",
        area: "IT7-2"),
    BoardItem(
        percent: 70,
        color: Color(0xffFEB25B),
        title: "Seguridad Informatica",
        area: "IT7-2"),
    BoardItem(
        percent: 20,
        color: Color(0xffFE5BC2),
        title: "Arquitectura de Software",
        area: "IT7-2"),
  ];
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
        padding: EdgeInsets.only(top: 15, bottom: 40, left: 15, right: 15),
        sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate((_, index) {
              return BoardCard(boardItem: boardList[index]);
            }, childCount: boardList.length),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 1,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10)));
  }
}

class BoardCard extends StatelessWidget {
  final BoardItem boardItem;

  const BoardCard({Key key, @required this.boardItem}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Container(
      width: responsive.inchR(20),
      height: responsive.inchR(20),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: 2,
          blurRadius: 7,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ], borderRadius: BorderRadius.circular(responsive.inchR(1.5))),
      child: Column(
        children: [
          Container(
            height: responsive.inchR(11.5),
            width: double.infinity,
            decoration: BoxDecoration(
                color: this.boardItem.color,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      responsive.inchR(1.5),
                    ),
                    topRight: Radius.circular(
                      responsive.inchR(1.5),
                    ))),
            child: Stack(
              children: <Widget>[
                Positioned(
                    top: responsive.inchR(1),
                    right: responsive.inchR(1),
                    child: Icon(
                      Icons.more_vert,
                      color: Color(0xffFFFFFF),
                      size: responsive.inchR(2.2),
                    )),
                Positioned(
                    top: responsive.inchR(1.5),
                    left: responsive.inchR(1.2),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xffFFFFFF),
                          borderRadius:
                              BorderRadius.circular(responsive.inchR(10))),
                      padding: EdgeInsets.symmetric(
                          vertical: responsive.inchR(0.4),
                          horizontal: responsive.inchR(1.3)),
                      child: Text(
                        "${this.boardItem.percent}%",
                        style: TextStyle(
                            color: Color(0xff223E6D),
                            fontSize: responsive.inchR(1.3),
                            fontWeight: FontWeight.w300),
                      ),
                    )),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color(0xffFFFFFF),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(
                        responsive.inchR(1.5),
                      ),
                      bottomRight: Radius.circular(
                        responsive.inchR(1.5),
                      ))),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: responsive.inchR(0.8),
                    horizontal: responsive.inchR(1)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      this.boardItem.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Color(0xff223E6D),
                          fontWeight: FontWeight.w700,
                          fontSize: responsive.inchR(1.5)),
                    ),
                    Text(this.boardItem.area,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Color(0xff223E6D),
                            fontWeight: FontWeight.w700,
                            fontSize: responsive.inchR(1.5))),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            SvgPicture.asset(
                              "assets/canvas/icons/ic_chat.svg",
                              height: responsive.inchR(1.5),
                            ),
                            SizedBox(height: responsive.inchR(0.2)),
                            Text(
                              "Chat",
                              style: TextStyle(
                                  color: Color(0xff92A5C6),
                                  fontWeight: FontWeight.w300,
                                  fontSize: responsive.inchR(1.25)),
                            )
                          ],
                        ),
                        SizedBox(
                          width: responsive.inchR(1),
                        ),
                        Column(
                          children: <Widget>[
                            SvgPicture.asset(
                              "assets/canvas/icons/ic_file.svg",
                              height: responsive.inchR(1.5),
                            ),
                            SizedBox(height: responsive.inchR(0.2)),
                            Text(
                              "Archivos",
                              style: TextStyle(
                                  color: Color(0xff92A5C6),
                                  fontWeight: FontWeight.w300,
                                  fontSize: responsive.inchR(1.25)),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
