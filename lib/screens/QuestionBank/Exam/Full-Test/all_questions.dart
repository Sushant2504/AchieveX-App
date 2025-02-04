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
            QuestionCard(height, width, 30),
            QuestionCard(height, width, 31),
            QuestionCard(height, width, 32),
            QuestionCard(height, width, 33),
            QuestionCard(height, width, 34),
            QuestionCard(height, width, 35),
            QuestionCard(height, width, 36),
            QuestionCard(height, width, 37),
            QuestionCard(height, width, 38),
            QuestionCard(height, width, 39),
            QuestionCard(height, width, 40),
            QuestionCard(height, width, 41),
            QuestionCard(height, width, 42),
            QuestionCard(height, width, 43),
            QuestionCard(height, width, 44),
            QuestionCard(height, width, 45),
            QuestionCard(height, width, 46),
            QuestionCard(height, width, 47),
            QuestionCard(height, width, 48),
            QuestionCard(height, width, 49),
            QuestionCard(height, width, 50),
            QuestionCard(height, width, 51),
            QuestionCard(height, width, 52),
            QuestionCard(height, width, 53),
            QuestionCard(height, width, 54),
            QuestionCard(height, width, 55),
            QuestionCard(height, width, 56),
            QuestionCard(height, width, 57),
            QuestionCard(height, width, 58),
            QuestionCard(height, width, 59),
            QuestionCard(height, width, 60),
            QuestionCard(height, width, 61),
            QuestionCard(height, width, 62),
            QuestionCard(height, width, 63),
            QuestionCard(height, width, 64),
            QuestionCard(height, width, 65),
            QuestionCard(height, width, 66),
            QuestionCard(height, width, 67),
            QuestionCard(height, width, 68),
            QuestionCard(height, width, 69),
            QuestionCard(height, width, 70),
            QuestionCard(height, width, 71),
            QuestionCard(height, width, 72),
            QuestionCard(height, width, 73),
            QuestionCard(height, width, 74),
            QuestionCard(height, width, 75),
            QuestionCard(height, width, 76),
            QuestionCard(height, width, 77),
            QuestionCard(height, width, 78),
            QuestionCard(height, width, 79),
            QuestionCard(height, width, 80),
            QuestionCard(height, width, 81),
            QuestionCard(height, width, 82),
            QuestionCard(height, width, 83),
            QuestionCard(height, width, 84),
            QuestionCard(height, width, 85),
            QuestionCard(height, width, 86),
            QuestionCard(height, width, 87),
            QuestionCard(height, width, 88),
            QuestionCard(height, width, 89),

            
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
