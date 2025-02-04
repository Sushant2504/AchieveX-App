import 'dart:math';

import 'package:flutter/material.dart';

class SchulteTableProvider extends ChangeNotifier {
  SchulteTableProvider();
  bool isStart = false;
  late int selectedNumber = 1;

  late final List<int> _randomizedList = [];

  List<int> get randomizedList => _randomizedList;

  List<int> list = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25
  ];
  bool startGame() {
    isStart = true;
    if (isStart) {
      isStart = true;
    }
    return isStart;
  }

  void countResult() {
    selectedNumber++;
    notifyListeners();
  }

  List<int> randomList() {
    List<int> randomizedList = List.from(list);
    Random random = Random();

    for (int i = randomizedList.length - 1; i > 0; i--) {
      int j = random.nextInt(i + 1);
      int temp = randomizedList[i];
      randomizedList[i] = randomizedList[j];
      randomizedList[j] = temp;
    }
    notifyListeners();

    return randomizedList;
  }
}
