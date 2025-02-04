import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:achievex/screens/QuestionBank/Exam/Chapterwise/logic.dart';
import 'package:achievex/screens/QuestionBank/Exam/Full-Test/JEE-MAIN/comparison_data.dart';

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
];

List<List<int>> _QuestionCount = [
  [1, 2, 3, 4, 5],
  [6, 7, 8, 9, 10],
  [11, 12, 13, 14, 15],
  [16, 17, 18, 19, 20],
  [21, 22, 23, 24, 25],
  [26, 27, 28, 29, 30],
];

late double percentage;
late double percentile;
class ResultScreen extends StatefulWidget {
  final List<List<dynamic>> Set;
  final List<List<dynamic>> chapterset1;
  final List<List<dynamic>> chapterset2;
  final List<List<dynamic>> chapterset3;
  final List<List<Color>> Questioncolor;
  final int marks;
  final int notanswered;
  final int correctanswered;
  final int incorrectanswered;
  final String timetaken;
  final String subject;

  const ResultScreen({
    required this.Set,
    required this.chapterset1,
    required this.chapterset2,
    required this.chapterset3,
    required this.Questioncolor,
    required this.marks,
    required this.notanswered,
    required this.correctanswered,
    required this.incorrectanswered,
    required this.timetaken,
    required this.subject,
    super.key,
  });

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    percentage = Percentage(widget.correctanswered, 30);
    percentile = calculatePercentile(
        widget.marks.toDouble(), PreviousYearsData.Percentiles);

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
              const Row(
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
              ResultCard(height, width),
              const SizedBox(height: 5.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          'chapterwiseexam',
                          arguments: {
                            'Set': widget.Set,
                            'chapterset1': widget.chapterset1,
                            'chapterset2': widget.chapterset2,
                            'chapterset3': widget.chapterset3,
                            'subject': widget.subject,
                          },
                        );
                      },
                      child: MainButton(height, width, "Restart")),
                  InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          'questionsetscreen',
                          arguments: {
                            'chapterset1': widget.chapterset1,
                            'chapterset2': widget.chapterset2,
                            'chapterset3': widget.chapterset3,
                            'subject' : widget.subject,
                          },
                        );
                      },
                      child: MainButton(height, width, "Back to topic")),
                ],
              ),
              const Row(
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
                  StatusCard(height, width, backcolor[2], maincolor[2],
                      "Correct", widget.correctanswered),
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
              offset: const Offset(0, 3),
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
                borderRadius: const BorderRadius.only(
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
  Widget ResultCard(var height, var width) {
    return Container(
      height: height * 0.26,
      width: width * 0.9,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Shadow color
            spreadRadius: 5, // How much the shadow spreads
            blurRadius: 5, // How blurry the shadow is
            offset: const Offset(0, 3), // Changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8.0, top: 2.0),
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
                      widget.Set[0][1],
                      style: const TextStyle(
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
                      CountCard(resultcolor[0], "Percentile", percentile),
                      CountCard(resultcolor[1], "Marks", widget.marks),
                      CountCard(
                          resultcolor[2], "Not Answered", widget.notanswered),
                    ],
                  ),
                  TextContainer(
                      height, width, 30, percentage, widget.timetaken),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TriCicularIndicator(
                      percentile,
                      ((widget.marks < 0 ? widget.marks.abs() : widget.marks) * 10) / 120,
                      (widget.notanswered / 30) * 10,
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
      Color thirdback,
      ) {
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
    return SizedBox(
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
                  "Questions: $questions",
                  style: const TextStyle(
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
                  "Accuracy: $accuracy",
                  style: const TextStyle(
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
                  "Time Taken: $timetaken minutes",
                  style: const TextStyle(
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

  Widget CountCard(Color Bgcolor, final String text, var count) {
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
                  backgroundColor: Bgcolor,
                ),
              ),
              Text(
                count.toString(),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Poppins",
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text(
                  text,
                  style: const TextStyle(
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
              color: Colors.grey.withOpacity(0.5), // Shadow color
              spreadRadius: 3, // How much the shadow spreads
              blurRadius: 3, // How blurry the shadow is
              offset: const Offset(0, 3), // Changes position of shadow
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
                style: const TextStyle(
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
              blurRadius: 3, // How blurry the shadow is
              offset: const Offset(0, 3), // Changes position of shadow
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
          ],
        ),
      ),
    );
  }

  Widget QuestionRow(
      var height, var width, List<String> count, List<int> questioncount) {
    return SizedBox(
      height: 90,
      width: width * 0.85,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SquareContainer(height, width, count[0], questioncount[0]),
          SquareContainer(height, width, count[1], questioncount[1]),
          SquareContainer(height, width, count[2], questioncount[2]),
          SquareContainer(height, width, count[3], questioncount[3]),
          SquareContainer(height, width, count[4], questioncount[4]),
        ],
      ),
    );
  }

  Widget SquareContainer(var height, var width, String text, int index) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, 'explanationscreen', arguments: {
          'paper': widget.Set,
          'index': index - 1,
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
