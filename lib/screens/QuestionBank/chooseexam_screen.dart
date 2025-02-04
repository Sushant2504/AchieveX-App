import 'package:achievex/screens/QuestionBank/instruction.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

bool isselected = false;
String Exam = "";


List<Color> _CardColor = [
  Colors.white,
  HexColor('#416FDF'),
];


Color _backgroundcolor1 = Colors.white;
Color _backgroundcolor2 = Colors.white;

class ChooseexamScreen extends StatefulWidget {
  final String Class;

  const ChooseexamScreen({
    required this.Class,
    super.key,
  });

  @override
  _ChooseexamScreenState createState() => _ChooseexamScreenState();
}

class _ChooseexamScreenState extends State<ChooseexamScreen> {
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
                          'Exam',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
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

             SizedBox(
                  height: 170,
                  width: 400,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              print("button is clicked!");
                              Exam = "Jee Main";
                              _backgroundcolor1 = _CardColor[1];
                              _backgroundcolor2 = _CardColor[0];
                            });

                            isselected = true;
                          },
                          child: _Card("JEE MAIN", _backgroundcolor1),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              print("button is clicked!");
                              Exam = "Jee Advanced";
                              _backgroundcolor1 = _CardColor[0];
                              _backgroundcolor2 = _CardColor[1];
                            });

                            isselected = true;
                          },
                          child: _Card("JEE ADVANCE", _backgroundcolor2),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                const Instruction(),
                const SizedBox(
                  height: 40.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      isselected
                          ? Navigator.pushNamed(
                              context,
                              'subjectname',
                              arguments: {
                                'Exam': Exam,
                                'class': widget.Class,
                              },
                            )
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

  void showMyAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: const Text('Firstally Choose the Exam to Proceed!'),
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

  Widget _Card(String text, Color backgroundColor) {
    return Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
        color: backgroundColor,
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: HexColor("#C8F3FF"),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Image.asset('assets/images/book.png')),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              fontFamily: "Poppins",
              color: Colors.black,
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
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (icon != null) ...[
            Icon(
              icon,
              size: 18,
            ),
            const SizedBox(width: 8),
          ],
          Text(
            text,
            style: const TextStyle(
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
