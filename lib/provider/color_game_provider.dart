import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class ColorGameProvider extends ChangeNotifier {
  ColorGameProvider();

  String getColorName() {
    List<String> colorNames = [
      'Red',
      'Blue',
      'Green',
      'Yellow',
      'Orange',
      'Purple',
      'Pink'
    ];

    String getRandomColorName() {
      Random random = Random();
      int index = random.nextInt(colorNames.length);
      return colorNames[index];
    }

    String randomColorName = getRandomColorName();

    print('Random Color Name: $randomColorName');
    return randomColorName;
  }

  String getColorCode() {
    List<String> colorCodes = [
      '0xffFF0000',
      '0xff0000FF',
      '0xff00FF00',
      '0xffFFFF00',
      '0xffFFA500',
      '0xff800080',
      '0xffFFC0CB'
    ];
    String getRandomColorCode() {
      Random random = Random();
      int index = random.nextInt(colorCodes.length);
      return colorCodes[index];
    }

    String randomColorCode = getRandomColorCode();

    print('Random Color Code: $randomColorCode');

    return randomColorCode;
  }

  updateColor(){
 Timer.periodic(const Duration(seconds: 3), (timer) {
  getColorCode();
  getColorName();

 });

  

 

  }
}
