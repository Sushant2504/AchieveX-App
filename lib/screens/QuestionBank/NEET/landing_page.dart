import 'package:achievex/screens/QuestionBank/instruction.dart';
import 'package:achievex/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:achievex/screens/QuestionBank/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:achievex/screens/QuestionBank/chapter_names.dart';

List<List<String>> class_11 = [
  physics11th,
  chemistry11th,
  maths11th,
];

List<List<String>> class_12 = [
  physics12th,
  chemistry12th,
  maths12th,
];

List<Color> _classcardcolor = [
  HexColor("#416FDF"),
  HexColor("#416FDF"),
];

bool isselected = false;

List<List<String>> temp = [
  [],
];

String _Class = "";

class LandingNeetPage extends StatefulWidget {
  const LandingNeetPage({super.key});

  @override
  _LandingNeetPageState createState() => _LandingNeetPageState();
}

class _LandingNeetPageState extends State<LandingNeetPage> {
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
                          'Class',
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

               
                const SizedBox(
                  height: 10.0,
                ),

                SizedBox(
                  height: 200,
                  width: 350,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              temp = class_11;
                              _Class = "11";
                              isselected = true;
                              _classcardcolor[0] = const Color.fromARGB(255, 42, 4, 71);
                              _classcardcolor[1] = HexColor('#416FDF');
                            }); 
                          },
                          child: ClassCard("Class 11th", _classcardcolor[0]),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              temp = class_12;
                              _Class = "12";
                              isselected = true;
                              _classcardcolor[0] = HexColor('#416FDF');  
                              _classcardcolor[1] = const Color.fromARGB(255, 42, 4, 71);        
                            });
                          },
                          child: ClassCard("Class 12th", _classcardcolor[1]),
                        ),
                      ),
                    ],
                  ),
                ),
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
                              'selectneetsubject',
                              arguments: {
                                'Exam': "neet",
                                'Class': _Class,
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

  Widget Liner() {
    return const SizedBox(
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
          content: const Text('Firstally Choose the class to proceed!'),
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

  Widget ClassCard(String text, Color color) {
    return Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
        color: color,
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
            padding: const EdgeInsets.all(1.0),
            child: Image.asset("assets/images/home1.png"),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.normal,
              fontFamily: "Poppins",
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
            color: Colors.grey.withOpacity(0.5), // Shadow color
            spreadRadius: 5, // How much the shadow spreads
            blurRadius: 5, // How blurry the shadow is
            offset: const Offset(0, 3), // Changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (icon != null) ...[
            Icon(
              icon, // Use ! to assert that icon is not null
              size: 18, // Adjust icon size as needed
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

  Widget CustomCard({
    required String imagePath,
    bool isPremium = false,
    required String title,
    required Color containerColor,
    Color textColor = Colors.black,
  }) {
    return Center(
      child: Container(
        height: 110,
        width: 470,
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
              ],
            ),

            const Spacer(),
            Image.asset(imagePath),
            const SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}
