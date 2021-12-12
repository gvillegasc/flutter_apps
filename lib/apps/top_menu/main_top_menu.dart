import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
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
  late double position;

  late AnimationController _animationController;

  final double initialSize = 0;
  final double finalSize = 120;
  bool showMenu = false;
  int _idSelected = 1;
  late List<_CardItem> _cardsSelected;

  final List<_MenuItemModel> menuItems = [
    _MenuItemModel(
        id: 1,
        iconData: Icons.add_box_outlined,
        name: 'Box',
        cards: [
          const _CardItem(
              color: Color(0xffFFC300),
              icon: Icons.add_to_photos_rounded,
              text: 'Add'),
          const _CardItem(
              color: Color(0xff900C3F),
              icon: Icons.local_hospital_outlined,
              text: 'Hospital'),
          const _CardItem(
              color: Color(0xff52BE80),
              icon: Icons.food_bank_outlined,
              text: 'Food'),
          const _CardItem(
              color: Color(0xff566573),
              icon: Icons.book_online_outlined,
              text: 'Book'),
          const _CardItem(
              color: Color(0xff633974),
              icon: Icons.directions_walk_outlined,
              text: 'Direction'),
          const _CardItem(
              color: Color(0xff274261),
              icon: Icons.account_balance_outlined,
              text: 'Balance'),
          const _CardItem(
              color: Color(0xffDD6401),
              icon: Icons.wallet_giftcard_sharp,
              text: 'Wallet')
        ]),
    _MenuItemModel(id: 2, iconData: Icons.tour_outlined, name: 'Tour', cards: [
      const _CardItem(
          color: Color(0xff900C3F),
          icon: Icons.local_hospital_outlined,
          text: 'Hospital'),
      const _CardItem(
          color: Color(0xff633974),
          icon: Icons.directions_walk_outlined,
          text: 'Direction'),
      const _CardItem(
          color: Color(0xff274261),
          icon: Icons.account_balance_outlined,
          text: 'Balance'),
      const _CardItem(
          color: Color(0xff566573),
          icon: Icons.book_online_outlined,
          text: 'Book'),
      const _CardItem(
          color: Color(0xff52BE80),
          icon: Icons.food_bank_outlined,
          text: 'Food'),
      const _CardItem(
          color: Color(0xffDD6401),
          icon: Icons.wallet_giftcard_sharp,
          text: 'Wallet'),
      const _CardItem(
          color: Color(0xffFFC300),
          icon: Icons.add_to_photos_rounded,
          text: 'Add'),
    ]),
    _MenuItemModel(
        id: 3,
        iconData: Icons.blur_off_outlined,
        name: 'Blur',
        cards: [
          const _CardItem(
              color: Color(0xffDD6401),
              icon: Icons.wallet_giftcard_sharp,
              text: 'Wallet'),
          const _CardItem(
              color: Color(0xff274261),
              icon: Icons.account_balance_outlined,
              text: 'Balance'),
          const _CardItem(
              color: Color(0xff633974),
              icon: Icons.directions_walk_outlined,
              text: 'Direction'),
          const _CardItem(
              color: Color(0xff566573),
              icon: Icons.book_online_outlined,
              text: 'Book'),
          const _CardItem(
              color: Color(0xff52BE80),
              icon: Icons.food_bank_outlined,
              text: 'Food'),
          const _CardItem(
              color: Color(0xff900C3F),
              icon: Icons.local_hospital_outlined,
              text: 'Hospital'),
          const _CardItem(
              color: Color(0xffFFC300),
              icon: Icons.add_to_photos_rounded,
              text: 'Add'),
        ]),
    _MenuItemModel(id: 4, iconData: Icons.shop_outlined, name: 'Shop', cards: [
      const _CardItem(
          color: Color(0xFF4B9420),
          icon: Icons.security_outlined,
          text: 'Security'),
      const _CardItem(
          color: Color(0xFF973131),
          icon: Icons.food_bank_outlined,
          text: 'Food'),
      const _CardItem(
          color: Color(0xFF6C3CAC),
          icon: Icons.description_outlined,
          text: 'Descriptions'),
      const _CardItem(
          color: Color(0xff633974),
          icon: Icons.directions_walk_outlined,
          text: 'Direction'),
      const _CardItem(
          color: Color(0xff566573),
          icon: Icons.book_online_outlined,
          text: 'Book'),
      const _CardItem(
          color: Color(0xff900C3F),
          icon: Icons.local_hospital_outlined,
          text: 'Hospital'),
      const _CardItem(
          color: Color(0xffFFC300),
          icon: Icons.add_to_photos_rounded,
          text: 'Add'),
    ]),
    _MenuItemModel(
        id: 5,
        iconData: Icons.food_bank_outlined,
        name: 'Food Bank',
        cards: [
          const _CardItem(
              color: Color(0xFF58DA99),
              icon: Icons.get_app_outlined,
              text: 'Downloads'),
          const _CardItem(
              color: Color(0xff274261),
              icon: Icons.receipt_long,
              text: 'Receipt'),
          const _CardItem(
              color: Color(0xffFFC300),
              icon: Icons.add_to_photos_rounded,
              text: 'Add'),
          const _CardItem(
              color: Color(0xff633974),
              icon: Icons.directions_walk_outlined,
              text: 'Direction'),
          const _CardItem(
              color: Color(0xff52BE80),
              icon: Icons.food_bank_outlined,
              text: 'Food'),
          const _CardItem(
              color: Color(0xff900C3F),
              icon: Icons.local_hospital_outlined,
              text: 'Hospital'),
          const _CardItem(
              color: Color(0xff566573),
              icon: Icons.book_online_outlined,
              text: 'Book'),
        ]),
  ];

  late String _menuSelected;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      upperBound: 2.5,
      duration: const Duration(milliseconds: 2000),
    );
    _controller.addListener(() {
      // print(_controller.position.pixels);
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
    _controller.dispose();

    super.dispose();
  }

  Future doRefresh() {
    return Future(() {
      setState(() {
        showMenu = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          _menuSelected,
          style: const TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: const Color(0xffFFFFFF),
        leading: IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
            onPressed: () {}),
        actions: [
          IconButton(
              icon: const Icon(Icons.search, color: Colors.black),
              onPressed: () {})
        ],
      ),
      body: CustomRefreshIndicator(
        onRefresh: () async {
          setState(() {
            showMenu = true;
          });
        },
        armedToLoadingDuration: const Duration(milliseconds: 50),
        builder: (
          BuildContext context,
          Widget child,
          IndicatorController controller,
        ) {
          return Container(
            child: child,
          );
        },
        child: ListView(
          physics: ClampingScrollPhysics(),
          controller: _controller,
          children: <Widget>[
            AnimatedContainer(
              color: const Color(0xFF262638),
              duration: const Duration(milliseconds: 250),
              height: showMenu ? finalSize : initialSize,
              child: ListView(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
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
                          Future.delayed(const Duration(milliseconds: 150), () {
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
      // ),
    );
  }
}

class _CardItem extends StatelessWidget {
  const _CardItem(
      {Key? key, required this.color, required this.icon, required this.text})
      : super(key: key);

  final Color color;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: double.infinity,
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(icon, size: 150, color: const Color(0xffFFFFFF)),
          Text(
            text,
            style: const TextStyle(color: Color(0xffFFFFFF), fontSize: 25),
          )
        ],
      ),
    );
  }
}

class _MenuItem extends StatefulWidget {
  const _MenuItem(
      {Key? key,
      required this.id,
      required this.icon,
      required this.idSelected,
      required this.showMenu,
      required this.onPressed})
      : super(key: key);

  final int id;
  final IconData icon;
  final int idSelected;
  final bool showMenu;
  final VoidCallback onPressed;

  @override
  __MenuItemState createState() => __MenuItemState();
}

class __MenuItemState extends State<_MenuItem> with TickerProviderStateMixin {
  // Date
  late AnimationController itemAnimation;
  late Animation<double> itemAnimationDouble;

  @override
  void initState() {
    super.initState();
    itemAnimation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    itemAnimationDouble = Tween<double>(begin: 1, end: 0)
        .animate(CurvedAnimation(parent: itemAnimation, curve: Curves.easeIn));
  }

  @override
  void dispose() {
    itemAnimation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.showMenu) {
      Future.delayed(const Duration(milliseconds: 50), () {
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
              onTap: widget.onPressed,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                margin: const EdgeInsets.symmetric(horizontal: 5),
                width: 80,
                color: Color(
                    widget.id == widget.idSelected ? 0xFFF84082 : 0xFF1D1D2C),
                child: Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.006)
                    ..rotateX(-itemAnimationDouble.value),
                  alignment: Alignment.bottomCenter,
                  child: Icon(
                    widget.icon,
                    color: const Color(0xffFFFFFF),
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
  _MenuItemModel(
      {required this.id,
      required this.iconData,
      required this.name,
      required this.cards});

  final int id;
  final IconData iconData;
  final String name;
  final List<_CardItem> cards;
}

class _MenuClipperSelected extends CustomClipper<Path> {
  _MenuClipperSelected(this.percent);
  final double percent;

  @override
  Path getClip(Size size) {
    return Path()
      ..addOval(
        Rect.fromCenter(
          center: Offset(size.width / 2, 0.0),
          width: size.height * percent,
          height: size.height * percent,
        ),
      );
  }

  @override
  bool shouldReclip(covariant _MenuClipperSelected oldClipper) =>
      oldClipper.percent != percent;
}
