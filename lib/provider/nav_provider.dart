import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/category/category_screen.dart';
import 'package:flutter_application_1/screens/homepage/home_page.dart';
import 'package:flutter_application_1/screens/yourbag/your_bag_screen.dart';

class NavbarViewModel with ChangeNotifier {
  final PageController _pageController = PageController(initialPage: 0);
  int _navIndex = 0;
  final List<Widget> _pages = [
    HomePage(),
    CategoryScreen(),
    YourBagScreen(),
  ];

  int get getIndex => _navIndex;
  PageController get pageController => _pageController;
  List<Widget> get pages => _pages;

  changeIndex(index) {
    _navIndex = index;
    notifyListeners();
  }
}
