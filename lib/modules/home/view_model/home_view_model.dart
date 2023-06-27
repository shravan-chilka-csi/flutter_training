import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  int currentIndex = 0;

  void onPageChangeEvent(int value) {
    currentIndex = value;
    notifyListeners();
  }
}
