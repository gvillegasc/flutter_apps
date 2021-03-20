import 'package:flutter/material.dart';

class NavigationProviderPp extends ChangeNotifier {
  PageController pageController = PageController(initialPage: 0);
  int actualPage = 0;

  void changePage(int value) {
    actualPage = value;
    pageController.animateToPage(value,
        duration: const Duration(milliseconds: 250), curve: Curves.easeOut);
    notifyListeners();
  }
}
