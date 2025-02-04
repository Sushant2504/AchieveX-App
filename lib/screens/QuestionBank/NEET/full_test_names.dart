import 'package:achievex/screens/QuestionBank/NEET/full_test_exam.dart';
import 'package:flutter/material.dart';
import 'package:achievex/screens/QuestionBank/Database/NEET/full_test.dart';

class FullTestNames extends StatefulWidget {
  const FullTestNames({super.key});

  @override
  _FullTestNamesState createState() => _FullTestNamesState();
}

class _FullTestNamesState extends State<FullTestNames> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

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
                          'Year',
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
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                          Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context) => FullNeetExam(Set: neet_2024)),
                          );
                      },
                      child:  YearCard(height, width, 2024),
                    ),
                    InkWell(
                      onTap: () {
                          Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context) => FullNeetExam(Set: neet_2024)),
                          );
                      },
                      child:  YearCard(height, width, 2023),
                    ),
                  ],
                ),
                const SizedBox(height: 5.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                          Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context) => FullNeetExam(Set: neet_2024)),
                          );
                      },
                      child:  YearCard(height, width, 2022),
                    ),
                    InkWell(
                      onTap: () {
                          Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context) => FullNeetExam(Set: neet_2024)),
                          );
                      },
                      child:  YearCard(height, width, 2021),
                    ),
                  ],
                ),
                const SizedBox(height: 5.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                          Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context) => FullNeetExam(Set: neet_2024)),
                          );
                      },
                      child:  YearCard(height, width, 2020),
                    ),
                    InkWell(
                      onTap: () {
                          Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context) => FullNeetExam(Set: neet_2024)),
                          );
                      },
                      child:  YearCard(height, width, 2019),
                    ),
                  ],
                ),
                const SizedBox(height: 5.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                          Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context) => FullNeetExam(Set: neet_2024)),
                          );
                      },
                      child:  YearCard(height, width, 2018),
                    ),
                    InkWell(
                      onTap: () {
                          Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context) => FullNeetExam(Set: neet_2024)),
                          );
                      },
                      child:  YearCard(height, width, 2017),
                    ),
                  ],
                ),
                const SizedBox(height: 5.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                          Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context) => FullNeetExam(Set: neet_2024)),
                          );
                      },
                      child:  YearCard(height, width, 2016),
                    ),
                    InkWell(
                      onTap: () {
                          Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context) => FullNeetExam(Set: neet_2024)),
                          );
                      },
                      child:  YearCard(height, width, 2015),
                    ),
                  ],
                ),
                const SizedBox(height: 200.0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget YearCard(var height, var width, int year) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          height: height * 0.1,
          width: width * 0.40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5), // Shadow color
                spreadRadius: 5, // How much the shadow spreads
                blurRadius: 5, // How blurry the shadow is
                offset: const Offset(0, 3), // Changes position of shadow
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
                    padding: const EdgeInsets.all(2.0),
                    child: Image.asset(
                      'assets/images/calendar.png',
                      height: 40,
                      width: 40,
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    year.toString(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Poppins",
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 7.0,
              ),
              const Center(
                child: Text(
                  "Previous Year Papers",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    fontFamily: "Poppins",
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
