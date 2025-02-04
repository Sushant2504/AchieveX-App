import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AllQuestions extends StatelessWidget {
  final List<List<dynamic>> paper;

  const AllQuestions({required this.paper, super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    final FixedExtentScrollController controller = FixedExtentScrollController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListWheelScrollView(
          controller: controller,
          itemExtent: 300,
          physics: const FixedExtentScrollPhysics(),
          children: [


            QuestionCard(height, width, 0),
            QuestionCard(height, width, 1),
            QuestionCard(height, width, 2),
            QuestionCard(height, width, 3),
            QuestionCard(height, width, 4),
            QuestionCard(height, width, 5),
            QuestionCard(height, width, 6),
            QuestionCard(height, width, 7),
            QuestionCard(height, width, 8),
            QuestionCard(height, width, 9),
            QuestionCard(height, width, 10),
            QuestionCard(height, width, 11),
            QuestionCard(height, width, 12),
            QuestionCard(height, width, 13),
            QuestionCard(height, width, 14),
            QuestionCard(height, width, 15),
            QuestionCard(height, width, 16),
            QuestionCard(height, width, 17),
            QuestionCard(height, width, 18),
            QuestionCard(height, width, 19),
            QuestionCard(height, width, 20),
            QuestionCard(height, width, 21),
            QuestionCard(height, width, 22),
            QuestionCard(height, width, 23),
            QuestionCard(height, width, 24),
            QuestionCard(height, width, 25),
            QuestionCard(height, width, 26),
            QuestionCard(height, width, 27),
            QuestionCard(height, width, 28),
            QuestionCard(height, width, 29),

            
          ],
        ),
      ),
    );
  }

  Widget QuestionCard(var height, var width, var index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: height * 0.30,
        width: width * 0.9,
        decoration: BoxDecoration(
          color: HexColor('#5C76FF'),
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), 
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Text(
                "Question ${paper[index][2]}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                  fontFamily: "Poppins",
                ),
                //  overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(
              height: 18.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  paper[index][3],
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                    fontFamily: "Poppins",
                  ),
                  // overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
