import 'dart:async';

import 'package:achievex/screens/solo_games/executive/coordination_game.dart';
import 'package:flutter/material.dart';
import 'package:nice_buttons/nice_buttons.dart';

class CoordinationHomeScreen extends StatefulWidget {
  const CoordinationHomeScreen({
    super.key,
  });

  @override
  State<CoordinationHomeScreen> createState() => _CoordinationHomeScreenState();
}

class _CoordinationHomeScreenState extends State<CoordinationHomeScreen> {
  List<String> howToPlay = [
    'The game consists of presenting players with a sequence of numbers.',
    'Players are then given specific instructions to perform operations on the numbers in the sequence.',
    'Example Instructions:"Tell the number which comes in the 5th position.": Players must identify and state the number that appears in the 5th position of the sequence.',
    'Example Instructions:"Add the number in the 2nd position to the number in the 3rd position.": Players must add the number in the 2nd position of the sequence to the number in the 3rd position and provide the result',
    'You can also check out Tutorial Video of it on courses section.',
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: height * 0.28,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.green,
            ),
            child: Stack(
              children: [
                Positioned(
                  top: height * 0.06,
                  right: 10,
                  child: Container(
                    height: height * 0.2,
                    width: width * 0.4,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage(
                          "assets/images/functionality.png",
                        ),
                        fit: BoxFit.contain,
                      ),
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                Positioned(
                  left: 12,
                  top: height * 0.05,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(
                            Colors.grey.shade400,
                          ),
                        ),
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        iconSize: 30,
                      ),
                      SizedBox(
                        height: height * 0.058,
                      ),
                      Text(
                        "Executive Functioning",
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        '''Executive Edge: 
Number Edition''',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: width * 0.035,
              top: height * 0.02,
            ),
            child: const Text(
              "Objective:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: width * 0.035,
              right: width * 0.035,
              top: height * 0.01,
            ),
            child: const Text(
              '''"Number Edition.The objective of the game is to test and improve executive functioning skills such as working memory, cognitive flexibility, and attention by manipulating and processing number sequences."''',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: width * 0.035,
              right: width * 0.035,
              top: height * 0.01,
              bottom: height * 0.01,
            ),
            child: const Text(
              "How to Play:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  RuleBox(width, height, howToPlay[0]),
                  RuleBox(width, height, howToPlay[1]),
                  RuleBox(width, height, howToPlay[2]),
                  RuleBox(width, height, howToPlay[3]),
                  RuleBox(width, height, howToPlay[4]),
                ],
              ),
            ),
          ),
          SizedBox(height: height * 0.02),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.05,
              vertical: height * 0.013,
            ),
            child: NiceButtons(
              stretch: true,
              borderColor: Colors.green.shade800,
              startColor: Colors.green.shade400,
              endColor: Colors.green.shade400,
              progress: true,
              gradientOrientation: GradientOrientation.Horizontal,
              onTap: (finish) {
                print('On tap called');
                Timer(const Duration(seconds: 3), () {
                  finish();
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CoordinationGame(),
                  ),
                );
              },
              child: const Text(
                'Start',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: height * 0.02),
        ],
      ),
    );
  }

  Padding RuleBox(double width, double height, String howToPlay) {
    return Padding(
      padding: EdgeInsets.only(
        left: width * 0.035,
        top: height * 0.005,
        bottom: height * 0.005,
      ),
      child: Container(
        width: width * 0.9,
        decoration: BoxDecoration(
          color: Colors.green.shade200,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: width * 0.04,
                right: width * 0.01,
              ),
              child: const Icon(Icons.radio_button_checked),
            ),
            SizedBox(width: width * 0.035),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  top: height * 0.01,
                  bottom: height * 0.01,
                  right: width * 0.035,
                ),
                child: Text(
                  howToPlay,
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
