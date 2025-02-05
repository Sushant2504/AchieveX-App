import 'package:achievex/screens/QuestionBank/Exam/Chapterwise/logic.dart';
import 'package:achievex/screens/QuestionBank/Exam/Full-Test/all_questions.dart';
import 'package:achievex/screens/QuestionBank/Exam/Full-Test/JEE-ADVANCED/fulltest_result.dart';
import 'package:achievex/screens/QuestionBank/Exam/Full-Test/JEE-MAIN/fulltest_result.dart';
import 'package:achievex/screens/QuestionBank/NEET/full_test_neet_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:achievex/screens/QuestionBank/Exam/Full-Test/constants.dart';
import 'package:timer_count_down/timer_count_down.dart';

//tag colors........
List<Color> TagContainerbgcolor = [
  HexColor('#C9D8FF'),
  HexColor('#C7FFEE'),
  HexColor('#FFBEC4'),
];

List<Color> TagContainermainColor = [
  HexColor('#5C76FF'),
  HexColor('#01CB8F'),
  HexColor('#F36371'),
];

// backcolors......

List<Color> backcolor = [
  HexColor('#E1FFE8'),
  HexColor('#FFE0E0'),
  HexColor('#E9ECFF'),
];

List<Color> maincolor = [
  HexColor('#009B21'),
  HexColor('#BB1010'),
  HexColor('#5C76FF'),
];

//option section
List<Color> OptionColors = [
  HexColor('#446EDB'),
  HexColor('#FFFFFF'),
  HexColor('#009B21'),
];

