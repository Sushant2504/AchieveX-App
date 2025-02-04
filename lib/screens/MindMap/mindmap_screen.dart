import 'package:achievex/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';

class MindMapScreen extends StatefulWidget {
  const MindMapScreen({super.key});

  @override
  _MindMapScreenState createState() => _MindMapScreenState();
}

class _MindMapScreenState extends State<MindMapScreen> {
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
                          'Facing',
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
                          'Confront',
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
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  margin: const EdgeInsets.only(top: 20, right: 18, left: 18),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Here are a few advantages of regularly practicing PYQS:',
                          style: TextStyle(
                              fontFamily: 'Promt-Bold',
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              fontSize: 13),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 15, top: 15),
                            height: 4,
                            width: 4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.black,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Exam Familiarity: Practicing PYQs exposes \n you to the exact format and difficulty level of \nthe JEE and NEET exams.',
                              style: TextStyle(
                                fontFamily: 'Promt',
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 15, top: 15),
                            height: 4,
                            width: 4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.black,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Self-Assessment: PYQs help you identify your \nstrengths and weaknesses, allowing you \n to focus on areas that need improvement',
                              style: TextStyle(
                                  fontFamily: 'Promt',
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                  fontSize: 13),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 15, top: 15),
                            height: 4,
                            width: 4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.black,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Time Management: Solving PYQs can improve your\n time management skills, as you learn \nto allocate time effectively during the exam.',
                              style: TextStyle(
                                  fontFamily: 'Promt',
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                  fontSize: 13),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 15, top: 15),
                            height: 4,
                            width: 4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.black,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Confidence Boost: Practicing PYQs can boost \nyour confidence as you become familiar \n with the types of questions asked and \ndevelop strategies to tackle them.',
                              style: TextStyle(
                                  fontFamily: 'Promt',
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                  fontSize: 13),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 15, top: 15),
                            height: 4,
                            width: 4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.black,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Trend Analysis: PYQs can provide valuable \n insights into the trends and patterns in \n the exam, helping you anticipate the types of \n questions that may be asked.',
                              style: TextStyle(
                                  fontFamily: 'Promt',
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                  fontSize: 13),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                    'Choose your Class:',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                InkWell(
                    onTap: () =>
                        Navigator.pushNamed(context, RoutesName.class1),
                    child: CustomCard(
                        imagePath: "assets/images/11th_class.png",
                        title: "Class 11",
                        containerColor:
                            const Color.fromARGB(255, 60, 106, 145))),
                const SizedBox(
                  height: 8.0,
                ),
                InkWell(
                  onTap: () => Navigator.pushNamed(context, RoutesName.class2),
                  child: CustomCard(
                      imagePath: "assets/images/12th_class.png",
                      title: "Class 12",
                      containerColor: const Color.fromARGB(255, 50, 137, 65)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget BottomButton(var height, var width, BuildContext context) {
    return Container(
      height: height * 0.2,
      width: width * 0.9,
      decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes
            ),
          ]),

         child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            
             children: [
                   
                   Center(
                       child: Text(
                           "Create Your MindMap",
                           style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                           ),
                       ),
                   ),
             ]
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
