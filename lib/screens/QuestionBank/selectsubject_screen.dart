import 'package:achievex/screens/QuestionBank/Exam/Full-Test/JEE-ADVANCED/fulltest_exam.dart';
import 'package:achievex/screens/QuestionBank/Exam/Full-Test/year_screen.dart';
import 'package:achievex/screens/QuestionBank/instruction.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:achievex/screens/QuestionBank/Database/JEE-ADVANCED/full-test/paper_data.dart';

late String subject = "subject";
late String subsubject = "Topic Wise PYQs";
bool isselected = false;
late int index = 0;
late bool checked = true;
late String _exam;

List<int> count = [
  5,
  6,
  7,
  8,
];

List<List<Color>> subjectcolor = [
  [Colors.white, HexColor('#E4EEFF')],
  [Colors.white, HexColor('#D0F8FF')],
  [Colors.white, HexColor('#F5E2FF')],
  [Colors.white, HexColor('#ECF2FF')],
];

Color _color1 = subjectcolor[0][0];
Color _color2 = subjectcolor[1][0];
Color _color3 = subjectcolor[2][0];
Color _color4 = subjectcolor[3][0];

class SelectsubjectScreen extends StatefulWidget {
  late String Exam;
  final String Class;

  SelectsubjectScreen({
    required this.Exam,
    required this.Class,
    super.key,
  });

  @override
  _SelectsubjectScreenState createState() => _SelectsubjectScreenState();
}

class _SelectsubjectScreenState extends State<SelectsubjectScreen> {
  @override
  Widget build(BuildContext context) {
    widget.Exam == "Jee Main" ? checked = true : checked = false;
    checked ? _exam = "jeemain" : _exam = "jeeadvanced";

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: Stack(
                    children: [
                      InkWell(
                        onTap: () => {Navigator.pop(context)},
                        child: const Padding(
                          padding: EdgeInsets.only(top: 45.0),
                          child: Icon(Icons.arrow_back),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 70.0),
                        child: Text(
                          'Choose the',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Prompt-Bold',
                            fontSize: 22,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 90.0),
                        child: Text(
                          'Class',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Prompt-Bold',
                            fontSize: 38,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Image.asset(
                          'assets/images/question_in.png',
                          height: 110,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 200,
                  width: 350,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(1.0),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              subject = "physics";
                              widget.Exam == "Jee Main"
                                  ? _exam = "jeemain"
                                  : _exam = "jeeadvanced";
                              widget.Class == "11"
                                  ? index = 1
                                  : index = count[0];
                              isselected = true;
                              _color1 = subjectcolor[0][1];
                              _color2 = subjectcolor[1][0];
                              _color3 = subjectcolor[2][0];
                              _color4 = subjectcolor[3][0];
                            });
                          },
                          child: _Card(
                              widget.Exam,
                              (subsubject + "(Physics)"),
                              "assets/images/exam_phy.png",
                              HexColor('#E4EEFF'),
                              _color1),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(1.0),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              subject = "chemistry";
                              widget.Class == "11"
                                  ? index = 2
                                  : index = count[1];
                              widget.Exam == "Jee Main"
                                  ? _exam = "jeemain"
                                  : _exam = "jeeadvanced";
                              isselected = true;
                              _color1 = subjectcolor[0][0];
                              _color2 = subjectcolor[1][1];
                              _color3 = subjectcolor[2][0];
                              _color4 = subjectcolor[3][0];
                            });
                          },
                          child: _Card(
                              widget.Exam,
                              (subsubject + "(Chemistry)"),
                              "assets/images/exam_chem.png",
                              HexColor('#D0F8FF'),
                              _color2),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 200,
                  width: 350,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(1.0),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              subject = "maths";
                              widget.Class == "11"
                                  ? index = 3
                                  : index = count[2];
                              widget.Exam == "Jee Main"
                                  ? _exam = "jeemain"
                                  : _exam = "jeeadvanced";
                              isselected = true;

                              _color1 = subjectcolor[0][0];
                              _color2 = subjectcolor[1][0];
                              _color3 = subjectcolor[2][1]; 
                              _color4 = subjectcolor[3][0];
                            });
                          },
                          child: _Card(
                              widget.Exam,
                              (subsubject + "(Maths)"),
                              "assets/images/exam_maths.png",
                              HexColor('#F5E2FF'),
                              _color3,),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(1.0),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              subject = "fulltest";
                              widget.Class == "11"
                                  ? index = 4
                                  : index = count[3];
                              widget.Exam == "Jee Main"
                                  ? _exam = "jeemain"
                                  : _exam = "jeeadvanced";
                              isselected = true;
                              _color1 = subjectcolor[0][0];
                              _color2 = subjectcolor[1][0];
                              _color3 = subjectcolor[2][0];
                              _color4 = subjectcolor[3][1];
                            });
                          },
                          child: _Card(widget.Exam, "Full Test",
                              "assets/images/book.png", HexColor('#ECF2FF'), _color4),
                        ),
                      ),
                    ],
                  ),
                ),
                

                const SizedBox(
                  height: 10.0,
                ),

                Instruction(),

                const SizedBox(
                  height: 40.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      isselected
                          ? SelectScreen(index)
                          : showMyAlertDialog(context);
                    },
                    child: _Button("Next", null),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget Liner() {
    return SizedBox(
      width: 600,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.grey,
        ),
      ),
    );
  }

  void SelectScreen(int index) {
    switch (index) {
      case 1:
        Navigator.pushNamed(
          context,
          'eleventh_${_exam}_phy',
        );
        break;
      case 2:
        Navigator.pushNamed(
          context,
          'eleventh_${_exam}_chem',
        );
        print("Result for option2");
        break;
      case 3:
        Navigator.pushNamed(
          context,
          'eleventh_${_exam}_maths',
        );
        print("Result for option3");
        break;
      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => _exam == "jeeadvanced" ? FullJeeAdvancedExam(paper: jeeadvanced_2024_paper1,) : YearNamesScreen(exam: _exam)),
        );
        print("jee main full-test");
        break;
      case 5:
        Navigator.pushNamed(
          context,
          'twelth_${_exam}_maths',
        );
        print("Result for option4");
        break;
      case 6:
        Navigator.pushNamed(
          context,
          'twelth_${_exam}_maths',
        );
        print("Result for option4");
        break;
      case 7:
        Navigator.pushNamed(
          context,
          'twelth_${_exam}_maths',
        );
        print("Result for option4");
        break;
      case 8:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => _exam == "jeeadvanced" ? FullJeeAdvancedExam(paper: jeeadvanced_2024_paper1,) : YearNamesScreen(exam: _exam)),
        );
        print("for the full test");
        break;
      default:
        print("Invalid option");
    }
  }

  void showMyAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text('Firstally Choose the Subject to proceed!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  Widget _Card(String text, String subtext, String imagetext, Color color,
      Color bgcolor) {
    return Container(
      height: 150,
      width: 150,
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Image.asset(imagetext)),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              fontFamily: "Poppins",
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 4.0,
          ),
          Center(
            child: Text(
              subtext,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.normal,
                fontFamily: "Poppins",
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _Button(String text, IconData? icon) {
    return Container(
      height: 70,
      width: 330,
      decoration: BoxDecoration(
        color: HexColor("#5C76FF"),
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
          if (icon != null) ...[
            Icon(
              icon!,
              size: 18,
            ),
            const SizedBox(width: 8),
          ],
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
              fontFamily: "Poppins",
            ),
          ),
        ],
      ),
    );
  }
}
