import 'package:flutter/material.dart';

class Instruction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550,
      width: 600,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey),
        //   BoxShadow(
        //     color: Colors.grey.withOpacity(0.5),
        //     spreadRadius: 5,
        //     blurRadius: 5,
        //     offset: Offset(0, 3),
        //   ),
        // ],
      ),
      margin: const EdgeInsets.only(top: 20, right: 18, left: 18),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Text(
                'Here are a few advantages of regularly practicing PYQS:',
                style: TextStyle(
                  fontFamily: 'Promt-Bold',
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: 13,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          Liner(),
          const SizedBox(height: 15.0),
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
                  'Time Management: Solving PYQs can improve \n your time management skills, as you learn \nto allocate time effectively during the exam.',
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
                  'Confidence Boost: Practicing PYQs can \n boost your confidence as you \n become familiar with the types of \n questions asked and develop strategies\n to tackle them.',
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
    );
  }

  Widget Liner() {
    return SizedBox(
      width: 600,
      height: 1.0,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.grey,
        ),
      ),
    );
  }


}
