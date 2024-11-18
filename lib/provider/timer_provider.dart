import 'dart:async';

import 'package:flutter/material.dart';

class TimerProvider extends ChangeNotifier {
  String hoursString = "00", minuteString = "00", secondString = "00";

  int hours = 0, minutes = 0, seconds = 0;
  bool isTimerRunning = false, isResetButtonVisible = false;
  bool is1MinChallenge = false;
  late Timer _timer;

  void startTimer() {
    isTimerRunning = true;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _startSecond();
    });
  }

    void startRTimer() {
    isTimerRunning = true;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _startRSecond();
    });
  }

  void pauseTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
    });
    _timer.cancel();

    isTimerRunning = false;
    notifyListeners();

    isResetButtonVisible = checkValues();
  }

   void _startRSecond() {
    seconds = 60;
    notifyListeners();
    if (seconds > 59) {
      seconds--;

      // secondString = seconds.toString();
      // if (secondString.length == 1) {
      //   secondString = "0$secondString";
      // }
    } else {
      // _startMinute();
    }
  }

  void _startSecond() {
    notifyListeners();
    if (seconds < 59) {
      seconds++;

      secondString = seconds.toString();
      if (secondString.length == 1) {
        secondString = "0$secondString";
      }
    } else {
      _startMinute();
    }
  }

  void _startMinute() {
    notifyListeners();

    if (minutes < 59) {
      seconds = 0;
      secondString = "00";
      minutes++;
      minuteString = minutes.toString();
      if (minuteString.length == 1) {
        minuteString = "0$minuteString";
      }
    } else {
      _starHour();
    }
  }

  void _starHour() {
    seconds = 0;
    minutes = 0;
    secondString = "00";
    minuteString = "00";
    hours++;
    hoursString = hours.toString();
    if (hoursString.length == 1) {
      hoursString = "0$hoursString";
    }
    notifyListeners();
  }

  void resetTimer() {
_timer = Timer.periodic(const Duration(seconds: 1), (timer) {
     
    });
    _timer.cancel();

    seconds = 0;
    minutes = 0;
    hours = 0;
    secondString = "00";
    minuteString = "00";
    hoursString = "00";
    isResetButtonVisible = false;
    notifyListeners();
  }

  bool checkValues() {
    if (seconds != 0 || minutes != 0 || hours != 0) {
      return true;
    } else {
      return false;
    }
  }
}
