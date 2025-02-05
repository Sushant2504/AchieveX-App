import 'package:achievex/screens/QuestionBank/Chapter%20Screens/JEE%20MAIN/11th_jee_main_chem.dart';
import 'package:achievex/screens/QuestionBank/Database/JEE-MAIN/Chapterwise/Maths.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:achievex/screens/QuestionBank/chapter_names.dart';
import 'package:achievex/screens/Questionbank/Database/JEE-MAIN/Chapterwise/Chemistry.dart';

List<List<String>> class_11_neet = [
  bio11th,
  chemistry11th,
  physics11th,
];

List<List<String>> class_12_neet = [
  bio12th,
  chemistry12th,
  physics12th,
];

class SubjectneetoneScreen extends StatefulWidget {
  @override
  _SubjectneetoneScreenState createState() => _SubjectneetoneScreenState();
}




class _SubjectneetoneScreenState extends State<SubjectneetoneScreen> {
  var global_index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
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
                        'Chapter',
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


              _ChapterCard(1, class_11_neet[0][0], chapter_9_11_set_1,
                  chapter_9_11_set_1, chapter_1_11_set_1),
              _ChapterCard(2, class_11_neet[0][1], chapter_9_11_set_1,
                  chapter_9_11_set_1, chapter_1_11_set_1),
              _ChapterCard(3, class_11_neet[0][2], chapter_9_11_set_1,
                  chapter_9_11_set_1, chapter_1_11_set_1),
              _ChapterCard(4, class_11_neet[0][3], chapter_9_11_set_1,
                  chapter_9_11_set_1, chapter_1_11_set_1),
              _ChapterCard(5, class_11_neet[0][4], chapter_9_11_set_1,
                  chapter_9_11_set_1, chapter_1_11_set_1),
              _ChapterCard(6, class_11_neet[0][5], chapter_9_11_set_1,
                  chapter_9_11_set_1, chapter_1_11_set_1),
              _ChapterCard(7, class_11_neet[0][6], chapter_9_11_set_1,
                  chapter_9_11_set_1, chapter_1_11_set_1),
              _ChapterCard(8, class_11_neet[0][7], chapter_9_11_set_1,
                  chapter_9_11_set_1, chapter_1_11_set_1),
              _ChapterCard(9, class_11_neet[0][8], chapter_9_11_set_1,
                  chapter_9_11_set_1, chapter_1_11_set_1),
              _ChapterCard(10, class_11_neet[0][9], chapter_9_11_set_1,
                  chapter_9_11_set_1, chapter_1_11_set_1),
              _ChapterCard(11, class_11_neet[0][10], chapter_9_11_set_1,
                  chapter_9_11_set_1, chapter_1_11_set_1),
              _ChapterCard(12, class_11_neet[0][11], chapter_9_11_set_1,
                  chapter_9_11_set_1, chapter_1_11_set_1),
              _ChapterCard(13, class_11_neet[0][12], chapter_9_11_set_1,
                  chapter_9_11_set_1, chapter_1_11_set_1),
              _ChapterCard(14, class_11_neet[0][13], chapter_9_11_set_1,
                  chapter_9_11_set_1, chapter_1_11_set_1),
              _ChapterCard(15, class_11_neet[0][14], chapter_9_11_set_1,
                  chapter_9_11_set_1, chapter_1_11_set_1),
              _ChapterCard(16, class_11_neet[0][15], chapter_9_11_set_1,
                  chapter_9_11_set_1, chapter_1_11_set_1),
              _ChapterCard(17, class_11_neet[0][16], chapter_9_11_set_1,
                  chapter_9_11_set_1, chapter_1_11_set_1),
              _ChapterCard(18, class_11_neet[0][17], chapter_9_11_set_1,
                  chapter_9_11_set_1, chapter_1_11_set_1),
              _ChapterCard(19, class_11_neet[0][18], chapter_9_11_set_1,
                  chapter_9_11_set_1, chapter_1_11_set_1),
              _ChapterCard(20, class_11_neet[0][19], chapter_9_11_set_1,
                  chapter_9_11_set_1, chapter_1_11_set_1),
              _ChapterCard(21, class_11_neet[0][20], chapter_9_11_set_1,
                  chapter_9_11_set_1, chapter_1_11_set_1),
              _ChapterCard(22, class_11_neet[0][21], chapter_9_11_set_1,
                  chapter_9_11_set_1, chapter_1_11_set_1),
              _ChapterCard(23, class_11_neet[0][22], chapter_9_11_set_1,
                  chapter_9_11_set_1, chapter_1_11_set_1),
              _ChapterCard(24, class_11_neet[0][23], chapter_9_11_set_1,
                  chapter_9_11_set_1, chapter_1_11_set_1),
                  

            ],
          ),
        ),
      ),
    );
  }


  Widget _ChapterCard(final int index, String text, List<List<dynamic>> c1,
      List<List<dynamic>> c2, List<List<dynamic>> c3) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, 'questionsetscreen', arguments: {
            'chapterset1': c1,
            'chapterset2': c2,
            'chapterset3': c3,
            'subject': "Biology",
          });
        },
        child: Container(
          height: 70,
          width: 330,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0, 2.0),
                blurRadius: 5.0,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  height: 36,
                  width: 36,
                  decoration: BoxDecoration(
                    color: HexColor('#D8DEFF'),
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0, 2.0),
                        blurRadius: 5.0,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      index.toString(),
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Poppins",
                        color: HexColor('#5C76FF'),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: 170,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        text,
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: "Poppins",
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Image.asset("assets/images/for.png"),
            ],
          ),
        ),
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
        ],
      ),
    );
  }
}
