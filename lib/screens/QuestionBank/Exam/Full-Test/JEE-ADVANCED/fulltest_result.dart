import 'package:achievex/screens/QuestionBank/Exam/Chapterwise/logic.dart';
import 'package:achievex/screens/QuestionBank/Exam/Full-Test/JEE-MAIN/comparison_data.dart';
import 'package:achievex/screens/QuestionBank/Exam/Full-Test/JEE-MAIN/fulltest_exam.dart';
import 'package:achievex/screens/QuestionBank/Exam/Full-Test/year_screen.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

//quesmenu section........
List<Color> maincolor = [
  HexColor('#5C76FF'),
  HexColor('#BB1010'),
  HexColor('#005813'),
];

List<Color> backcolor = [
  HexColor('#E9ECFF'),
  HexColor('#FFE0E0'),
  HexColor('#E1FFE8'),
];

//

List<Color> bgcolor = [
  HexColor('#66BCE8'),
  HexColor('#BCDB25'),
  HexColor('#FF6D6D'),
];

List<Color> resultcolor = [
  HexColor('#66BCE8'),
  HexColor('#BCDB25'),
  HexColor('#FF6D6D'),
];

List<Color> opporesultcolor = [
  HexColor('#DBEDFF'),
  HexColor('##EFF3DA'),
  HexColor('#FDE1E1'),
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



List<List<int>> _QuestionCount = [
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
];

late double percentile;
late double percentage;

class Fulltestjeeadvancedresult extends StatefulWidget {
  final List<List<dynamic>> paper;
  final List<List<Color>> Questioncolor;
  final int marks;
  final int notanswered;
  final int correctanswered;
  final int incorrectanswered;
  final String timetaken;
  final String subject;

  Fulltestjeeadvancedresult({
    required this.paper,
    required this.Questioncolor,
    required this.marks,
    required this.notanswered,
    required this.correctanswered,
    required this.incorrectanswered,
    required this.timetaken,
    required this.subject,
  });

  @override
  _FulltestjeeadvancedresultState createState() => _FulltestjeeadvancedresultState();
}



class _FulltestjeeadvancedresultState extends State<Fulltestjeeadvancedresult> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    percentage = Percentage(widget.correctanswered, 90);
    percentile = calculatePercentile(widget.marks.toDouble(), PreviousYearsData.Percentiles);
    percentage = percentage.abs();
    percentile = percentile.abs();
    Map<String, int> _rankrange = getRankRange(widget.marks.toDouble(), PreviousYearsData.Percentiles);
    RangeValues _currentRangeValues = RangeValues(_rankrange['lowerBoundRank']!.toDouble(),  _rankrange['upperBoundRank']!.toDouble());


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 5.0, left: 15.0),
                    child: Text(
                      "Test FeedBack",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              ResultCard(height, width, _currentRangeValues),
              const SizedBox(height: 5.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FullJeeMainExam(Set: widget.paper,)),
                        );
                      },
                      child: MainButton(height, width, "Restart")),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  YearNamesScreen(exam: "jeemain")),
                        );
                      },
                      child: MainButton(height, width, "Back to topic")),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15.0, top: 5.0),
                    child: Text(
                      "Answer Key",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Poppins",
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  StatusCard(
                      height, width, backcolor[2], maincolor[2], "correct", widget.correctanswered),
                  StatusCard(height, width, backcolor[1], maincolor[1],
                      "Incorrect", widget.incorrectanswered),
                  StatusCard(height, width, backcolor[0], maincolor[0],
                      "Not Answered", widget.notanswered),
                ],
              ),
              const SizedBox(height: 5.0),
              QuestionMenu(height, width),
            ],
          ),
        ),
      ),
    );
  }

  //satuscard....
  Widget StatusCard(var height, var width, Color bgcolor, Color sidecolor,
      String text, int count) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        height: 55,
        width: 110,
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
                      fontSize: 12,
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

  

  //resultcard.....
  Widget ResultCard(var height, var width, RangeValues _currentRangeValues) {
    return Container(
      height: height * 0.29,
      width: width * 0.9,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [



                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 2.0),
                        child: Text(
                          "Single Choice",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Poppins",
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 4.0),
                        child: Text(
                          widget.subject,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                            fontFamily: "Poppins",
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(width: 35.0,),

               Padding(
                 padding: const EdgeInsets.all(2.0),
                 child: Container(
                       height: height * 0.085,
                       width: width * 0.4,
                 
                       decoration: BoxDecoration(
                           color: HexColor('#5C76FF'),
                           borderRadius: BorderRadius.circular(10),
                       ),
                 
                      child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                 
                    
                      Center(
                        child: Text(
                          "Rank",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Poppins",
                            color: Colors.black,
                          ),
                        ),
                      ),
                    
                 
                 
                     SliderTheme(
                      data: SliderThemeData(
                        trackHeight: 4.0,
                        activeTrackColor:
                            const Color.fromARGB(255, 5, 60, 105), // Color of the active track
                        inactiveTrackColor:
                            Colors.blue, // Color of the inactive track
                        thumbColor: const Color.fromARGB(255, 125, 232, 100).withAlpha(10), // Color of the thumb
                        overlayColor: const Color.fromARGB(255, 232, 70, 16)
                            .withAlpha(10), // Color of the thumb overlay
                      ),
                      child: RangeSlider(
                        values: _currentRangeValues,
                        max: 1200000,
                        divisions: 10,
                        labels: RangeLabels(
                          _currentRangeValues.start.round().toString(),
                          _currentRangeValues.end.round().toString(),
                        ),
                        onChanged: (RangeValues values) {
                          setState(() {
                            _currentRangeValues = values;
                          });
                        },
                      ),
                    ),
                  ],
                 
                  ),
                 
                 ),
               ),
            ],
          ),       
          

          const SizedBox(height: 5.0),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CountCard(resultcolor[0], "Percentile", percentile.abs()),
                      CountCard(resultcolor[1], "Marks", widget.marks.toDouble()),
                      CountCard(resultcolor[2], "Not Answered", widget.notanswered.toDouble()),
                    ],
                  ),
                  TextContainer(height, width, 90, percentage.abs(), widget.timetaken),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TriCicularIndicator(
                      percentile,
                      (widget.marks.toDouble()/9).abs()*10,
                      (widget.notanswered.toDouble()/10).abs()*10,
                      resultcolor[0],
                      opporesultcolor[0],
                      resultcolor[1],
                      opporesultcolor[1],
                      resultcolor[2],
                      opporesultcolor[2]),
                ],
              ),
            ],
          ),
        ], 
      ),
    );
  }

  Widget TriCicularIndicator(
      double per1,
      double per2,
      double per3,
      Color firstfront,
      Color firstback,
      Color secondfront,
      Color secondback,
      Color thirdfront,
      Color thirdback) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircularPercentIndicator(
          radius: 65,
          lineWidth: 8,
          percent: per1 / 100,
          // Use a gradient for the progress color based on percentage
          progressColor: firstfront,

          backgroundColor: firstback,
          circularStrokeCap: CircularStrokeCap.round,
          center: CircularPercentIndicator(
            radius: 55,
            lineWidth: 8,
            percent: per2 / 100,
            // Use a gradient for the progress color based on percentage
            progressColor: secondfront,

            backgroundColor: secondback,
            circularStrokeCap: CircularStrokeCap.round,
            center: CircularPercentIndicator(
              radius: 45,
              lineWidth: 8,
              percent: per3 / 100,
              // Use a gradient for the progress color based on percentage
              progressColor: thirdfront,
              backgroundColor: thirdback,
              circularStrokeCap: CircularStrokeCap.round,
            ),
          ),
        ),
      ],
    );
  }

  Widget TextContainer(
      var height, var width, var questions, var accuracy, var timetaken) {
    return Container(
      height: height * 0.1,
      width: width * 0.45,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text(
                  "Questions: ${questions}",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Poopins",
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 2.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text(
                  "Accuracy: ${accuracy}",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Poopins",
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 2.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text(
                  "Time Taken: ${timetaken} minutes",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Poopins",
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget CountCard(Color _Bgcolor, final String text, double count) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(1.0),
                child: CircleAvatar(
                  radius: 3.0,
                  backgroundColor: _Bgcolor,
                ),
              ),
              Text(
                count.toString(),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Poppins",
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(2.0),
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.normal,
                    fontFamily: "Poppins",
                    color: Colors.grey,
                  ),
                ),
              ),
            ]),
      ),
    );
  }

  //button...
  Widget MainButton(var height, var width, String text) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 60,
        width: width * 0.40,
        decoration: BoxDecoration(
          color: HexColor('#5C76FF'),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Padding(
            //   padding: EdgeInsets.all(4.0),
            //   child: Image.asset(
            //     "assets/images/send.png",
            //     height: 40,
            //     width: 40,
            //   ),
            // ),
            // const SizedBox(width: 2.0),
            Center(
              child: Text(
                text,
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

  //result questionmenu

  Widget QuestionMenu(var height, var width) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: width * 0.9,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // Shadow color
              spreadRadius: 3, // How much the shadow spreads
              blurRadius: 3,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            QuestionRow(height, width, QuestionCount[0], _QuestionCount[0]),
            QuestionRow(height, width, QuestionCount[1], _QuestionCount[1]),
            QuestionRow(height, width, QuestionCount[2], _QuestionCount[2]),
            QuestionRow(height, width, QuestionCount[3], _QuestionCount[3]),
            QuestionRow(height, width, QuestionCount[4], _QuestionCount[4]),
            QuestionRow(height, width, QuestionCount[5], _QuestionCount[5]),
            QuestionRow(height, width, QuestionCount[6], _QuestionCount[6]),
            QuestionRow(height, width, QuestionCount[7], _QuestionCount[7]),
            QuestionRow(height, width, QuestionCount[8], _QuestionCount[8]),
            QuestionRow(height, width, QuestionCount[9], _QuestionCount[9]),
            QuestionRow(height, width, QuestionCount[10], _QuestionCount[10]),
            QuestionRow(height, width, QuestionCount[11], _QuestionCount[11]),
            QuestionRow(height, width, QuestionCount[12], _QuestionCount[12]),
            QuestionRow(height, width, QuestionCount[13], _QuestionCount[13]),
            QuestionRow(height, width, QuestionCount[14], _QuestionCount[14]),
            QuestionRow(height, width, QuestionCount[15], _QuestionCount[15]),
            QuestionRow(height, width, QuestionCount[16], _QuestionCount[16]),
            QuestionRow(height, width, QuestionCount[17], _QuestionCount[17]),
          ],
        ),
      ),
    );
  }

  Widget QuestionRow(var height, var width, List<String> count, List<int> Count) {
    return Container(
      height: 90,
      width: width * 0.85,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SquareContainer(height, width, count[0], maincolor[0], backcolor[0], Count[0]),
          SquareContainer(height, width, count[1], maincolor[0], backcolor[0], Count[1]),
          SquareContainer(height, width, count[2], maincolor[0], backcolor[0], Count[2]),
          SquareContainer(height, width, count[3], maincolor[0], backcolor[0], Count[3]),
          SquareContainer(height, width, count[4], maincolor[0], backcolor[0], Count[4]),
        ],
      ),
    );
  }



  Widget SquareContainer(
      var height, var width, String text, Color maincolor, Color backcolor, int index) {
    return InkWell(
      onTap: () {
          Navigator.pushNamed(context, 'explanationscreen', arguments: {
          'paper': widget.paper,
          'index': (index - 1),
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          height: height * 0.07,
          width: width * 0.14,
          decoration: BoxDecoration(
            color: widget.Questioncolor[index - 1][0],
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                fontFamily: "Poppins",
                color: widget.Questioncolor[index - 1][1],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
