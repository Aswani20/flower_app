import 'package:flower_app/project_layers/presentation_layer/home/Tabs/cart_tab/cart_tab.dart';
import 'package:flower_app/project_layers/presentation_layer/home/Tabs/category_tab/category_tab.dart';
import 'package:flower_app/project_layers/presentation_layer/home/Tabs/home_tab/home_tab.dart';
import 'package:flower_app/project_layers/presentation_layer/home/Tabs/profile_tab/profile_tab.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  // hold data
  int currentIndex = 0;
  List<Widget> pages = [HomeTab(), CategoryTab(), CartTab(), ProfileTab()];

  // handle logic
  void setCurrentIndex(int index) {
    if (currentIndex != index) {
      currentIndex = index;
      notifyListeners();
    }
  }
}
