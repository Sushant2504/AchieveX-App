import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class AppColors {
  static const primaryColor = Color(0x00416fdf); // Example primary color
  static const accentColor = Color(0x00416fdf); // Example accent color
  static const backgroundColor = Color(0x006875e0); // Example background color
  static const whiteColor = Color.fromARGB(255, 255, 255, 255);
  // Add more colors as needed
}


ThemeData appTheme = ThemeData(
  primaryColor: AppColors.primaryColor,
 scaffoldBackgroundColor: AppColors.backgroundColor

);

final defaultPinTheme = PinTheme(
      width: 56,
      height: 60,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Colors.black,
      ),
      decoration: BoxDecoration(
        color: Colors.blue.shade100,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.transparent),
    ),
);



