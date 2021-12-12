import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FloatingMenuOptions extends StatefulWidget {
  const FloatingMenuOptions({
    Key? key,
    required this.firstOptionIcon,
    required this.firstOptionAction,
    required this.secondOptionIcon,
    required this.secondOptionAction,
    required this.thirdOptionIcon,
    required this.thirdOptionAction,
  }) : super(key: key);

  final IconData firstOptionIcon;
  final VoidCallback firstOptionAction;
  final IconData secondOptionIcon;
  final VoidCallback secondOptionAction;
  final IconData thirdOptionIcon;
  final VoidCallback thirdOptionAction;

  @override
  _FloatingMenuOptionsState createState() => _FloatingMenuOptionsState();
}

class _FloatingMenuOptionsState extends State<FloatingMenuOptions>
    with TickerProviderStateMixin {
  double _initialSize = 60;
  double _finalSize = 270;
  bool _isPressed = false;

  late Animation<double> _sizeAnimation;

  late AnimationController _iconAnimation;
  late AnimationController _optionAnimation;
  late AnimationController _optionAnimationTween;

  @override
  void initState() {
    super.initState();

    _iconAnimation = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 100,
      ),
    );
    _optionAnimation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 50),
      reverseDuration: const Duration(
        milliseconds: 10,
      ),
    );
    _optionAnimationTween = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
      reverseDuration: const Duration(
        milliseconds: 10,
      ),
    );

    _sizeAnimation = Tween<double>(begin: 50.0 * 1, end: 0.0).animate(
      CurvedAnimation(
        parent: _optionAnimationTween,
        curve: Curves.elasticOut,
      ),
    );
  }

  void _onPressButton() {
    _iconAnimation.reverse();
    _optionAnimation.reverse();
    _optionAnimationTween.reverse();

    setState(() {
      _isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                  height: _isPressed ? _finalSize : _initialSize,
                  width: _isPressed ? _finalSize : _initialSize,
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
                            _isPressed = !_isPressed;
                            if (_isPressed) {
                              _iconAnimation.forward();
                              Future.delayed(const Duration(milliseconds: 130),
                                  () {
                                _optionAnimation.forward();
                                _optionAnimationTween.forward();
                              });
                            } else {
                              _iconAnimation.reverse();
                              _optionAnimation.reverse();
                              _optionAnimationTween.reverse();
                            }
                          });
                        },
                        child: AnimatedContainer(
                          height: 60,
                          width: 60,
                          alignment: Alignment.center,
                          duration: const Duration(milliseconds: 250),
                          decoration: BoxDecoration(
                            color: Color(_isPressed ? 0xffB7395D : 0xffF23363),
                            shape: BoxShape.circle,
                          ),
                          child: RotationTransition(
                              turns: Tween(begin: 0.0, end: .25)
                                  .animate(_iconAnimation),
                              child: Icon(
                                  _isPressed
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
                    onTap: () {
                      _onPressButton();
                      widget.firstOptionAction();
                    },
                    child: AnimatedBuilder(
                      animation: CurvedAnimation(
                        curve: Curves.easeOut,
                        parent: _optionAnimation,
                      ),
                      builder: (_, __) {
                        return Opacity(
                          opacity: _optionAnimation.value,
                          child: AnimatedBuilder(
                            animation: _optionAnimationTween,
                            builder: (_, __) {
                              return Transform.translate(
                                offset: Offset(0, _sizeAnimation.value),
                                child: Icon(widget.firstOptionIcon,
                                    color: Color(0xffFFFFFF)),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Positioned(
                  left: 65,
                  top: 65,
                  child: GestureDetector(
                    onTap: () {
                      _onPressButton();
                      widget.secondOptionAction();
                    },
                    child: AnimatedBuilder(
                      animation: CurvedAnimation(
                        curve: Curves.easeOut,
                        parent: _optionAnimation,
                      ),
                      builder: (_, __) {
                        return Opacity(
                          opacity: _optionAnimation.value,
                          child: AnimatedBuilder(
                            animation: _optionAnimationTween,
                            builder: (_, __) {
                              return Transform.translate(
                                offset: Offset(
                                    _sizeAnimation.value, _sizeAnimation.value),
                                child: Icon(widget.secondOptionIcon,
                                    color: Color(0xffFFFFFF)),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Positioned(
                  bottom: 120,
                  left: 35,
                  child: GestureDetector(
                    onTap: () {
                      _onPressButton();
                      widget.thirdOptionAction();
                    },
                    child: AnimatedBuilder(
                      animation: CurvedAnimation(
                          curve: Curves.easeOut, parent: _optionAnimation),
                      builder: (_, __) {
                        return Opacity(
                          opacity: _optionAnimation.value,
                          child: AnimatedBuilder(
                            animation: _optionAnimationTween,
                            builder: (_, __) {
                              return Transform.translate(
                                offset: Offset(_sizeAnimation.value, 0.0),
                                child: Icon(widget.thirdOptionIcon,
                                    color: Color(0xffFFFFFF)),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
