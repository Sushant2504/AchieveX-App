import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {


  static showToast(String message) {
    Fluttertoast.showToast(msg: message);
  }
 
  static void showFlushbar(String message, BuildContext context) {
    showFlushbar(
      message,
      context,
    );
  }

  
}
