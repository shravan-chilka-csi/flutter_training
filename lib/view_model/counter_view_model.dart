import 'package:flutter/material.dart';

class CounterViewModel extends ChangeNotifier {
  int counterOne = 0;
  int counterTwo = 0;

  void incrementCounterOne() {
    counterOne++;
    notifyListeners();
  }

  void incrementCounterTwo() {
    counterTwo++;
    notifyListeners();
  }
}
