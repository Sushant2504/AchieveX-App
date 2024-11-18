import 'package:achievex/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_count_down.dart';

List<String> option = [
  "A",
  "B",
  "C",
  "D",
];

List<String> optiontext = [
  "Na2CO3",
  "BeCO3",
  "Li2CO3",
  "Ca(HCO3)2",
];

List<List<String>> QuestionCount = [
  ["1", "2", "3", "4", "5"],
  ["6", "7", "8", "9", "10"],
  ["11", "12", "13", "14", "15"],
  ["16", "17", "18", "19", "20"],
  ["21", "22", "23", "24", "25"],
  ["26", "27", "28", "29", "30"],
];

var _QuestionIndex = 0;


class QuestionBankScreen extends StatefulWidget {
  @override
  _QuestionBankScreenState createState() => _QuestionBankScreenState();
}

class _QuestionBankScreenState extends State<QuestionBankScreen> {
  var _QuestionNumber = 0;
  final int _TotalQuestions = 30;
  late int seconds;
  late int minutes;

  
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

            Countdown(
              seconds: 3600,
              build: (BuildContext context, double time) {
                minutes = (time ~/ 60);
                seconds = (time % 60).toInt();
                return Text(
                  '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}',
                  style: TextStyle(
                    color: Colors.white,    
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                );
              },
              interval: Duration(milliseconds: 100),
              onFinished: (dynamic time) {
                print('Timer is done!');
 
                
                OnsubmitPopup(height, width);
              },
            ),


            InkWell(
              onTap: () {
                   OnsubmitPopup(height, width);
              },
              child: Container(
                height: height * 0.04,
                width: width * 0.2,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "SUBMIT",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: const Color.fromARGB(255, 75, 18, 119),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 16, 12, 148),
      ),
      drawer: CustomDrawer(height, width, QuestionCount),
      body: Container(
        height: height * 0.9,
        width: width,
        child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: height * 0.04,
                        width: width * 0.2,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 16, 12, 148),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "subject",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
              const SizedBox(height: 5.0),
              Container(
                height: height * 0.06,
                width: width,
                color: const Color.fromARGB(255, 16, 12, 148),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [


                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Q.1",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),

                      // const SizedBox(width: 4.0),

                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Single Choice",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: height * 0.08,
                  width: width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      "CO2 connot be obtained by heating: ",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ),
              Liner(height, width),
              Option(height, width, option[0], optiontext[0]),
              Liner(height, width),
              Option(height, width, option[1], optiontext[1]),
              Liner(height, width),
              Option(height, width, option[2], optiontext[2]),
              Liner(height, width),
              Option(height, width, option[3], optiontext[3]),
              Liner(height, width),
              const SizedBox(height: 230),
              BottomBar(height, width),
            ]),
      ),
    );
  }

  Future<dynamic> OnsubmitPopup(var height, var width) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        // title: Text('Submit Test'),
        content: Container(
          height: height * 0.37,
          width: width * 0.8,
          decoration: BoxDecoration(
            color: Colors.white,
            // borderRadius: BorderRadius.circular(10),
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.grey.withOpacity(0.5),
            //     spreadRadius: 3,
            //     blurRadius: 4,
            //     offset: Offset(0, 3),
            //   ),
            // ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "The Time Remaining:",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                ),
              ),

              Text(
                  '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
              ),
              

              onSubmitStat(height, width),

              const SizedBox(height: 30.0),

              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [

                    Container(
                      height: height * 0.04,
                      width: width * 0.2,


                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 75, 18, 119),
                        borderRadius: BorderRadius.circular(10),
                      ),


                      child: Center(
                        child: Text(
                          "RESUME",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                          ),
                        ),
                      ),


                    ),

                    const SizedBox(width: 20.0),


                    Container(
                      height: height * 0.04,
                      width: width * 0.2,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 75, 18, 119),
                        borderRadius: BorderRadius.circular(10),
                      ),

                      
                      child: Center(
                        child: Text(
                          "SUBMIT",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                          ),
                        ),
                      ),


                    ),

                  ]
                  
                  
                  ),
            ],
          ),
        ),
      ),
    );
  }

  Widget TagContainer(var height, var width, String text) {
    return Container(
      height: height * 0.07,
      width: width * 0.3,
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
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget QuestionMenu(var height, var width, List<List<String>> count) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: height * 0.5,
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: height * 0.03,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.green,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 4,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      "Chemistry",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              QuestionRow(height, width, count[0]),
              QuestionRow(height, width, count[1]),
              QuestionRow(height, width, count[2]),
              QuestionRow(height, width, count[3]),
              QuestionRow(height, width, count[4]),
              QuestionRow(height, width, count[5]),
            ]),
      ),
    );
  }

  Widget QuestionRow(height, width, List<String> s) {
    return Container(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: CircleAvatar(
                radius: 20.0,
                backgroundColor: Colors.grey,
                child: Center(
                  child: Text(
                    s[0],
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: CircleAvatar(
                radius: 20.0,
                backgroundColor: Colors.grey,
                child: Center(
                  child: Text(
                    s[1],
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: CircleAvatar(
                radius: 20.0,
                backgroundColor: Colors.grey,
                child: Center(
                  child: Text(
                    s[2],
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: CircleAvatar(
                radius: 20.0,
                backgroundColor: Colors.grey,
                child: Center(
                  child: Text(
                    s[3],
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: CircleAvatar(
                radius: 20.0,
                backgroundColor: Colors.grey,
                child: Center(
                  child: Text(
                    s[4],
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ]),
    );
  }

  Widget onSubmitStat(var height, var width) {
    return Container(
        height: height * 0.15,
        width: width * 0.90,
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(3.0),

                
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: CircleAvatar(
                          radius: 15.0,
                          backgroundColor:
                              const Color.fromARGB(255, 42, 91, 44),
                          child: Text(
                            "0",
                            style: TextStyle(
                              fontSize: 10.0,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "Answered",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: CircleAvatar(
                          radius: 15.0,
                          backgroundColor: Colors.red,
                          child: Text(
                            "0",
                            style: TextStyle(
                              fontSize: 10.0,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "Not Answered",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                    ]),
              ),


              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: CircleAvatar(
                          radius: 15.0,
                          backgroundColor: Colors.grey,
                          child: Text(
                            "0",
                            style: TextStyle(
                              fontSize: 10.0,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "Not Visited",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: CircleAvatar(
                          radius: 15.0,
                          backgroundColor: const Color.fromARGB(255, 40, 6, 66),
                          child: Text(
                            "0",
                            style: TextStyle(
                              fontSize: 10.0,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "Review Later",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CircleAvatar(
                              radius: 15.0,
                              backgroundImage: NetworkImage(
                                  'https://example.com/avatar.jpg'),
                              child: Text(
                                "0",
                                style: TextStyle(
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(
                          "Answered and Marked for review",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ]),
              ),
            ]),
    
    );
  }

  Widget InstructionCard(var height, var width) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: height * 0.15,
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: CircleAvatar(
                          radius: 10.0,
                          backgroundColor:
                              const Color.fromARGB(255, 42, 91, 44),
                        ),
                      ),
                      Text(
                        "Answered",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: CircleAvatar(
                          radius: 10.0,
                          backgroundColor: Colors.red,
                        ),
                      ),
                      Text(
                        "Not Answered",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                    ]),
              ),


              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: CircleAvatar(
                          radius: 10.0,
                          backgroundColor: Colors.grey,
                        ),
                      ),
                      Text(
                        "Not Visited",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: CircleAvatar(
                          radius: 10.0,
                          backgroundColor: const Color.fromARGB(255, 40, 6, 66),
                        ),
                      ),
                      Text(
                        "Review Later",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                    ]),
              ),


              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CircleAvatar(
                              radius: 10,
                              backgroundImage: NetworkImage(
                                  'https://example.com/avatar.jpg'),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),


                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(
                          "Answered and Marked for review",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                      ),


                    ]),
              ),
            ]),
      ),
    );
  }

  Widget CustomDrawer(var height, var width, List<List<String>> Questioncount) {
    return IconTheme(
      data: IconThemeData(color: Colors.white),
      child: Drawer(
        child: Container(
          height: height * 0.7,
          width: width * 0.9,
          color: Colors.white,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TagContainer(height, width, "QUESTION PAPER"),
                        TagContainer(height, width, "INSTRUCTIONS"),
                      ]),
                ),
                const SizedBox(height: 10.0),
                InstructionCard(height, width),
                const SizedBox(height: 20.0),
                QuestionMenu(height, width, Questioncount),
              ]),
        ),
      ),
    );
  }

  Widget GreyButton(var height, var width, String name) {
    return Container(
      height: height * 0.04,
      width: width * 0.2,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 222, 221, 221),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
          bottomLeft: Radius.circular(10.0),
          bottomRight: Radius.circular(10.0),
        ),
        border: Border.all(
          color: const Color.fromARGB(255, 83, 82, 82), // Border color
          width: 2.0, // Border width
        ),
      ),
      child: Center(
        child: Text(
          name,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _Button(var height, var width, String name) {
    return Container(
      height: height * 0.04,
      width: width * 0.32,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 16, 12, 148),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
          bottomLeft: Radius.circular(10.0),
          bottomRight: Radius.circular(10.0),
        ),
      ),
      child: Center(
        child: Text(
          name,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget BottomBar(var height, var width) {
    return Container(
      height: height * 0.07,
      width: width,
      color: const Color.fromARGB(255, 222, 221, 221),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
                onTap: () {
                  setState(() {
                    if (_QuestionNumber >= 0) {
                      _QuestionNumber--;
                    } else {
                      print("out of the index");
                    }
                  });
                },
                child: _Navigator(Icons.arrow_back_ios)),
            GreyButton(height, width, "Review"),
            GreyButton(height, width, "Clear"),
            InkWell(
              onTap: () =>
                  Navigator.pushNamed(context, RoutesName.AnalysisScreen),
              child: _Button(height, width, "Save and Next"),
            ),
            InkWell(
                onTap: () {
                  setState(() {
                    if (_QuestionNumber <= _TotalQuestions) {
                      _QuestionNumber++;
                    } else {
                      print("out of the index!");
                    }
                  });
                },
                child: _Navigator(Icons.arrow_forward_ios)),
          ]),
    );
  }

  Widget _Navigator(IconData icon) {
    return CircleAvatar(
      radius: 15.0,
      backgroundColor: const Color.fromARGB(255, 16, 12, 148),
      child: Center(
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget Liner(var height, var width) {
    return SizedBox(
      height: height * 0.003,
      child: Container(
        color: Colors.grey,
      ),
    );
  }

  Widget Option(var height, var width, String text, String option) {
    return Container(
      height: height * 0.08,
      child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 20.0,
                backgroundColor: Colors.grey,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Text(
                      text,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 5.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                option,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
            ),
          ]),
    );
  }

  Widget BottomButtom(var height, var width, String text) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Container(
        height: height * 0.04,
        width: width * 0.1,
        decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.horizontal(
              left: Radius.circular(15),
              right: Radius.circular(15),
            ),
            border: Border.all(
              color: Colors.black,
              width: 1.0,
            )),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget OptionCard(var height, var width, String option, String optiontext) {
    return Container(
      height: height * 0.05,
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 30,
              child: Text(
                option,
                style: TextStyle(
                  fontSize: 14,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 8.0,
          ),
          Text(
            optiontext,
            style: TextStyle(
              fontSize: 18,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
