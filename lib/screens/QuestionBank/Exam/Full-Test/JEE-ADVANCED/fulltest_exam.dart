import 'package:achievex/screens/QuestionBank/Exam/Full-Test/JEE-ADVANCED/fulltest_result.dart';
import 'package:achievex/screens/QuestionBank/Exam/Full-Test/JEE-MAIN/fulltest_result.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:achievex/screens/QuestionBank/Exam/Chapterwise/constants.dart';
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

// answered questions record...

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
];

// todolater records ....

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
];

//all ques info
late int _TotalQuestions = 30;
late int _QuestionNumber = 1;
List<bool> _answered = List.filled(30, false);
late int _Answer = 0;
late int _NotAnswered = _TotalQuestions - _Answer;
late int _CorrectAnswered = 0;
late int _IncorrectAnswered = _TotalQuestions - _CorrectAnswered;
late int todolater = 0;
late int minutes;
late int seconds;

dynamic time;

// list of colors..

List<List<Color>> ColorMenu = [
  [HexColor('#5C76FF'), HexColor('#D8DEFF')],
  [HexColor('#5C76FF'), HexColor('#D8DEFF')],
  [HexColor('#5C76FF'), HexColor('#D8DEFF')],
  [HexColor('#5C76FF'), HexColor('#D8DEFF')],
  [HexColor('#5C76FF'), HexColor('#D8DEFF')],
  [HexColor('#5C76FF'), HexColor('#D8DEFF')],
  [HexColor('#5C76FF'), HexColor('#D8DEFF')],
  [HexColor('#5C76FF'), HexColor('#D8DEFF')],
  [HexColor('#5C76FF'), HexColor('#D8DEFF')],
  [HexColor('#5C76FF'), HexColor('#D8DEFF')],
  [HexColor('#5C76FF'), HexColor('#D8DEFF')],
  [HexColor('#5C76FF'), HexColor('#D8DEFF')],
  [HexColor('#5C76FF'), HexColor('#D8DEFF')],
  [HexColor('#5C76FF'), HexColor('#D8DEFF')],
  [HexColor('#5C76FF'), HexColor('#D8DEFF')],
  [HexColor('#5C76FF'), HexColor('#D8DEFF')],
  [HexColor('#5C76FF'), HexColor('#D8DEFF')],
  [HexColor('#5C76FF'), HexColor('#D8DEFF')],
  [HexColor('#5C76FF'), HexColor('#D8DEFF')],
  [HexColor('#5C76FF'), HexColor('#D8DEFF')],
  [HexColor('#5C76FF'), HexColor('#D8DEFF')],
  [HexColor('#5C76FF'), HexColor('#D8DEFF')],
  [HexColor('#5C76FF'), HexColor('#D8DEFF')],
  [HexColor('#5C76FF'), HexColor('#D8DEFF')],
  [HexColor('#5C76FF'), HexColor('#D8DEFF')],
  [HexColor('#5C76FF'), HexColor('#D8DEFF')],
  [HexColor('#5C76FF'), HexColor('#D8DEFF')],
  [HexColor('#5C76FF'), HexColor('#D8DEFF')],
  [HexColor('#5C76FF'), HexColor('#D8DEFF')],
  [HexColor('#5C76FF'), HexColor('#D8DEFF')],
];

Color optionbgcolor = Colors.white;
Color optioniconbgcolor = HexColor('#FFFFFF');
Color optioniconcolor = HexColor('#446EDB');
bool check = true;

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
];

//question navigator colors....
List<List<Color>> QNavigationcolor = [
  [HexColor('#E1FFE8'), HexColor('#005813')],
  [HexColor('#FFE0E0'), HexColor('#BB1010')],
  [HexColor('#E9ECFF'), HexColor('#5C76FF')],
];

// visited indicator list.....
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
  [false, false, false, false, false], // Hier habe ich "versteckt" hinzugefügt
  [false, false, false, false, false],
];

List<List<dynamic>> _null = [
  [],
];

class FullJeeAdvancedExam extends StatefulWidget {
  List<List<dynamic>> paper;

  FullJeeAdvancedExam({
     required this.paper,
  });

  @override
  _FullJeeAdvancedExamState createState() => _FullJeeAdvancedExamState();
}

