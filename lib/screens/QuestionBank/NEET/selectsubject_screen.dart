import 'package:achievex/screens/QuestionBank/Chapter%20Screens/JEE%20MAIN/11th_jee_main_chem.dart';
import 'package:achievex/screens/QuestionBank/Chapter%20Screens/JEE%20MAIN/11th_jee_main_phy.dart';
import 'package:achievex/screens/QuestionBank/Chapter%20Screens/NEET/11th_neet_bio.dart';
import 'package:achievex/screens/QuestionBank/Chapter%20Screens/NEET/11th_neet_phy.dart';
import 'package:achievex/screens/QuestionBank/NEET/full_test_names.dart';
import 'package:achievex/screens/QuestionBank/instruction.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../Chapter Screens/NEET/11th_neet_chem.dart';

late String subject = "subject";
late String subsubject = "Topic Wise PYQs";
bool isselected = false;
late int index = 0;

List<Color> _ColorCombo = [
   Colors.white,
   Colors.white,
   Colors.white,
   Colors.white,
];

  
List<int> count = [
  5,
  6,
  7,
  8,
];


class SelectsubjectNeetScreen extends StatefulWidget {
  final String Exam;
  final String Class;

  SelectsubjectNeetScreen({
    required this.Exam,
    required this.Class,
    super.key,
  });

  @override
  _SelectsubjectNeetScreenState createState() =>
      _SelectsubjectNeetScreenState();
}

class _SelectsubjectNeetScreenState extends State<SelectsubjectNeetScreen> {
  @override
  Widget build(BuildContext context) {
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
                          'Subject',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            // fontFamily: 'Prompt-Bold',
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
                              widget.Class == "11"
                                  ? index = 1
                                  : index = count[0];
                              isselected = true;
                              _ColorCombo[0] = HexColor('#E4EEFF');
                              _ColorCombo[1] = Colors.white;
                              _ColorCombo[2] = Colors.white;
                              _ColorCombo[3] = Colors.white;
                            });
                          },
                          child: _Card(
                              widget.Exam,
                              (subsubject + "(Physics)"),
                              "assets/images/exam_phy.png",
                              HexColor('#E4EEFF'), _ColorCombo[0]),
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
                              isselected = true;
                              _ColorCombo[0] = Colors.white;
                              _ColorCombo[1] = HexColor('#D0F8FF');
                              _ColorCombo[2] = Colors.white;
                              _ColorCombo[3] = Colors.white;
                            });
                          },
                          child: _Card(
                              widget.Exam,
                              (subsubject + "(Chemistry)"),
                              "assets/images/exam_chem.png",
                              HexColor('#D0F8FF'), _ColorCombo[1]),
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
                              isselected = true;

                              _ColorCombo[0] = Colors.white;
                              _ColorCombo[1] = Colors.white;
                              _ColorCombo[2] = HexColor('#F5E2FF');
                              _ColorCombo[3] = Colors.white;
                            });
                          },
                          child: _Card(
                              widget.Exam,
                              (subsubject + "(Bio)"),
                              "assets/images/exam_maths.png",
                              HexColor('#F5E2FF'),  _ColorCombo[2]),
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
                              isselected = true;

                              _ColorCombo[0] = Colors.white;
                              _ColorCombo[1] = Colors.white;
                              _ColorCombo[2] = Colors.white;
                              _ColorCombo[3] = HexColor('#ECF2FF');
                            });
                          },
                          child: _Card(widget.Exam, "Full Test",
                              "assets/images/book.png", HexColor('#ECF2FF'), _ColorCombo[3]),
                        ),
                      ),
                    ],
                  ),
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
       Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SubjectneetthreeScreen()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SubjectneettwoScreen()),
        );
        print("Result for option2");
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SubjectneetoneScreen()),
        );
        print("Result for option3");
        break;
      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FullTestNames()),
        );
        break;

      case 5:
        Navigator.pushNamed(
          context,
          'twelth_neet_phy',
        );
        print("Result for option4");
        break;
      case 6:
        Navigator.pushNamed(
          context,
          'twelth_neet_chem',
        );
        print("Result for option4");
        break;
      case 7:
        Navigator.pushNamed(
          context,
          'twelth_neet_bio',
        );
        print("Result for option4");
        break;
      case 8:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FullTestNames()),
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

  Widget _Card(String text, String subtext, String imagetext, Color color, Color bgcolor) {
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
