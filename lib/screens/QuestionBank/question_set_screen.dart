import 'package:achievex/screens/QuestionBank/instruction.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

List<bool> isselected = [
  false,
  false,
  false,
];

List<List<dynamic>> choosed = [
  [],
];

late int _setnumber = 0;

class QuestionSetScreen extends StatefulWidget {
  final List<List<dynamic>> chapterset1;
  final List<List<dynamic>> chapterset2;
  final List<List<dynamic>> chapterset3;
  final String subject;

  QuestionSetScreen(
      {required this.chapterset1,
      required this.chapterset2,
      required this.chapterset3,
      required this.subject,
      });

  @override
  _QuestionSetScreenState createState() => _QuestionSetScreenState();
}

class _QuestionSetScreenState extends State<QuestionSetScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    List<List<List<dynamic>>> chaptersets = [
      widget.chapterset1,
      widget.chapterset2,
      widget.chapterset3,
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
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
                          'Set',
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
                          'assets/images/exam.jpg',
                          height: 110,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: InkWell(
                          onTap: () {
                            setState(() {
                              isselected[0] = true;
                              isselected[1] = false;
                              isselected[2] = false;
                              _setnumber = 0;
                            });
                          },
                          child: SetCard("Question \n Set A", isselected[0])),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: InkWell(
                          onTap: () {
                            setState(() {
                              isselected[0] = false;
                              isselected[1] = true;
                              isselected[2] = false;
                              _setnumber = 1;
                            });
                          },
                          child: SetCard("Question \n Set B", isselected[1])),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: InkWell(
                          onTap: () {
                            setState(() {
                              isselected[0] = false;
                              isselected[1] = false;
                              isselected[2] = true;
                              _setnumber = 2;
                            });
                          },
                          child: SetCard("Question \n Set C", isselected[2])),
                    ),
                  ],
                ),
                Instruction(),
                const SizedBox(
                  height: 40.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _Button(
                    "Start Exam",
                    _setnumber,
                    chaptersets,
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

  void showMyAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text('Firstally Choose the class to proceed!'),
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

  Widget _Button(String text, int index, List<List<List<dynamic>>> chaptersets) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          'chapterwiseexam',
          arguments: {
            'Set': chaptersets[index],
            'chapterset1':  chaptersets[0],
            'chapterset2': chaptersets[1],
            'chapterset3': chaptersets[2],
            'subject': widget.subject,
          },
        );
      },
      child: Container(
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
      ),
    );
  }

  Widget SetCard(final String text, bool check) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
          height: 150,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: check ? HexColor("#5C76FF") : Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5), // Shadow color
                spreadRadius: 2, // How much the shadow spreads
                blurRadius: 2, // How blurry the shadow is
                offset: Offset(0, 3), // Changes position of shadow
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: HexColor('#D2EEFF'),
                  borderRadius: BorderRadius.circular(10.0),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.grey.withOpacity(0.5), // Shadow color
                  //     spreadRadius: 2, // How much the shadow spreads
                  //     blurRadius: 2, // How blurry the shadow is
                  //     offset: Offset(0, 3), // Changes position of shadow
                  //   ),
                  // ],
                ),
                child: Center(
                  child: Image.asset('assets/images/set.png'),
                ),
              ),
              const SizedBox(
                height: 4.0,
              ),
              Center(
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Poppins",
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
