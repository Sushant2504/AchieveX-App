import 'package:achievex/screens/QuestionBank/Exam/Full-Test/JEE-ADVANCED/fulltest_exam.dart';
import 'package:achievex/screens/QuestionBank/Exam/Full-Test/JEE-MAIN/shift_screen.dart';
import 'package:achievex/screens/QuestionBank/Exam/Full-Test/JEE-MAIN/shiftdata.dart';
import 'package:flutter/material.dart';
import 'package:achievex/screens/QuestionBank/Database/JEE-MAIN/Full-Test/full_test_papers.dart';

late bool checked = true;


class YearNamesScreen extends StatefulWidget {
  final String exam;
  
  YearNamesScreen({required this.exam});

  @override
  _YearNamesScreenState createState() => _YearNamesScreenState();
}

class _YearNamesScreenState extends State<YearNamesScreen> {


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
                            MaterialPageRoute(builder: (context) => checked ? ShiftScreen(year: year_2024, paper: jee_mains_2024_set_1,) : FullJeeAdvancedExam()),
                          );
                      },
                      child:  YearCard(height, width, 2024),
                    ),
                    InkWell(
                      onTap: () {
                          Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context) => checked ? ShiftScreen(year: year_2023, paper: jee_mains_2024_set_1,) : FullJeeAdvancedExam()),
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
                            MaterialPageRoute(builder: (context) => checked ? ShiftScreen(year: year_2022, paper: jee_mains_2024_set_1,) : FullJeeAdvancedExam()),
                          );
                      },
                      child:  YearCard(height, width, 2022),
                    ),
                    InkWell(
                      onTap: () {
                          Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context) => checked ? ShiftScreen(year: year_2021, paper: jee_mains_2024_set_1,) : FullJeeAdvancedExam()),
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
                            MaterialPageRoute(builder: (context) => checked ? ShiftScreen(year: year_2020, paper: jee_mains_2024_set_1,) : FullJeeAdvancedExam()),
                          );
                      },
                      child:  YearCard(height, width, 2020),
                    ),
                    InkWell(
                      onTap: () {
                          Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context) => checked ? ShiftScreen(year: year_2019, paper: jee_mains_2024_set_1,) : FullJeeAdvancedExam()),
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
                            MaterialPageRoute(builder: (context) => checked ? ShiftScreen(year: year_2018, paper: jee_mains_2024_set_1,) : FullJeeAdvancedExam()),
                          );
                      },
                      child:  YearCard(height, width, 2018),
                    ),
                    InkWell(
                      onTap: () {
                          Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context) => checked ? ShiftScreen(year: year_2017, paper: jee_mains_2024_set_1,) : FullJeeAdvancedExam()),
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
                            MaterialPageRoute(builder: (context) => checked ? ShiftScreen(year: year_2016, paper: jee_mains_2024_set_1,) : FullJeeAdvancedExam()),
                          );
                      },
                      child:  YearCard(height, width, 2016),
                    ),
                    InkWell(
                      onTap: () {
                          Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context) => checked ? ShiftScreen(year: year_2015, paper: jee_mains_2024_set_1,) : FullJeeAdvancedExam()),
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
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
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
                    style: TextStyle(
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
              Center(
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
