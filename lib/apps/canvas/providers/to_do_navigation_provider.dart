import 'package:flutter/material.dart';

class ToDoNavigationProvider with ChangeNotifier {
  final PageController _pageController = PageController(initialPage: 0);
  int _actualPage = 0;

  PageController get pageController => _pageController;
  int get actualPage => _actualPage;

  set actualPage(int value) {
    _actualPage = value;
    _pageController.animateToPage(value,
        duration: const Duration(milliseconds: 250), curve: Curves.easeOut);
    notifyListeners();
  }
}
