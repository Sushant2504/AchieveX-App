import 'package:achievex/ui/theme.dart';
import 'package:achievex/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import '../../utils/app_constants.dart';

class ChooseExam extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: Padding(
            padding: EdgeInsets.all(8.0),
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
                          'assets/images/mind_map.png',
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
                          'Here are a few things you can try to grap knowledge fast:',
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
                              'Visual Organization: Mind maps use branches \n and nodes to organize information visually.',
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
                              'Enhanced Creativity: Mind maps stimulate \n creativity by encouraging free \n thinking and idea exploration.',
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
                              'Improved Memory: Mind maps create mental \n pictures that are easier to recall \n than lists or outlines.',
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
                              'Effective Studying and Learning: Mind maps break \n down complex topics and help \n identify key concepts.',
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
                              'Versatile Applications: Mind maps have various uses,\n including project planning, note-taking, \nproblem-solving, and goal setting.',
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
                    'Choose your Category',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      // fontFamily: 'Prompt-Bold',
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  ),
                ),
                
                SizedBox(
                  height: 8.0,
                ),
                

                InkWell(
                    onTap: () => Navigator.pushNamed(context, RoutesName.class1),
                    child: CustomCard(
                        imagePath: "assets/images/11th_class.png",
                        title: "Class 11",
                        containerColor: const Color.fromARGB(255, 60, 106, 145))
                  ),

                const SizedBox(height: 8.0,),

                InkWell(
                  onTap: () => Navigator.pushNamed(context, RoutesName.pcb),

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

  Widget CustomCard({
    required String imagePath,
    bool isPremium = false,
    required String title,
    required Color containerColor,
    Color textColor = Colors.black,
  }) {
    return Center(
      child: Container(
        height: 200,
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
                    fontSize: 30,
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
