import 'package:flutter/material.dart';

class AppColors {
  static const primaryColor = Color(0xFF406fde); // Example primary color
  static const accentColor = Color(0xFF406fde); // Example accent color
  static const backgroundColor = Color(0xFFa7abe1);
  static const whitebackgroundColor = Color(0xFFFFFFFF);
  static const whiteColor = Color(0xFFFFFFFF);
  static const greyColor = Color(0xFFD9D9D9);
  static const blackColor = Color.fromARGB(255, 0, 0, 0);
  static const textColor = Color(0xFF406fde);
  static const neetColor = Color(0xFF416FDF);
  static const jeeColor = Color(0xFF088F8F);
  static const upscColor = Color(0xFFDF4141);
  static const orangeColor = Color(0xFFDF4141);
  static const caColor = Color(0xFFE59146);

  static const textNewColor = Color(0xFF3A3A3A);
  static const makeTimeTableBoxColor = Color(0xFF6CB1F5);
  static const feelingLowBoxColor = Color(0xFFF36371);
  static const demotivationBoxColor = Color(0xFFF3A54D);
  static const tipsBoxColor = Color(0xFF767EF4);
  static const formBgColor = Color(0xFFF9F9F9);

  static Decoration backtheme = BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Colors.lightBlue, // Light blue color
        Colors.blue, // Regular blue color
        Color.fromARGB(255, 0, 76, 153), // Dark blue shade (custom color)
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  );
}
