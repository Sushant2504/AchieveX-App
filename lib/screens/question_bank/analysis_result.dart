import 'package:achievex/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class AnalysisResult extends StatefulWidget {
  @override
  _AnalysisResultState createState() => _AnalysisResultState();
}

class _AnalysisResultState extends State<AnalysisResult> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Chapter Name',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                ),
              ),


              const SizedBox(width: 15),

              
              Container(
                height: height * 0.04,
                width: width * 0.2,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "RETEST",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: const Color.fromARGB(255, 75, 18, 119),
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 8),

               InkWell(
                 onTap: () => Navigator.pushNamed(context, RoutesName.class11phy),
                 child: Container(
                  height: height * 0.04,
                  width: width * 0.2,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "BACK",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: const Color.fromARGB(255, 75, 18, 119),
                      ),
                    ),
                  ),
                               ),
               ),
            ]),
        backgroundColor: const Color.fromARGB(255, 16, 12, 148),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Container(
                    height: height * 0.1,
                    width: width,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              "ADVANCED TEST FEEDBACK",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0, left: 5.0),
                            child: Text(
                              "Exam Summary",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ]),
                  ),
                ),



                Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: height * 0.04,
                          width: width * 0.5,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 241, 95, 84),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Marks: -7/100",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),


                        Container(
                          height: height * 0.04,
                          width: width * 0.5,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 244, 145, 137),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Percentile: 98.993245",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
                  child: Container(
                    height: height * 0.32,
                    width: width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 4,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircularPercentIndicator(
                            radius: 70.0,
                            lineWidth: 13.0,
                            animation: true,
                            percent: 0.7,
                            center: new Text(
                              "70.0%",
                              style: new TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              ),
                            ),
                            footer: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                "Capability to Crack this topic",
                                style: new TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.0,
                                ),
                              ),
                            ),
                            circularStrokeCap: CircularStrokeCap.round,
                            progressColor:
                                const Color.fromARGB(255, 16, 12, 148),
                          ),
                          const SizedBox(height: 5.0),
                          Text(
                            "Rank: 30",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontFamily: "Poppins",
                            ),
                          ),
                        ]),
                  ),
                ),
                Container(
                  height: height * 0.05,
                  decoration: BoxDecoration(),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Solution and Conceptwise Analysis",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: height * 0.1,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:
                                InkWell(
                                  onTap: () {
                                     
                                  },
                                  child: SC_Box("Questionwise Analysis and Solutions", height, width)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                  
                              },
                              child: SC_Box("Chapterwise Analysis and Learning", height, width)),
                          ),
                        ]),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 200,
                    width: width * 0.9,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes
                        ),
                      ],
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Text(
                                    "Total number of Questions: ",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 13),
                                  child: Text(
                                    "30",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ]),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 20,
                                child: Text(
                                  "0",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white,
                                  ),
                                ),
                                backgroundColor: Colors.green,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                "Answered",
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(width: 10),
                              CircleAvatar(
                                radius: 20,
                                child: Text(
                                  "0",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white,
                                  ),
                                ),
                                backgroundColor:
                                    const Color.fromARGB(255, 88, 34, 214),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                "Answered and marked for review",
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 20,
                                child: Text(
                                  "0",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white,
                                  ),
                                ),
                                backgroundColor:
                                    Color.fromARGB(255, 88, 34, 214),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                "Review Later",
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(width: 25),
                              CircleAvatar(
                                radius: 20,
                                child: Text(
                                  "30",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white,
                                  ),
                                ),
                                backgroundColor: Colors.red,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                "Not Answered",
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(width: 5),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 20,
                                child: Text(
                                  "0",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white,
                                  ),
                                ),
                                backgroundColor: Colors.grey,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                "Not Answered",
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ]
                        
                        ),
                  ),
                ),
                const SizedBox(height: 15),
                SubjectCard(),
                const SizedBox(height: 15),
              ]),
        ),
      ),
    );
  }

  // SC_Box

  Widget SubjectCard() {

    
    return Container(
      height: 250,
      width: 250,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes
            ),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 40,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 118, 239, 122),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Physics",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 100),
                Container(
                  height: 40,
                  width: 30,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "-1",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                      ),

                      // const SizedBox(height: 2),

                      Text(
                        "Marks",
                        style: TextStyle(
                          fontSize: 9.0,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
              ],
            ),
          ),


          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Number of Questions: \t \t \t 30",
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
          ),


          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Answered: \t \t \t \t \t \t \t \t \t \t \t \t \t \t \t 1",
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
          ),

          
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Not Answered: \t \t \t \t \t \t \t \t \t \t 29",
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
          ),


          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Marked for Review: \t \t \t \t \t \t 29",
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
          ),

          
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Not Visited: \t \t \t \t \t \t \t \t \t \t \t \t \t \t 0",
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget SC_Box(String text, var height, var width) {
    return Flexible(
      child: Container(
        height: height * 0.6, // Dynamic height
        width: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // Shadow position
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 40,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 16, 12, 148),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  
                  Image.asset('assets/images/analysis.png'),

                  const SizedBox(width: 70),

                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                    color: Colors.white,
                  ),


                ],
              ),
            ),
            Container(
              height: height * 0.06,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Center(
                child: Text(
                  text,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    fontFamily: "Poppins",
                    letterSpacing: 1.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