List<List<Color>> _QuestionColor = [
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
   [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
];

//all ques info

final int _TotalQuestions = 180;
late int _QuestionNumber = 1;
late int _answered = 0;
late int _notanswered = 180;
late int _CorrectAnswered = 0;
late int _NotCorrectAnswered = 0;
late int _IncorrectAnswered = 0;
late int todolater = 0;

late int minutes;
late int seconds;

dynamic time;

// list of colors..

List<bool> _Answered = [
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
];

List<bool> _Correctanswered = [
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
];

List<bool> _NotCorrectanswered = [
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
];

List<bool> _todolater = [
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
];


List<bool> _checked = [
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
];

//



Color optionbgcolor = Colors.white;
Color optioniconbgcolor = HexColor('#FFFFFF');
Color optioniconcolor = HexColor('#446EDB');
bool check = true;
late double elapsedTime;
late String elapsedTimeStr;
late double? _remainingTime;

var marks;

//
final Color optioncardbgcolor = HexColor('#E1FFE8');

List<String> statusnames = [
  "Answered",
  "Not Answered",
  "To do later",
];

List<String> sampleoptiontext = [
  "sample",
  "sample",
  "sample",
  "sample",
];



List<String> Options = [
  'A',
  'B',
  'C',
  'D',
];

List<List<Color>> QNavigationcolor = [
  [HexColor('#E1FFE8'), HexColor('#005813')],
  [HexColor('#FFE0E0'), HexColor('#BB1010')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
];

List<List<String>> QuestionCount = [
  ["1", "2", "3", "4", "5"],
  ["6", "7", "8", "9", "10"],
  ["11", "12", "13", "14", "15"],
  ["16", "17", "18", "19", "20"],
  ["21", "22", "23", "24", "25"],
  ["26", "27", "28", "29", "30"],
  ["31", "32", "33", "34", "35"],
  ["36", "37", "38", "39", "40"],
  ["41", "42", "43", "44", "45"],
  ["46", "47", "48", "49", "50"],
  ["51", "52", "53", "54", "55"],
  ["56", "57", "58", "59", "60"],
  ["61", "62", "63", "64", "65"],
  ["66", "67", "68", "69", "70"],
  ["71", "72", "73", "74", "75"],
  ["76", "77", "78", "79", "80"],
  ["81", "82", "83", "84", "85"],
  ["86", "87", "88", "89", "90"],
  ["91", "92", "93", "94", "95"],
  ["96", "97", "98", "99", "100"],
  ["101", "102", "103", "104", "105"],
  ["106", "107", "108", "109", "110"],
  ["111", "112", "113", "114", "115"],
  ["116", "117", "118", "119", "120"],
  ["121", "122", "123", "124", "125"],
  ["126", "127", "128", "129", "130"],
  ["131", "132", "133", "134", "135"],
  ["136", "137", "138", "139", "140"],
  ["141", "142", "143", "144", "145"],
  ["146", "147", "148", "149", "150"],
  ["151", "152", "153", "154", "155"],
  ["156", "157", "158", "159", "160"],
  ["161", "162", "163", "164", "165"],
  ["166", "167", "168", "169", "170"],
  ["171", "172", "173", "174", "175"],
  ["176", "177", "178", "179", "180"]
];

List<List<int>> questioncount = [
  [1, 2, 3, 4, 5],
  [6, 7, 8, 9, 10],
  [11, 12, 13, 14, 15],
  [16, 17, 18, 19, 20],
  [21, 22, 23, 24, 25],
  [26, 27, 28, 29, 30],
  [31, 32, 33, 34, 35],
  [36, 37, 38, 39, 40],
  [41, 42, 43, 44, 45],
  [46, 47, 48, 49, 50],
  [51, 52, 53, 54, 55],
  [56, 57, 58, 59, 60],
  [61, 62, 63, 64, 65],
  [66, 67, 68, 69, 70],
  [71, 72, 73, 74, 75],
  [76, 77, 78, 79, 80],
  [81, 82, 83, 84, 85],
  [86, 87, 88, 89, 90],
  [91, 92, 93, 94, 95],
  [96, 97, 98, 99, 100],
  [101, 102, 103, 104, 105],
  [106, 107, 108, 109, 110],
  [111, 112, 113, 114, 115],
  [116, 117, 118, 119, 120],
  [121, 122, 123, 124, 125],
  [126, 127, 128, 129, 130],
  [131, 132, 133, 134, 135],
  [136, 137, 138, 139, 140],
  [141, 142, 143, 144, 145],
  [146, 147, 148, 149, 150],
  [151, 152, 153, 154, 155],
  [156, 157, 158, 159, 160],
  [161, 162, 163, 164, 165],
  [166, 167, 168, 169, 170],
  [171, 172, 173, 174, 175],
  [176, 177, 178, 179, 180],
];

List<List<bool>> _visited = [
  [false, false, false, false, false],
  [false, false, false, false, false],
  [false, false, false, false, false],
  [false, false, false, false, false],
  [false, false, false, false, false],
  [false, false, false, false, false],
  [false, false, false, false, false],
  [false, false, false, false, false],
  [false, false, false, false, false],
  [false, false, false, false, false],
  [false, false, false, false, false],
  [false, false, false, false, false],
  [false, false, false, false, false],
  [false, false, false, false, false],
  [false, false, false, false, false],
  [false, false, false, false, false],
  [false, false, false, false, false],
  [false, false, false, false, false],
  [false, false, false, false, false],
  [false, false, false, false, false],
  [false, false, false, false, false],
  [false, false, false, false, false],
  [false, false, false, false, false],
  [false, false, false, false, false],
  [false, false, false, false, false],
  [false, false, false, false, false],
  [false, false, false, false, false],
  [false, false, false, false, false],
  [false, false, false, false, false],
  [false, false, false, false, false],
  [false, false, false, false, false],
  [false, false, false, false, false],
  [false, false, false, false, false],
  [false, false, false, false, false],
  [false, false, false, false, false],
  [false, false, false, false, false],
];


class FullNeetExam extends StatefulWidget {
  final List<List<dynamic>> Set;

  FullNeetExam({required this.Set});

  @override
  _FullNeetExamState createState() => _FullNeetExamState();
}



class _FullNeetExamState extends State<FullNeetExam> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      drawer: CustomDrawer(height, width),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FrontRow(height, width),
              QuestionContainer(
                height,
                width,
              ),
              widget.Set[_QuestionNumber - 1][5]
                  ? QuestionImageContainer()
                  : Container(
                      height: 0,
                      width: 0,
                    ),
              widget.Set[_QuestionNumber - 1][11]
                  ? ImageoptionsContainer(height, width)
                  : TextOptionsContainer(height, width),
              const SizedBox(height: 40.0),
              InkWell(
                onTap: () {
                  setState(() {
                    marks = Marks(_CorrectAnswered, _NotCorrectAnswered);
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Fulltestneetresult(
                              paper: widget.Set,
                              Questioncolor: _QuestionColor,
                              marks: marks,
                              notanswered: _notanswered,
                              correctanswered: _CorrectAnswered,
                              incorrectanswered: _NotCorrectAnswered,
                              timetaken: elapsedTimeStr,
                              subject: "Neet",
                            )),
                  );
                },
                child: MainButton(height, width),
              ),
              const SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {

                        if (_QuestionNumber > 1) {
                          _QuestionNumber--;
                        }

                        if (_Answered[_QuestionNumber - 1] == false &&
                            _checked[_QuestionNumber - 1] == false) {
                          _notanswered--;
                          _checked[_QuestionNumber - 1] == true;
                        }
                        

                        print("decrement");
                      });
                    },
                    child: SmallButton(height, width, true,
                        "assets/images/back.png", "Previous"),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _todolater[_QuestionNumber - 1] = true;

                        if (_QuestionNumber < 180) {
                          _QuestionNumber++;
                        }


                        if (_Answered[_QuestionNumber - 1] == false &&
                            _checked[_QuestionNumber - 1] == false) {
                          _notanswered--;
                          _checked[_QuestionNumber - 1] == true;
                        } 

                        
                        todolater++;

                        print("Increment");
                      });
                    },
                    child: SmallButton(height, width, true,
                        "assets/images/do_it_later.png", "Do It Later"),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {

                        if (_QuestionNumber < 180) {
                          _QuestionNumber++;
                        }

                        if (_Answered[_QuestionNumber - 1] == false &&
                            _checked[_QuestionNumber - 1] == false) {
                          _notanswered--;
                          _checked[_QuestionNumber - 1] == true;
                        }


                      });

                      print("Increment");
                    },
                    child: SmallButton(height, width, false,
                        "assets/images/front.png", "Next"),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
            ],
          ),
        ),
      ),
    );
}


