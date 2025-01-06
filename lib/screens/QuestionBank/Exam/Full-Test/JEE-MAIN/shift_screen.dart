import 'package:achievex/screens/QuestionBank/Exam/Full-Test/JEE-MAIN/fulltest_exam.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:achievex/screens/QuestionBank/Exam/Full-Test/JEE-MAIN/paper_data.dart';

class ShiftScreen extends StatefulWidget {
  final List<String> year;
  final List<List<dynamic>> paper;

  ShiftScreen({
    required this.year, 
    required this.paper,
  });

  @override
  _ShiftScreenState createState() => _ShiftScreenState();
}

class _ShiftScreenState extends State<ShiftScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: ListView.builder(
        itemCount: widget.year.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: ShiftCard(height, width, widget.year[index],
                HexColor('#5C76FF'), widget.paper),
          );
        },
      ),
    );
  }

  Widget ShiftCard(var height, var width, String text, Color color,
      List<List<dynamic>> paper) {
    return Padding(
      padding: EdgeInsets.only(left: 7.0, right: 7.0, top: 10.0, bottom: 10.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          height: height * 0.09,
          width: width * 0.28,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5), // Shadow color
                spreadRadius: 5, // How much the shadow spreads
                blurRadius: 5, // How blurry the shadow is
                offset: Offset(0, 3), // Changes position of shadow
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: height * 0.09,
                  width: width * 0.015,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0),
                    ),
                  )),
              const SizedBox(
                width: 15.0,
              ),
              Text(
                text,
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
