import 'package:flutter/material.dart';
import 'Tabs/cart_tab/cart_tab.dart';
import 'Tabs/category_tab/category_tab.dart';
import 'Tabs/home_tab/home_tab.dart';
import 'Tabs/profile_tab/profile_tab.dart';

class HomeViewModel extends ChangeNotifier {
  // hold data
  int currentIndex = 0;
  List<Widget> pages = [
    HomeTab(),
    CategoryTab(),
    CartTab(),
    ProfileTab(),
  ];

  // handle logic
  void setCurrentIndex(int index) {
    if (currentIndex != index) {
      currentIndex = index;
      notifyListeners();
    }
  }
}
