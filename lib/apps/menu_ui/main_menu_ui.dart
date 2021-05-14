import 'package:flutter/material.dart';
import 'package:flutter_ui_app/global/responsive.dart';

class MainMenuUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MenuUi();
  }
}

class MenuUi extends StatefulWidget {
  @override
  _MenuUiState createState() => _MenuUiState();
}

class _MenuUiState extends State<MenuUi> {
  late int itemSelected;
  late double itemSelectedSiza;
  @override
  void initState() {
    itemSelected = 0;
    itemSelectedSiza = 0.0;
    super.initState();
  }

  final _menuItems = [
    _MenuItemModel(
        itemId: 1,
        title: 'HEALTHCARE',
        options: ['Skincare', 'Personal Care', 'Health', 'Eye Care'],
        titleColor: const Color(0xff0D3284),
        color: const Color(0xff8CD9E8)),
    _MenuItemModel(
        itemId: 2,
        title: 'FOOD & DRINK',
        titleColor: const Color(0xffFBB125),
        options: [
          'Fruits',
          'Frozen Food',
          'Bakery',
          'Snacks & Desserts',
          'Alcoholic Beverages',
          'Noddles & Pasta',
          'Rice & Cooking',
        ],
        color: const Color(0xff14643D)),
    _MenuItemModel(
        itemId: 3,
        title: 'BEAUTY',
        titleColor: const Color(0xFFF15D58),
        options: ['Skincare', 'Skincare', 'Skincare'],
        color: const Color(0xffFCBEBF)),
    _MenuItemModel(
        itemId: 4,
        title: 'BABY & KIDS',
        titleColor: const Color(0xffFCBEBF),
        options: ['Makeup', 'Necklaces', 'Bracelet', 'Earring'],
        color: const Color(0xff0D3284)),
    _MenuItemModel(
        itemId: 5,
        title: 'HOMEWARES',
        titleColor: const Color(0xffFFFFFF),
        options: [
          'Chair',
          'Couch',
          'Living room',
          'Table',
        ],
        color: const Color(0xffFBB125)),
  ];

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);

    return Scaffold(
      body: SizedBox(
        height: responsive.height,
        width: responsive.width,
        child: Column(
            children: List.generate(
          _menuItems.length,
          (i) => _MenuItem(
              itemSelected: itemSelected,
              itemId: _menuItems[i].itemId,
              titleColor: _menuItems[i].titleColor,
              title: _menuItems[i].title,
              color: _menuItems[i].color,
              options: _menuItems[i].options,
              itemSelectedSiza: itemSelectedSiza,
              onTap: () {
                setState(() {
                  itemSelected = _menuItems[i].itemId;
                  itemSelectedSiza = responsive.heightR(20) +
                      _menuItems[i].options.length * 20;
                });
              }),
        )),
      ),
    );
  }
}

class _MenuItem extends StatefulWidget {
  const _MenuItem(
      {Key? key,
      required this.itemSelected,
      required this.itemId,
      required this.title,
      required this.titleColor,
      required this.color,
      required this.options,
      required this.onTap,
      required this.itemSelectedSiza})
      : super(key: key);
  final int itemSelected;
  final int itemId;
  final String title;
  final Color titleColor;
  final Color color;
  final List<String> options;
  final VoidCallback onTap;
  final double itemSelectedSiza;

  @override
  __MenuItemState createState() => __MenuItemState();
}

class __MenuItemState extends State<_MenuItem>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    controller = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    animation = CurvedAnimation(curve: Curves.easeOut, parent: controller);

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    if (widget.itemSelected == widget.itemId)
      controller.forward();
    else
      controller.reverse();

    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: responsive.width,
        height: widget.itemSelected == 0
            ? responsive.heightR(20)
            : widget.itemSelected == widget.itemId
                ? responsive.heightR(20) + widget.options.length * 20
                : ((responsive.height - widget.itemSelectedSiza) / 4),
        color: widget.color,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        child: Align(
          alignment: Alignment.centerLeft,
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(
                      bottom: widget.itemSelected == widget.itemId ? 10 : 0),
                  child: Text(
                    widget.title,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                        color: widget.titleColor),
                  ),
                ),
                (widget.itemSelected == widget.itemId)
                    ? AnimatedBuilder(
                        animation: animation,
                        builder: (_, __) {
                          return Opacity(
                            opacity: animation.value,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: List.generate(
                                    widget.options.length,
                                    (i) => Container(
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 5),
                                          child: Text(widget.options[i],
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: widget.titleColor,
                                                  fontWeight: FontWeight.w300)),
                                        ))),
                          );
                        },
                      )
                    : const SizedBox()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _MenuItemModel {
  _MenuItemModel({
    required this.itemId,
    required this.title,
    required this.titleColor,
    required this.color,
    required this.options,
  });

  final int itemId;
  final String title;
  final Color titleColor;
  final Color color;
  final List<String> options;
}