class _FullJeeAdvancedExamState extends State<FullJeeAdvancedExam> {
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
              TextOptionsContainer(height, width),
              const SizedBox(height: 40.0),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => fulltestjeeadvancedresult()),
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
                      setState() {
                        if (_QuestionNumber > 1) {
                          _QuestionNumber--;
                        }
                        print("decrement");
                      }
                    },
                    child: SmallButton(height, width, true,
                        "assets/images/back.png", "Previous"),
                  ),
                  InkWell(
                    onTap: () {
                      setState() {
                        _QuestionNumber++;
                      }
                    },
                    child: SmallButton(height, width, true,
                        "assets/images/do_it_later.png", "Do It Later"),
                  ),
                  InkWell(
                    onTap: () {
                      if (_QuestionNumber < 30) {
                        _QuestionNumber++;
                      }

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
                SmallTagContainer("subject", TagContainerbgcolor[0],
                    TagContainermainColor[0]),
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

  //optionscontainer.....

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
                OptionBox(height, width, Options[0], "yes"),
                OptionBox(height, width, Options[1], "yes"),
              ]),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                OptionBox(height, width, Options[2], "yes"),
                OptionBox(height, width, Options[3], "yes"),
              ]),
        ],
      ),
    );
  }

  //image option box ....

  Widget OptionBox(
      var height, var width, final String option, final String imageUrl) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: height * 0.25,
        width: width * 0.3,
        decoration: BoxDecoration(
          color: Colors.white,
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
            CircleAvatar(
              radius: 20,
              child: Text(
                option,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: "Poopins",
                  fontWeight: FontWeight.bold,
                  color: OptionColors[0],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

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
                    optionnavigation[_QuestionNumber - 1][0][0] =
                        HexColor('#E1FFE8');
                    optionnavigation[_QuestionNumber - 1][0][1] =
                        HexColor('#009B21');
                    optionnavigation[_QuestionNumber - 1][0][2] =
                        HexColor('#FFFFFF');
                    optionnavigation[_QuestionNumber - 1][0][3] = false;
                    optionnavigation[_QuestionNumber - 1][1][0] = Colors.white;
                    optionnavigation[_QuestionNumber - 1][1][1] =
                        HexColor('#FFFFFF');
                    optionnavigation[_QuestionNumber - 1][1][2] =
                        HexColor('#446EDB');
                    optionnavigation[_QuestionNumber - 1][1][3] = true;
                    optionnavigation[_QuestionNumber - 1][2][0] = Colors.white;
                    optionnavigation[_QuestionNumber - 1][2][1] =
                        HexColor('#FFFFFF');
                    optionnavigation[_QuestionNumber - 1][2][2] =
                        HexColor('#446EDB');
                    optionnavigation[_QuestionNumber - 1][2][3] = true;
                    optionnavigation[_QuestionNumber - 1][3][0] = Colors.white;
                    optionnavigation[_QuestionNumber - 1][3][1] =
                        HexColor('#FFFFFF');
                    optionnavigation[_QuestionNumber - 1][3][2] =
                        HexColor('#446EDB');
                    optionnavigation[_QuestionNumber - 1][3][3] = true;

                    _Answer++;
                  });
                },
                child: OptionCard(
                  height,
                  width,
                  Options[0],
                  sampleoptiontext[0],
                  optionnavigation[_QuestionNumber - 1][0][0],
                  optionnavigation[_QuestionNumber - 1][0][1],
                  optionnavigation[_QuestionNumber - 1][0][2],
                  optionnavigation[_QuestionNumber - 1][0][3],
                  optionnavigation[_QuestionNumber - 1][0][4],
                )),
            InkWell(
                onTap: () {
                  setState(() {
                    optionnavigation[_QuestionNumber - 1][0][0] =
                        HexColor('#E1FFE8');
                    optionnavigation[_QuestionNumber - 1][0][1] =
                        HexColor('#009B21');
                    optionnavigation[_QuestionNumber - 1][0][2] =
                        HexColor('#FFFFFF');
                    optionnavigation[_QuestionNumber - 1][0][3] = false;
                    optionnavigation[_QuestionNumber - 1][1][0] = Colors.white;
                    optionnavigation[_QuestionNumber - 1][1][1] =
                        HexColor('#FFFFFF');
                    optionnavigation[_QuestionNumber - 1][1][2] =
                        HexColor('#446EDB');
                    optionnavigation[_QuestionNumber - 1][1][3] = true;
                    optionnavigation[_QuestionNumber - 1][2][0] = Colors.white;
                    optionnavigation[_QuestionNumber - 1][2][1] =
                        HexColor('#FFFFFF');
                    optionnavigation[_QuestionNumber - 1][2][2] =
                        HexColor('#446EDB');
                    optionnavigation[_QuestionNumber - 1][2][3] = true;
                    optionnavigation[_QuestionNumber - 1][3][0] = Colors.white;
                    optionnavigation[_QuestionNumber - 1][3][1] =
                        HexColor('#FFFFFF');
                    optionnavigation[_QuestionNumber - 1][3][2] =
                        HexColor('#446EDB');
                    optionnavigation[_QuestionNumber - 1][3][3] = true;

                    _Answer++;
                  });
                },
                child: OptionCard(
                  height,
                  width,
                  Options[1],
                  sampleoptiontext[1],
                  optionnavigation[_QuestionNumber - 1][1][0],
                  optionnavigation[_QuestionNumber - 1][1][1],
                  optionnavigation[_QuestionNumber - 1][1][2],
                  optionnavigation[_QuestionNumber - 1][1][3],
                  optionnavigation[_QuestionNumber - 1][1][4],
                )),
            InkWell(
                onTap: () {
                  setState(() {
                    optionnavigation[_QuestionNumber - 1][0][0] =
                        HexColor('#E1FFE8');
                    optionnavigation[_QuestionNumber - 1][0][1] =
                        HexColor('#009B21');
                    optionnavigation[_QuestionNumber - 1][0][2] =
                        HexColor('#FFFFFF');
                    optionnavigation[_QuestionNumber - 1][0][3] = false;
                    optionnavigation[_QuestionNumber - 1][1][0] = Colors.white;
                    optionnavigation[_QuestionNumber - 1][1][1] =
                        HexColor('#FFFFFF');
                    optionnavigation[_QuestionNumber - 1][1][2] =
                        HexColor('#446EDB');
                    optionnavigation[_QuestionNumber - 1][1][3] = true;
                    optionnavigation[_QuestionNumber - 1][2][0] = Colors.white;
                    optionnavigation[_QuestionNumber - 1][2][1] =
                        HexColor('#FFFFFF');
                    optionnavigation[_QuestionNumber - 1][2][2] =
                        HexColor('#446EDB');
                    optionnavigation[_QuestionNumber - 1][2][3] = true;
                    optionnavigation[_QuestionNumber - 1][3][0] = Colors.white;
                    optionnavigation[_QuestionNumber - 1][3][1] =
                        HexColor('#FFFFFF');
                    optionnavigation[_QuestionNumber - 1][3][2] =
                        HexColor('#446EDB');
                    optionnavigation[_QuestionNumber - 1][3][3] = true;

                    _Answer++;
                  });
                },
                child: OptionCard(
                  height,
                  width,
                  Options[2],
                  sampleoptiontext[2],
                  optionnavigation[_QuestionNumber - 1][2][0],
                  optionnavigation[_QuestionNumber - 1][2][1],
                  optionnavigation[_QuestionNumber - 1][2][2],
                  optionnavigation[_QuestionNumber - 1][2][3],
                  optionnavigation[_QuestionNumber - 1][2][4],
                )),
            InkWell(
                onTap: () {
                  setState(() {
                    optionnavigation[_QuestionNumber - 1][0][0] =
                        HexColor('#E1FFE8');
                    optionnavigation[_QuestionNumber - 1][0][1] =
                        HexColor('#009B21');
                    optionnavigation[_QuestionNumber - 1][0][2] =
                        HexColor('#FFFFFF');
                    optionnavigation[_QuestionNumber - 1][0][3] = false;
                    optionnavigation[_QuestionNumber - 1][1][0] = Colors.white;
                    optionnavigation[_QuestionNumber - 1][1][1] =
                        HexColor('#FFFFFF');
                    optionnavigation[_QuestionNumber - 1][1][2] =
                        HexColor('#446EDB');
                    optionnavigation[_QuestionNumber - 1][1][3] = true;
                    optionnavigation[_QuestionNumber - 1][2][0] = Colors.white;
                    optionnavigation[_QuestionNumber - 1][2][1] =
                        HexColor('#FFFFFF');
                    optionnavigation[_QuestionNumber - 1][2][2] =
                        HexColor('#446EDB');
                    optionnavigation[_QuestionNumber - 1][2][3] = true;
                    optionnavigation[_QuestionNumber - 1][3][0] = Colors.white;
                    optionnavigation[_QuestionNumber - 1][3][1] =
                        HexColor('#FFFFFF');
                    optionnavigation[_QuestionNumber - 1][3][2] =
                        HexColor('#446EDB');
                    optionnavigation[_QuestionNumber - 1][3][3] = true;

                    _Answer++;
                  });
                },
                child: OptionCard(
                  height,
                  width,
                  Options[3],
                  sampleoptiontext[3],
                  optionnavigation[_QuestionNumber - 1][2][0],
                  optionnavigation[_QuestionNumber - 1][2][1],
                  optionnavigation[_QuestionNumber - 1][2][2],
                  optionnavigation[_QuestionNumber - 1][2][3],
                  optionnavigation[_QuestionNumber - 1][2][4],
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
      bool check) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        height: height * 0.07,
        width: width * 0.9,
        decoration: BoxDecoration(
          color: optionbgcolor,
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
                  backgroundColor:
                      check ? optioniconcolor : HexColor('#009B21'),
                  child: CircleAvatar(
                    radius: 20,
                    child: Center(
                      child: Text(
                        option,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins",
                          color: optioniconcolor,
                        ),
                      ),
                    ),
                    backgroundColor: optioniconbgcolor,
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
                  color: OptionColors[0],
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
                    "chapter ",
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
                    " Question",
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
                "Question",
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
            int hours = (time / 3600).floor();
            int minutes = ((time - (hours * 3600)) / 60).floor();
            int seconds = (time - (hours * 3600) - (minutes * 60)).toInt();

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
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => fulltestjeeadvancedresult()),
            );
          },
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
                    Navigator.pushNamed(
                      context,
                      'allquestions',
                    );
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
                        statusnames[0], _Answer),
                    StatusCard(height, width, backcolor[1], maincolor[1],
                        statusnames[1], _NotAnswered),
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
                  child: BigTagContainer("Maths", Colors.blue, Colors.white),
                ),
                QuestionMenu3(height, width),
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
            QuestionRow(height, width, QuestionCount[0], questioncount[0]),
            QuestionRow(height, width, QuestionCount[1], questioncount[1]),
            QuestionRow(height, width, QuestionCount[2], questioncount[2]),
            QuestionRow(height, width, QuestionCount[3], questioncount[3]),
            QuestionRow(height, width, QuestionCount[4], questioncount[4]),
            QuestionRow(height, width, QuestionCount[5], questioncount[5]),
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
            QuestionRow(height, width, QuestionCount[6], questioncount[6]),
            QuestionRow(height, width, QuestionCount[7], questioncount[7]),
            QuestionRow(height, width, QuestionCount[8], questioncount[8]),
            QuestionRow(height, width, QuestionCount[9], questioncount[9]),
            QuestionRow(height, width, QuestionCount[10], questioncount[10]),
            QuestionRow(height, width, QuestionCount[11], questioncount[11]),
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

  // Widget QuestionMenu(var height, var width) {
  //   return Padding(
  //     padding: const EdgeInsets.all(10.0),
  //     child: Container(
  //       width: width * 0.8,
  //       decoration: BoxDecoration(
  //         color: Colors.white,
  //         borderRadius: BorderRadius.circular(10.0),
  //         boxShadow: [
  //           BoxShadow(
  //             color: Colors.grey.withOpacity(0.5), // Shadow color
  //             spreadRadius: 3, // How much the shadow spreads
  //             blurRadius: 3, // How blurry the shadow is
  //             offset: Offset(0, 3), // Changes position of shadow
  //           ),
  //         ],
  //       ),
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //         children: [
  //           QuestionRow(height, width, QuestionCount[0]),
  //           QuestionRow(height, width, QuestionCount[1]),
  //           QuestionRow(height, width, QuestionCount[2]),
  //           QuestionRow(height, width, QuestionCount[3]),
  //           QuestionRow(height, width, QuestionCount[4]),
  //           QuestionRow(height, width, QuestionCount[5]),
  //           QuestionRow(height, width, QuestionCount[6]),
  //           QuestionRow(height, width, QuestionCount[7]),
  //           QuestionRow(height, width, QuestionCount[8]),
  //           QuestionRow(height, width, QuestionCount[9]),
  //           QuestionRow(height, width, QuestionCount[10]),
  //           QuestionRow(height, width, QuestionCount[11]),
  //           QuestionRow(height, width, QuestionCount[12]),
  //           QuestionRow(height, width, QuestionCount[13]),
  //           QuestionRow(height, width, QuestionCount[14]),
  //           QuestionRow(height, width, QuestionCount[15]),
  //           QuestionRow(height, width, QuestionCount[16]),
  //           QuestionRow(height, width, QuestionCount[17]),
  //           QuestionRow(height, width, QuestionCount[18]),
  //           QuestionRow(height, width, QuestionCount[19]),
  //           QuestionRow(height, width, QuestionCount[20]),
  //           QuestionRow(height, width, QuestionCount[21]),
  //           QuestionRow(height, width, QuestionCount[22]),
  //           QuestionRow(height, width, QuestionCount[23]),
  //           QuestionRow(height, width, QuestionCount[24]),
  //           QuestionRow(height, width, QuestionCount[25]),
  //           QuestionRow(height, width, QuestionCount[26]),
  //         ],
  //       ),
  //     ),
  //   );
  // }

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
