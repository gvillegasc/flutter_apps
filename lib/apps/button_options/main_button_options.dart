import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_app/global/responsive.dart';

class MainButtonOptions extends StatelessWidget {
  @override
  Widget build(_) {
    return HomePage();
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  // Date
  late AnimationController dateAnimation;
  late Animation<double> dateAnimationDouble;

  // Button options
  double initialSize = 60;
  double finalSize = 270;
  bool pressed = false;
  late AnimationController iconAnimation;
  late AnimationController optionAnimation;
  late AnimationController optionAnimationTween;
  late Animation<double> animation;

  // Activity
  late AnimationController activityAnimation;
  late AnimationController activityAnimation2;
  late AnimationController activityAnimation3;

  @override
  void initState() {
    super.initState();

    // Date
    dateAnimation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    dateAnimationDouble = Tween<double>(begin: 500.0 * 1, end: 0.0).animate(
        CurvedAnimation(parent: dateAnimation, curve: Curves.elasticIn));

    // Button options
    iconAnimation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    optionAnimation = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 50),
        reverseDuration: const Duration(milliseconds: 10));

    optionAnimationTween = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 600),
        reverseDuration: const Duration(milliseconds: 10));

    animation = Tween<double>(begin: 50.0 * 1, end: 0.0).animate(
        CurvedAnimation(
            parent: optionAnimationTween, curve: Curves.elasticOut));

    // Activity
    activityAnimation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
      reverseDuration: const Duration(milliseconds: 1000),
    );
    activityAnimation2 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
      reverseDuration: const Duration(milliseconds: 1000),
    );
    activityAnimation3 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
      reverseDuration: const Duration(milliseconds: 1000),
    );

    callActivitiesAnimation();
  }

  @override
  void dispose() {
    iconAnimation.dispose();
    optionAnimation.dispose();
    optionAnimationTween.dispose();
    activityAnimation.dispose();
    activityAnimation2.dispose();
    activityAnimation3.dispose();

    super.dispose();
  }

  void callActivitiesAnimation() {
    dateAnimation.forward();

    Future.delayed(const Duration(milliseconds: 700), () {
      activityAnimation.forward();
    });
    Future.delayed(const Duration(milliseconds: 900), () {
      activityAnimation2.forward();
    });
    Future.delayed(const Duration(milliseconds: 1100), () {
      activityAnimation3.forward();
    });
  }

  @override
  Widget build(_) {
    final responsive = Responsive.of(context);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/button_options/bg.jpg'),
                fit: BoxFit.cover)),
        width: responsive.width,
        child: Stack(children: <Widget>[
          Container(
              height: responsive.height,
              width: responsive.width,
              color: const Color(0xff270B81).withOpacity(.3)),
          SafeArea(
            child: Column(children: <Widget>[
              _appBar(responsive),
              _generalDate(responsive),
              _activities(responsive)
            ]),
          ),
          _buttonOptions(responsive)
        ]),
      ),
    );
  }

  Widget _appBar(Responsive responsive) {
    return Padding(
      padding: EdgeInsets.only(
          left: responsive.widthR(5),
          right: responsive.widthR(5),
          top: responsive.heightR(1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(
            Icons.menu,
            color: Colors.white.withOpacity(.5),
          ),
          Icon(
            Icons.search,
            color: Colors.white.withOpacity(.5),
          )
        ],
      ),
    );
  }

  Widget _generalDate(Responsive responsive) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: responsive.widthR(7), vertical: responsive.heightR(4)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AnimatedBuilder(
                  animation: dateAnimation,
                  builder: (_, __) {
                    return Transform.translate(
                      offset: Offset(-dateAnimationDouble.value, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Monday',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 35,
                                fontWeight: FontWeight.w300),
                          ),
                          Text(
                            'February 8, 2021',
                            style: TextStyle(
                                color: Colors.white.withOpacity(.5),
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    );
                  }),
              AnimatedBuilder(
                  animation: dateAnimation,
                  builder: (_, __) {
                    return Transform.translate(
                      offset: Offset(dateAnimationDouble.value, 0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                CupertinoIcons.sun_max,
                                color: Colors.white.withOpacity(.5),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                '58°',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 35,
                                    fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                          Text(
                            'San Francisco',
                            style: TextStyle(
                                color: Colors.white.withOpacity(.5),
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    );
                  }),
            ],
          ),
        ],
      ),
    );
  }

  Widget _activities(Responsive responsive) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Column(
        children: <Widget>[
          _activity(
            '8',
            'AM',
            'Finish Home Screen',
            'Web App',
            responsive,
            activityAnimation,
          ),
          _activity(
            '11',
            'AM',
            'Lunc Breack',
            'Jummp!',
            responsive,
            activityAnimation2,
            delay: const Duration(milliseconds: 900),
          ),
          _activity(
            '2',
            'PM',
            'Design Stand Up',
            'Hangout',
            responsive,
            activityAnimation3,
            delay: const Duration(milliseconds: 1100),
          )
        ],
      ),
    );
  }

  Widget _activity(
    String hour,
    String late,
    String title,
    String description,
    Responsive responsive,
    AnimationController animationController, {
    Duration delay = const Duration(milliseconds: 700),
  }) {
    final animations = Tween<double>(begin: 500.0 * 1, end: 0.0).animate(
        CurvedAnimation(
            parent: animationController,
            curve: Curves.elasticInOut,
            reverseCurve: Curves.elasticIn));

    return AnimatedBuilder(
        animation: animationController,
        builder: (_, __) {
          return Transform.translate(
            offset: Offset(animations.value, 0),
            child: Container(
              margin: const EdgeInsets.only(top: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: responsive.widthR(3)),
                    width: responsive.widthR(20),
                    child: Column(
                      children: <Widget>[
                        Text(
                          hour,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(late,
                            style: TextStyle(
                                color: Colors.white.withOpacity(.5),
                                fontSize: 10,
                                fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(title,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w400)),
                        Text(description,
                            style: TextStyle(
                                color: Colors.white.withOpacity(.5),
                                fontSize: 12,
                                fontWeight: FontWeight.w400)),
                        const SizedBox(
                          height: 5,
                        ),
                        Divider(
                          color: Colors.white.withOpacity(.2),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  Widget _buttonOptions(Responsive responsive) {
    return Positioned(
      bottom: -90,
      right: -90,
      child: SizedBox(
        height: 270,
        width: 270,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stack(
              children: [
                AnimatedContainer(
                  height: pressed ? finalSize : initialSize,
                  width: pressed ? finalSize : initialSize,
                  duration: const Duration(milliseconds: 100),
                  decoration: const BoxDecoration(
                    color: Color(0xffF23363),
                    shape: BoxShape.circle,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            pressed = !pressed;
                            if (pressed) {
                              iconAnimation.forward();
                              Future.delayed(const Duration(milliseconds: 130),
                                  () {
                                optionAnimation.forward();
                                optionAnimationTween.forward();
                              });
                            } else {
                              iconAnimation.reverse();
                              optionAnimation.reverse();
                              optionAnimationTween.reverse();
                            }
                          });
                        },
                        child: AnimatedContainer(
                          height: 60,
                          width: 60,
                          alignment: Alignment.center,
                          duration: const Duration(milliseconds: 250),
                          decoration: BoxDecoration(
                            color: Color(pressed ? 0xffB7395D : 0xffF23363),
                            shape: BoxShape.circle,
                          ),
                          child: RotationTransition(
                              turns: Tween(begin: 0.0, end: .25)
                                  .animate(iconAnimation),
                              child: Icon(
                                  pressed
                                      ? CupertinoIcons.xmark
                                      : CupertinoIcons.plus,
                                  color: const Color(0xffFFFFFF))),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                    top: 35,
                    right: 120,
                    child: GestureDetector(
                      onTap: onPressButton,
                      child: AnimatedBuilder(
                          animation: CurvedAnimation(
                              curve: Curves.easeOut, parent: optionAnimation),
                          builder: (_, __) {
                            return Opacity(
                                opacity: optionAnimation.value,
                                child: AnimatedBuilder(
                                    animation: optionAnimationTween,
                                    builder: (_, __) {
                                      return Transform.translate(
                                        offset: Offset(0, animation.value),
                                        child: const Icon(Icons.edit_outlined,
                                            color: Color(0xffFFFFFF)),
                                      );
                                    }));
                          }),
                    )),
                Positioned(
                  left: 65,
                  top: 65,
                  child: GestureDetector(
                    onTap: onPressButton,
                    child: AnimatedBuilder(
                        animation: CurvedAnimation(
                            curve: Curves.easeOut, parent: optionAnimation),
                        builder: (_, __) {
                          return Opacity(
                              opacity: optionAnimation.value,
                              child: AnimatedBuilder(
                                  animation: optionAnimationTween,
                                  builder: (_, __) {
                                    return Transform.translate(
                                      offset: Offset(
                                          animation.value, animation.value),
                                      child: const Icon(Icons.message_outlined,
                                          color: Color(0xffFFFFFF)),
                                    );
                                  }));
                        }),
                  ),
                ),
                Positioned(
                  bottom: 120,
                  left: 35,
                  child: GestureDetector(
                    onTap: onPressButton,
                    child: AnimatedBuilder(
                        animation: CurvedAnimation(
                            curve: Curves.easeOut, parent: optionAnimation),
                        builder: (_, __) {
                          return Opacity(
                              opacity: optionAnimation.value,
                              child: AnimatedBuilder(
                                  animation: optionAnimationTween,
                                  builder: (_, __) {
                                    return Transform.translate(
                                      offset: Offset(animation.value, 0.0),
                                      child: const Icon(CupertinoIcons.clock,
                                          color: Color(0xffFFFFFF)),
                                    );
                                  }));
                        }),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void onPressButton() {
    dateAnimation.reverse();
    iconAnimation.reverse();
    optionAnimation.reverse();
    optionAnimationTween.reverse();
    activityAnimation.reverse();
    activityAnimation2.reverse();
    activityAnimation3.reverse();

    setState(() {
      pressed = false;
    });
    Future.delayed(const Duration(milliseconds: 1500), () async {
      callActivitiesAnimation();
    });
  }
}