Widget QuestionImageContainer() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.15,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1.0),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Image.network(
          widget.Set[_QuestionNumber - 1][6],
          fit: BoxFit.cover,
          // color: Colors.white,
        ),
      ),
    );
  }



  //Frontrow
  Widget FrontRow(var height, var width) {
    return Container(
      height: height * 0.07,
      width: width,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: width * 0.45,
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 3.0),
                    child: Text(
                      "Single Choice",
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Poppins",
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SmallTagContainer(widget.Set[_QuestionNumber - 1][1],
                    TagContainerbgcolor[0], TagContainermainColor[0]),
                _countdown(TagContainerbgcolor[1], TagContainermainColor[1]),
                SmallTagContainer(
                    "Quite", TagContainerbgcolor[2], TagContainermainColor[2]),
              ],
            ),
          ),
        ],
      ),
    );
  }



  //optionscontainer
  Widget ImageoptionsContainer(var height, var width) {
    return Container(
      height: height * 0.5,
      width: width,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      optionnavigation[_QuestionNumber - 1][0][4] = true;

                      optionnavigation[_QuestionNumber - 1][1][4] = false;

                      optionnavigation[_QuestionNumber - 1][2][4] = false;

                      optionnavigation[_QuestionNumber - 1][3][4] = false;

                      if (widget.Set[_QuestionNumber - 1][17] == Options[0]) {
                        _Correctanswered[_QuestionNumber - 1] = true;
                        _CorrectAnswered++;

                        _QuestionColor[_QuestionNumber - 1] =
                            QNavigationcolor[2];
                      } else if (_NotCorrectanswered[_QuestionNumber - 1] ==
                          false) {
                        _NotCorrectanswered[_QuestionNumber - 1] = true;
                        _NotCorrectAnswered++;
                        _QuestionColor[_QuestionNumber - 1] =
                            QNavigationcolor[1];
                      }

                      if (_Answered[_QuestionNumber - 1] == false) {
                        _Answered[_QuestionNumber - 1] = true;
                        _answered++;
                      }
                    });
                  },
                  child: OptionBox(
                    height,
                    width,
                    Options[0],
                    widget.Set[_QuestionNumber - 1][12],
                    optionnavigation[_QuestionNumber - 1][0][0],
                    optionnavigation[_QuestionNumber - 1][0][1],
                    optionnavigation[_QuestionNumber - 1][0][2],
                    optionnavigation[_QuestionNumber - 1][0][3],
                    optionnavigation[_QuestionNumber - 1][0][4],
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      optionnavigation[_QuestionNumber - 1][0][4] = false;

                      optionnavigation[_QuestionNumber - 1][1][4] = true;

                      optionnavigation[_QuestionNumber - 1][2][4] = false;

                      optionnavigation[_QuestionNumber - 1][3][4] = false;

                      if (widget.Set[_QuestionNumber - 1][17] == Options[0]) {
                        _Correctanswered[_QuestionNumber - 1] = true;
                        _CorrectAnswered++;

                        _QuestionColor[_QuestionNumber - 1] =
                            QNavigationcolor[2];
                      } else if (_NotCorrectanswered[_QuestionNumber - 1] ==
                          false) {
                        _NotCorrectanswered[_QuestionNumber - 1] = true;
                        _NotCorrectAnswered++;
                        _QuestionColor[_QuestionNumber - 1] =
                            QNavigationcolor[1];
                      }

                      if (_Answered[_QuestionNumber - 1] == false) {
                        _Answered[_QuestionNumber - 1] = true;
                        _answered++;
                      }
                    });
                  },
                  child: OptionBox(
                    height,
                    width,
                    Options[1],
                    widget.Set[_QuestionNumber - 1][13],
                    optionnavigation[_QuestionNumber - 1][1][0],
                    optionnavigation[_QuestionNumber - 1][1][1],
                    optionnavigation[_QuestionNumber - 1][1][2],
                    optionnavigation[_QuestionNumber - 1][1][3],
                    optionnavigation[_QuestionNumber - 1][1][4],
                  ),
                ),
              ]),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      optionnavigation[_QuestionNumber - 1][0][4] = false;

                      optionnavigation[_QuestionNumber - 1][1][4] = false;

                      optionnavigation[_QuestionNumber - 1][2][4] = true;

                      optionnavigation[_QuestionNumber - 1][3][4] = false;

                      if (widget.Set[_QuestionNumber - 1][17] == Options[0]) {
                        _Correctanswered[_QuestionNumber - 1] = true;
                        _CorrectAnswered++;

                        _QuestionColor[_QuestionNumber - 1] =
                            QNavigationcolor[2];
                      } else if (_NotCorrectanswered[_QuestionNumber - 1] ==
                          false) {
                        _NotCorrectanswered[_QuestionNumber - 1] = true;
                        _NotCorrectAnswered++;
                        _QuestionColor[_QuestionNumber - 1] =
                            QNavigationcolor[1];
                      }

                      if (_Answered[_QuestionNumber - 1] == false) {
                        _Answered[_QuestionNumber - 1] = true;
                        _answered++;
                      }
                    });
                  },
                  child: OptionBox(
                    height,
                    width,
                    Options[2],
                    widget.Set[_QuestionNumber - 1][14],
                    optionnavigation[_QuestionNumber - 1][2][0],
                    optionnavigation[_QuestionNumber - 1][2][1],
                    optionnavigation[_QuestionNumber - 1][2][2],
                    optionnavigation[_QuestionNumber - 1][2][3],
                    optionnavigation[_QuestionNumber - 1][2][4],
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      optionnavigation[_QuestionNumber - 1][0][4] = false;

                      optionnavigation[_QuestionNumber - 1][1][4] = false;

                      optionnavigation[_QuestionNumber - 1][2][4] = false;

                      optionnavigation[_QuestionNumber - 1][3][4] = true;

                      if (widget.Set[_QuestionNumber - 1][17] == Options[0]) {
                        _Correctanswered[_QuestionNumber - 1] = true;
                        _CorrectAnswered++;

                        _QuestionColor[_QuestionNumber - 1] =
                            QNavigationcolor[2];
                      } else if (_NotCorrectanswered[_QuestionNumber - 1] ==
                          false) {
                        _NotCorrectanswered[_QuestionNumber - 1] = true;
                        _NotCorrectAnswered++;
                        _QuestionColor[_QuestionNumber - 1] =
                            QNavigationcolor[1];
                      }

                      if (_Answered[_QuestionNumber - 1] == false) {
                        _Answered[_QuestionNumber - 1] = true;
                        _answered++;
                      }
                    });
                  },
                  child: OptionBox(
                    height,
                    width,
                    Options[3],
                    widget.Set[_QuestionNumber - 1][15],
                    optionnavigation[_QuestionNumber - 1][3][0],
                    optionnavigation[_QuestionNumber - 1][3][1],
                    optionnavigation[_QuestionNumber - 1][3][2],
                    optionnavigation[_QuestionNumber - 1][3][3],
                    optionnavigation[_QuestionNumber - 1][3][4],
                  ),
                ),
              ]),
        ],
      ),
    );
  }



  //image option box ....
 Widget OptionBox(
    var height,
    var width,
    final String option,
    final String imageUrl,
    Color color1,
    Color color2,
    Color color3,
    Color color4,
    bool check,
  ) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 8.0, right: 8.0, top: 15.0, bottom: 15.0),
      child: Container(
        height: height * 0.20,
        width: width * 0.45,
        decoration: BoxDecoration(
          color: check ? color3 : color1,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: check ? color4 : color2,
                  child: CircleAvatar(
                    radius: 14,
                    child: Center(
                      child: Text(
                        option,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins",
                          color: check ? color1 : color2,
                        ),
                      ),
                    ),
                    backgroundColor: check ? color4 : color1,
                  ),
                ),
              ),
              Image.network(imageUrl),
            ]),
      ),
    );
  }



  //navigation bar....
  Widget TextOptionsContainer(var height, var width) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: height * 0.4,
        width: width,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
                onTap: () {
                  setState(() {

                    optionnavigation[_QuestionNumber - 1][0][4] = true;

                    optionnavigation[_QuestionNumber - 1][1][4] = false;

                    optionnavigation[_QuestionNumber - 1][2][4] = false;

                    optionnavigation[_QuestionNumber - 1][3][4] = false;

                    if (widget.Set[_QuestionNumber - 1][17] == Options[0]) {
                      _Correctanswered[_QuestionNumber - 1] = true;
                      _CorrectAnswered++;

                      _QuestionColor[_QuestionNumber - 1] = QNavigationcolor[2];
                    } else if (_NotCorrectanswered[_QuestionNumber - 1] ==
                        false) {
                      _NotCorrectanswered[_QuestionNumber - 1] = true;
                      _NotCorrectAnswered++;
                      _QuestionColor[_QuestionNumber - 1] = QNavigationcolor[1];
                    }

                    if (_Answered[_QuestionNumber - 1] == false) {
                      _Answered[_QuestionNumber - 1] = true;
                      _answered++;
                    }
                  
                    
                    
                  });
                },
                child: OptionCard(
                  height,
                  width,
                  Options[0],
                  widget.Set[_QuestionNumber - 1][7],
                  optionnavigation[_QuestionNumber - 1][0][0],
                  optionnavigation[_QuestionNumber - 1][0][1], 
                  optionnavigation[_QuestionNumber - 1][0][2],
                  optionnavigation[_QuestionNumber - 1][0][3],
                  optionnavigation[_QuestionNumber - 1][0][4],
                )),
            InkWell(
                onTap: () {
                  setState(() {
                    optionnavigation[_QuestionNumber - 1][0][4] = false;

                    optionnavigation[_QuestionNumber - 1][1][4] = true;

                    optionnavigation[_QuestionNumber - 1][2][4] = false;

                    optionnavigation[_QuestionNumber - 1][3][4] = false;

                    if (widget.Set[_QuestionNumber - 1][17] == Options[0]) {
                      _Correctanswered[_QuestionNumber - 1] = true;
                      _CorrectAnswered++;

                      _QuestionColor[_QuestionNumber - 1] = QNavigationcolor[2];
                    } else if (_NotCorrectanswered[_QuestionNumber - 1] ==
                        false) {
                      _NotCorrectanswered[_QuestionNumber - 1] = true;
                      _NotCorrectAnswered++;
                      _QuestionColor[_QuestionNumber - 1] = QNavigationcolor[1];
                    }

                    if (_Answered[_QuestionNumber - 1] == false) {
                      _Answered[_QuestionNumber - 1] = true;
                      _answered++;
                    }
                  });
                },
                child: OptionCard(
                  height,
                  width,
                  Options[1],
                  widget.Set[_QuestionNumber - 1][8],
                  optionnavigation[_QuestionNumber - 1][1][0],
                  optionnavigation[_QuestionNumber - 1][1][1],
                  optionnavigation[_QuestionNumber - 1][1][2],
                  optionnavigation[_QuestionNumber - 1][1][3],
                  optionnavigation[_QuestionNumber - 1][1][4],
                )),
            InkWell(
                onTap: () {
                  setState(() {
                    optionnavigation[_QuestionNumber - 1][0][4] = false;

                    optionnavigation[_QuestionNumber - 1][1][4] = false;

                    optionnavigation[_QuestionNumber - 1][2][4] = true;

                    optionnavigation[_QuestionNumber - 1][3][4] = false;

                    if (widget.Set[_QuestionNumber - 1][17] == Options[0]) {
                      _Correctanswered[_QuestionNumber - 1] = true;
                      _CorrectAnswered++;

                      _QuestionColor[_QuestionNumber - 1] = QNavigationcolor[2];
                    } else if (_NotCorrectanswered[_QuestionNumber - 1] ==
                        false) {
                      _NotCorrectanswered[_QuestionNumber - 1] = true;
                      _NotCorrectAnswered++;
                      _QuestionColor[_QuestionNumber - 1] = QNavigationcolor[1];
                    }

                    if (_Answered[_QuestionNumber - 1] == false) {
                      _Answered[_QuestionNumber - 1] = true;
                      _answered++;
                    }
                  });
                },
                child: OptionCard(
                  height,
                  width,
                  Options[2],
                  widget.Set[_QuestionNumber - 1][9],
                  optionnavigation[_QuestionNumber - 1][2][0],
                  optionnavigation[_QuestionNumber - 1][2][1],
                  optionnavigation[_QuestionNumber - 1][2][2],
                  optionnavigation[_QuestionNumber - 1][2][3],
                  optionnavigation[_QuestionNumber - 1][2][4],
                )),
            InkWell(
                onTap: () {
                  setState(() {
                    optionnavigation[_QuestionNumber - 1][0][4] = false;

                    optionnavigation[_QuestionNumber - 1][1][4] = false;

                    optionnavigation[_QuestionNumber - 1][2][4] = false;

                    optionnavigation[_QuestionNumber - 1][3][4] = true;

                    if (widget.Set[_QuestionNumber - 1][17] == Options[0]) {
                      _Correctanswered[_QuestionNumber - 1] = true;
                      _CorrectAnswered++;

                      _QuestionColor[_QuestionNumber - 1] = QNavigationcolor[2];
                    } else if (_NotCorrectanswered[_QuestionNumber - 1] ==
                        false) {
                      _NotCorrectanswered[_QuestionNumber - 1] = true;
                      _NotCorrectAnswered++;
                      _QuestionColor[_QuestionNumber - 1] = QNavigationcolor[1];
                    }

                    if (_Answered[_QuestionNumber - 1] == false) {
                      _Answered[_QuestionNumber - 1] = true;
                      _answered++;
                    }
                  });
                },
                child: OptionCard(
                  height,
                  width,
                  Options[3],
                  widget.Set[_QuestionNumber - 1][10],
                  optionnavigation[_QuestionNumber - 1][3][0],
                  optionnavigation[_QuestionNumber - 1][3][1],
                  optionnavigation[_QuestionNumber - 1][3][2],
                  optionnavigation[_QuestionNumber - 1][3][3],
                  optionnavigation[_QuestionNumber - 1][3][4],
                )),
          ],
        ),
      ),
    );
  }



  //optioncards
  Widget OptionCard(
    var height,
    var width,
    final String option,
    final String optiontext,
    Color color1,
    Color color2,
    Color color3,
    Color color4,
    bool check,
  ) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        height: height * 0.07,
        width: width * 0.9,
        decoration: BoxDecoration(
          color: check ? color3 : color1,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.grey),
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 21,
                  backgroundColor: check ? color4 : color2,
                  child: CircleAvatar(
                    radius: 20,
                    child: Center(
                      child: Text(
                        option,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins",
                          color: check ? color1 : color2,
                        ),
                      ),
                    ),
                    backgroundColor: check ? color4 : color1,
                  ),
                ),
              ),
              const SizedBox(width: 10.0),
              Text(
                optiontext,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  fontFamily: "Poppins",
                  color: Colors.black,
                ),
              ),
            ]),
      ),
    );
  }

  //QueationContainer
  Widget QuestionContainer(var height, var width) {
    return Container(
      height: height * 0.18,
      width: width * 0.9,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 3,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.Set[_QuestionNumber - 1][0],
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Poppins",
                      color: Colors.black,
                    ),
                  ),
                  CircleAvatar(
                    radius: 3,
                    backgroundColor: Colors.black,
                  ),
                  Text(
                    " Question ${widget.Set[_QuestionNumber - 1][2]}",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Poppins",
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 2.0),
            Center(
              child: Text(
                widget.Set[_QuestionNumber - 1][3],
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  fontFamily: "Poppins",
                  color: Colors.black,
                ),
              ),
            ),
          ]),
    );
  }

  // info tags ...

  Widget _countdown(Color bgcolor, Color _color) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        height: 20,
        width: 55,
        decoration: BoxDecoration(
          color: bgcolor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Countdown(
          seconds: 3 * 60 * 60, // 3 hours in seconds
          build: (BuildContext context, double time) {
            _remainingTime = time;
            int hours = (time / 3600).floor();
            int minutes = ((time - (hours * 3600)) / 60).floor();
            int seconds = (time - (hours * 3600) - (minutes * 60)).toInt();

            double elapsedTime = 3600 - _remainingTime!;

            // Format elapsed time (optional)
            int elapsedMinutes = (elapsedTime ~/ 60).toInt();
            int elapsedSeconds = (elapsedTime % 60).toInt();
            elapsedTimeStr =
                '${elapsedMinutes.toString().padLeft(2, '0')}:${elapsedSeconds.toString().padLeft(2, '0')}';
            return Center(
              child: Text(
                '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}',
                style: TextStyle(
                  color: _color,
                  fontSize: 8,
                  fontWeight: FontWeight.normal,
                ),
              ),
            );
          },
          interval: const Duration(milliseconds: 100),
          onFinished: (dynamic time) {
            setState(() {
              marks = Marks(_CorrectAnswered, _NotCorrectAnswered);
            });
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Fulltestneetresult(
                        paper: widget.Set,
                        Questioncolor: _QuestionColor,
                        marks: marks,
                        notanswered: _notanswered,
                        correctanswered: _CorrectAnswered,
                        incorrectanswered: _NotCorrectAnswered,
                        timetaken: elapsedTimeStr,
                        subject: "Neet",
                      )),
            );
          },
        ),
      ),
    );
  }

  Widget BigTagContainer(String text, Color bgcolor, Color color) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        height: 25,
        width: 120,
        decoration: BoxDecoration(
          color: bgcolor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              fontFamily: "Poppins",
              color: color,
            ),
          ),
        ),
      ),
    );
  }

  Widget SmallTagContainer(String text, Color bgcolor, Color color) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        height: 20,
        width: 55,
        decoration: BoxDecoration(
          color: bgcolor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 8,
              fontWeight: FontWeight.normal,
              fontFamily: "Poppins",
              color: color,
            ),
          ),
        ),
      ),
    );
  }

  //Diffferent Buttons
  Widget MainButton(var height, var width) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 60,
        width: width * 0.9,
        decoration: BoxDecoration(
          color: HexColor('#5C76FF'),
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // Shadow color
              spreadRadius: 3, // How much the shadow spreads
              blurRadius: 3, // How blurry the shadow is
              offset: Offset(0, 3), // Changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(4.0),
              child: Image.asset(
                "assets/images/send.png",
                height: 40,
                width: 40,
              ),
            ),
            const SizedBox(width: 2.0),
            Center(
              child: Text(
                "Submit",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //small buttonns....

  Widget SmallButton(
      var height, var width, bool top, final String imageUrl, String text) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        height: height * 0.065,
        width: width * 0.28,
        decoration: BoxDecoration(
          color: HexColor('#5C76FF'),
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            top
                ? Image.asset(
                    imageUrl,
                    height: 25,
                    width: 25,
                  )
                : SizedBox(height: 0),
            Center(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  fontFamily: "Poppins",
                  color: Colors.black,
                ),
              ),
            ),
            top
                ? SizedBox(height: 0)
                : Image.asset(
                    imageUrl,
                    height: 25,
                    width: 25,
                  ),
          ],
        ),
      ),
    );
  }

  //custom drawer......
  Widget CustomDrawer(var height, var width) {
    return SingleChildScrollView(
      child: Container(
        width: width * 0.8,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 8.0),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 25.0, right: 20.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/images/cross.png',
                      height: 15,
                      width: 15,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 4.0,
            ),

            //upper tags
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Image.asset(
                        'assets/images/set.png',
                        width: 30,
                        height: 30,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 4.0),
                    Text(
                      "Chapter",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Poppins",
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AllQuestions(
                                  paper: widget.Set,
                                )));
                  },
                  child: TagContainer(
                      height, width, "Question Paper", "assets/images/tag.png"),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      'instructionscreen',
                    );
                  },
                  child: TagContainer(
                      height, width, "Instructions", "assets/images/tag.png"),
                ),
              ],
            ),

            const SizedBox(
              height: 20.0,
            ),

            //status indicators

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Image.asset(
                        "assets/images/tag.png",
                        width: 30,
                        height: 30,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 4.0,
                    ),
                    Text(
                      "Status Indicators",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Poppins",
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    StatusCard(height, width, backcolor[0], maincolor[0],
                        statusnames[0], _answered),
                    StatusCard(height, width, backcolor[1], maincolor[1],
                        statusnames[1], _notanswered),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 6.0,
                    ),
                    StatusCard(height, width, backcolor[2], maincolor[2],
                        statusnames[2], todolater),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 20.0),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Image.asset(
                        "assets/images/ques_navigation.png",
                        height: 20,
                        width: 20,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      "Question Navigation",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Poppins",
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                  ],
                ),
                const SizedBox(height: 5.0),
                Center(
                  child:
                      BigTagContainer("Physics", Colors.orange, Colors.white),
                ),
                const SizedBox(height: 10.0),
                QuestionMenu1(height, width),
                const SizedBox(
                  height: 10.0,
                ),
                Center(
                  child:
                      BigTagContainer("Chemistry", Colors.green, Colors.white),
                ),
                QuestionMenu2(height, width),
                const SizedBox(
                  height: 10.0,
                ),
                Center(
                  child: BigTagContainer("Botany", Colors.blue, Colors.white),
                ),
                QuestionMenu3(height, width),
                const SizedBox(
                  height: 10.0,
                ),
                Center(
                  child: BigTagContainer("Zoology",
                      const Color.fromARGB(255, 236, 107, 187), Colors.white),
                ),
                QuestionMenu4(height, width),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget QuestionMenu1(var height, var width) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: width * 0.8,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 3,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            QuestionRow(height, width, QuestionCount[0], questioncount[0]),
            QuestionRow(height, width, QuestionCount[1], questioncount[1]),
            QuestionRow(height, width, QuestionCount[2], questioncount[2]),
            QuestionRow(height, width, QuestionCount[3], questioncount[3]),
            QuestionRow(height, width, QuestionCount[4], questioncount[4]),
            QuestionRow(height, width, QuestionCount[5], questioncount[5]),
            QuestionRow(height, width, QuestionCount[6], questioncount[6]),
            QuestionRow(height, width, QuestionCount[7], questioncount[7]),
            QuestionRow(height, width, QuestionCount[8], questioncount[8]),
          ],
        ),
      ),
    );
  }

  Widget QuestionMenu2(var height, var width) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: width * 0.8,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // Shadow color
              spreadRadius: 3, // How much the shadow spreads
              blurRadius: 3, // How blurry the shadow is
              offset: Offset(0, 3), // Changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            QuestionRow(height, width, QuestionCount[9], questioncount[9]),
            QuestionRow(height, width, QuestionCount[10], questioncount[10]),
            QuestionRow(height, width, QuestionCount[11], questioncount[11]),
            QuestionRow(height, width, QuestionCount[12], questioncount[12]),
            QuestionRow(height, width, QuestionCount[13], questioncount[13]),
            QuestionRow(height, width, QuestionCount[14], questioncount[14]),
            QuestionRow(height, width, QuestionCount[15], questioncount[15]),
            QuestionRow(height, width, QuestionCount[16], questioncount[16]),
            QuestionRow(height, width, QuestionCount[17], questioncount[17]),
          ],
        ),
      ),
    );
  }

  Widget QuestionMenu3(var height, var width) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: width * 0.8,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // Shadow color
              spreadRadius: 3, // How much the shadow spreads
              blurRadius: 3, // How blurry the shadow is
              offset: Offset(0, 3), // Changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            QuestionRow(height, width, QuestionCount[18], questioncount[18]),
            QuestionRow(height, width, QuestionCount[19], questioncount[19]),
            QuestionRow(height, width, QuestionCount[20], questioncount[20]),
            QuestionRow(height, width, QuestionCount[21], questioncount[21]),
            QuestionRow(height, width, QuestionCount[22], questioncount[22]),
            QuestionRow(height, width, QuestionCount[23], questioncount[23]),
            QuestionRow(height, width, QuestionCount[24], questioncount[24]),
            QuestionRow(height, width, QuestionCount[25], questioncount[25]),
            QuestionRow(height, width, QuestionCount[26], questioncount[26]),
          ],
        ),
      ),
    );
  }

  Widget QuestionMenu4(var height, var width) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: width * 0.8,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // Shadow color
              spreadRadius: 3, // How much the shadow spreads
              blurRadius: 3, // How blurry the shadow is
              offset: Offset(0, 3), // Changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            QuestionRow(height, width, QuestionCount[27], questioncount[27]),
            QuestionRow(height, width, QuestionCount[28], questioncount[28]),
            QuestionRow(height, width, QuestionCount[29], questioncount[29]),
            QuestionRow(height, width, QuestionCount[30], questioncount[30]),
            QuestionRow(height, width, QuestionCount[31], questioncount[31]),
            QuestionRow(height, width, QuestionCount[32], questioncount[32]),
            QuestionRow(height, width, QuestionCount[33], questioncount[33]),
            QuestionRow(height, width, QuestionCount[34], questioncount[34]),
            QuestionRow(height, width, QuestionCount[35], questioncount[35]),

          ],
        ),
      ),
    );
  }

  Widget QuestionRow(
      var height, var width, List<String> count, List<int> questionCount) {
    return Container(
      height: 70,
      width: width * 0.7,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SquareContainer(
            height,
            width,
            count[0],
            _Answered[questionCount[0] - 1],
            _todolater[questionCount[0] - 1],
            questionCount[0],
          ),
          SquareContainer(
            height,
            width,
            count[1],
            _Answered[questionCount[1] - 1],
            _todolater[questionCount[1] - 1],
            questionCount[1],
          ),
          SquareContainer(
            height,
            width,
            count[2],
            _Answered[questionCount[2] - 1],
            _todolater[questionCount[2] - 1],
            questionCount[2],
          ),
          SquareContainer(
            height,
            width,
            count[3],
            _Answered[questionCount[3] - 1],
            _todolater[questionCount[3] - 1],
            questionCount[3],
          ),
          SquareContainer(
            height,
            width,
            count[4],
            _Answered[questionCount[4] - 1],
            _todolater[questionCount[4] - 1],
            questionCount[4],
          ),
        ],
      ),
    );
  }

  Widget SquareContainer(var height, var width, String text, bool check1,
      bool check2, int questionnumber) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: InkWell(
        onTap: () {
          setState(() {
            _QuestionNumber = questionnumber;
          });
        },
        child: Container(
          height: height * 0.06,
          width: width * 0.12,
          decoration: BoxDecoration(
            color: check2
                ? QNavigationcolor[2][0]
                : (check1 ? QNavigationcolor[0][0] : QNavigationcolor[1][0]),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                fontFamily: "Poppins",
                color: check2
                    ? QNavigationcolor[2][1]
                    : (check1
                        ? QNavigationcolor[0][1]
                        : QNavigationcolor[1][1]),
              ),
            ),
          ),
        ),
      ),
    );
  }

  //statuscard section........
  Widget StatusCard(var height, var width, Color bgcolor, Color sidecolor,
      String text, int count) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 60,
        width: 130,
        decoration: BoxDecoration(
          color: bgcolor,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 60,
              width: 10,
              decoration: BoxDecoration(
                color: sidecolor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(
              width: 8.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold,
                      color: sidecolor,
                    ),
                  ),
                ),
                Text(
                  count.toString(),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Poppins",
                    color: sidecolor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget TagContainer(var height, var width, String text, String imagepath) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        width: width * 0.7,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // Shadow color
              spreadRadius: 2, // How much the shadow spreads
              blurRadius: 2, // How blurry the shadow is
              offset: Offset(0, 3), // Changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: width * 0.5,
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(4.0),
              child: Image.asset('assets/images/tag.png'),
            ),
          ],
        ),
      ),
    );
  }
}
