import 'package:flutter/material.dart';

class MainTopMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final ScrollController _controller = ScrollController();
  double position;

  AnimationController _animationController;

  final double initialSize = 0;
  final double finalSize = 120;
  bool showMenu = false;
  int _idSelected = 1;
  List<_CardItem> _cardsSelected;

  final List<_MenuItemModel> menuItems = [
    _MenuItemModel(
        id: 1,
        iconData: Icons.add_box_outlined,
        name: "Box",
        cards: [
          _CardItem(
              color: Color(0xffFFC300),
              icon: Icons.add_to_photos_rounded,
              text: "Add"),
          _CardItem(
              color: Color(0xff900C3F),
              icon: Icons.local_hospital_outlined,
              text: "Hospital"),
          _CardItem(
              color: Color(0xff52BE80),
              icon: Icons.food_bank_outlined,
              text: "Food"),
          _CardItem(
              color: Color(0xff566573),
              icon: Icons.book_online_outlined,
              text: "Book"),
          _CardItem(
              color: Color(0xff633974),
              icon: Icons.directions_walk_outlined,
              text: "Direction"),
          _CardItem(
              color: Color(0xff274261),
              icon: Icons.account_balance_outlined,
              text: "Balance"),
          _CardItem(
              color: Color(0xffDD6401),
              icon: Icons.wallet_giftcard_sharp,
              text: "Wallet")
        ]),
    _MenuItemModel(id: 2, iconData: Icons.tour_outlined, name: "Tour", cards: [
      _CardItem(
          color: Color(0xff900C3F),
          icon: Icons.local_hospital_outlined,
          text: "Hospital"),
      _CardItem(
          color: Color(0xff633974),
          icon: Icons.directions_walk_outlined,
          text: "Direction"),
      _CardItem(
          color: Color(0xff274261),
          icon: Icons.account_balance_outlined,
          text: "Balance"),
      _CardItem(
          color: Color(0xff566573),
          icon: Icons.book_online_outlined,
          text: "Book"),
      _CardItem(
          color: Color(0xff52BE80),
          icon: Icons.food_bank_outlined,
          text: "Food"),
      _CardItem(
          color: Color(0xffDD6401),
          icon: Icons.wallet_giftcard_sharp,
          text: "Wallet"),
      _CardItem(
          color: Color(0xffFFC300),
          icon: Icons.add_to_photos_rounded,
          text: "Add"),
    ]),
    _MenuItemModel(
        id: 3,
        iconData: Icons.blur_off_outlined,
        name: "Blur",
        cards: [
          _CardItem(
              color: Color(0xffDD6401),
              icon: Icons.wallet_giftcard_sharp,
              text: "Wallet"),
          _CardItem(
              color: Color(0xff274261),
              icon: Icons.account_balance_outlined,
              text: "Balance"),
          _CardItem(
              color: Color(0xff633974),
              icon: Icons.directions_walk_outlined,
              text: "Direction"),
          _CardItem(
              color: Color(0xff566573),
              icon: Icons.book_online_outlined,
              text: "Book"),
          _CardItem(
              color: Color(0xff52BE80),
              icon: Icons.food_bank_outlined,
              text: "Food"),
          _CardItem(
              color: Color(0xff900C3F),
              icon: Icons.local_hospital_outlined,
              text: "Hospital"),
          _CardItem(
              color: Color(0xffFFC300),
              icon: Icons.add_to_photos_rounded,
              text: "Add"),
        ]),
    _MenuItemModel(id: 4, iconData: Icons.shop_outlined, name: "Shop", cards: [
      _CardItem(
          color: Color(0xFF4B9420),
          icon: Icons.security_outlined,
          text: "Security"),
      _CardItem(
          color: Color(0xFF973131),
          icon: Icons.food_bank_outlined,
          text: "Food"),
      _CardItem(
          color: Color(0xFF6C3CAC),
          icon: Icons.description_outlined,
          text: "Descriptions"),
      _CardItem(
          color: Color(0xff633974),
          icon: Icons.directions_walk_outlined,
          text: "Direction"),
      _CardItem(
          color: Color(0xff566573),
          icon: Icons.book_online_outlined,
          text: "Book"),
      _CardItem(
          color: Color(0xff900C3F),
          icon: Icons.local_hospital_outlined,
          text: "Hospital"),
      _CardItem(
          color: Color(0xffFFC300),
          icon: Icons.add_to_photos_rounded,
          text: "Add"),
    ]),
    _MenuItemModel(
        id: 5,
        iconData: Icons.food_bank_outlined,
        name: "Food Bank",
        cards: [
          _CardItem(
              color: Color(0xFF58DA99),
              icon: Icons.get_app_outlined,
              text: "Downloads"),
          _CardItem(
              color: Color(0xff274261),
              icon: Icons.receipt_long,
              text: "Receipt"),
          _CardItem(
              color: Color(0xffFFC300),
              icon: Icons.add_to_photos_rounded,
              text: "Add"),
          _CardItem(
              color: Color(0xff633974),
              icon: Icons.directions_walk_outlined,
              text: "Direction"),
          _CardItem(
              color: Color(0xff52BE80),
              icon: Icons.food_bank_outlined,
              text: "Food"),
          _CardItem(
              color: Color(0xff900C3F),
              icon: Icons.local_hospital_outlined,
              text: "Hospital"),
          _CardItem(
              color: Color(0xff566573),
              icon: Icons.book_online_outlined,
              text: "Book"),
        ]),
  ];

  String _menuSelected;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      upperBound: 2.5,
      duration: Duration(milliseconds: 2000),
    );
    _controller.addListener(() {
      if (_controller.position.pixels >= 120) {
        setState(() {
          showMenu = false;
        });
      }
    });

    _menuSelected = menuItems[0].name;
    _cardsSelected = menuItems[0].cards;
    _animationController.forward(from: 1.0);
  }

  @override
  void dispose() {
    _animationController.dispose();
    _controller?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          _menuSelected,
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.black,
            ),
            onPressed: () {}),
        actions: [
          IconButton(
              icon: Icon(Icons.search, color: Colors.black), onPressed: () {})
        ],
      ),
      body: Container(
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (_) {
            if (_.paintOffset == 0.0 &&
                _controller.offset <= _controller.position.minScrollExtent) {
              _.disallowGlow();
              setState(() {
                showMenu = true;
              });
            } else {
              setState(() {
                showMenu = false;
              });
            }
            return true;
          },
          child: ListView(
            controller: _controller,
            children: <Widget>[
              AnimatedContainer(
                color: Color(0xFF262638),
                duration: Duration(milliseconds: 250),
                height: showMenu ? finalSize : initialSize,
                child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    scrollDirection: Axis.horizontal,
                    children: List.generate(
                      menuItems.length,
                      (i) => _MenuItem(
                          id: menuItems[i].id,
                          icon: menuItems[i].iconData,
                          idSelected: _idSelected,
                          showMenu: showMenu,
                          onPressed: () {
                            setState(() {
                              _idSelected = menuItems[i].id;
                              _menuSelected = menuItems[i].name;
                              _animationController.forward(from: 0.0);
                              _cardsSelected = menuItems[i].cards;
                            });
                            Future.delayed(Duration(milliseconds: 150), () {
                              setState(() {
                                showMenu = false;
                              });
                            });
                          }),
                    )),
              ),
              AnimatedBuilder(
                  animation: _animationController,
                  builder: (_, __) {
                    return ClipPath(
                      clipper: _MenuClipperSelected(_animationController.value),
                      child: Column(
                        children: <Widget>[..._cardsSelected],
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}

class _CardItem extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String text;

  const _CardItem(
      {Key key, @required this.color, @required this.icon, @required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: double.infinity,
      color: this.color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(this.icon, size: 150, color: Colors.white),
          Text(
            this.text,
            style: TextStyle(color: Colors.white, fontSize: 25),
          )
        ],
      ),
    );
  }
}

class _MenuItem extends StatefulWidget {
  final int id;
  final IconData icon;
  final int idSelected;
  final bool showMenu;
  final VoidCallback onPressed;

  const _MenuItem(
      {Key key,
      @required this.id,
      @required this.icon,
      @required this.idSelected,
      @required this.showMenu,
      @required this.onPressed})
      : super(key: key);

  @override
  __MenuItemState createState() => __MenuItemState();
}

class __MenuItemState extends State<_MenuItem> with TickerProviderStateMixin {
  // Date
  AnimationController itemAnimation;
  Animation<double> itemAnimationDouble;

  @override
  void initState() {
    super.initState();
    itemAnimation = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 150),
    );
    itemAnimationDouble = Tween<double>(begin: 1, end: 0)
        .animate(CurvedAnimation(parent: itemAnimation, curve: Curves.easeIn));
  }

  @override
  void dispose() {
    itemAnimation?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.showMenu) {
      Future.delayed(Duration(milliseconds: 50), () {
        itemAnimation.forward();
      });
    } else {
      itemAnimation.reverse();
    }
    return AnimatedBuilder(
        animation: itemAnimation,
        builder: (_, __) {
          return Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.006)
              ..rotateX(-itemAnimationDouble.value),
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: this.widget.onPressed,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 150),
                margin: EdgeInsets.symmetric(horizontal: 5),
                width: 80,
                color: this.widget.id == this.widget.idSelected
                    ? Color(0xFFF84082)
                    : Color(0xFF1D1D2C),
                child: Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.006)
                    ..rotateX(-itemAnimationDouble.value),
                  alignment: Alignment.bottomCenter,
                  child: Icon(
                    this.widget.icon,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
              ),
            ),
          );
        });
  }
}

class _MenuItemModel {
  final int id;
  final IconData iconData;
  final String name;
  final List<_CardItem> cards;

  _MenuItemModel(
      {@required this.id,
      @required this.iconData,
      @required this.name,
      @required this.cards});
}

class _MenuClipperSelected extends CustomClipper<Path> {
  final double percent;

  _MenuClipperSelected(this.percent);

  @override
  Path getClip(Size size) {
    final path = Path();
    path.addOval(
      Rect.fromCenter(
        center: Offset(size.width / 2, 0.0),
        width: size.height * percent,
        height: size.height * percent,
      ),
    );
    return path;
  }

  @override
  bool shouldReclip(covariant _MenuClipperSelected oldClipper) =>
      oldClipper.percent != percent;
}
