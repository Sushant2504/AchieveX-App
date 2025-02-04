import 'dart:async';
import 'package:achievex/screens/solo_games/memory/memory_home_page.dart';
import 'package:flutter/material.dart';
import 'package:nice_buttons/nice_buttons.dart';

class MemoryHomeScreen extends StatefulWidget {
  const MemoryHomeScreen({
    super.key,
  });

  @override
  State<MemoryHomeScreen> createState() => _MemoryHomeScreenState();
}

class _MemoryHomeScreenState extends State<MemoryHomeScreen> {
  List<String> howToPlay = [
    'A grid of Bricks will appear on the screen.',
    'A certain number of Bricks within this grid will be highlighted.',
    'Study the grid and try to memorize the positions of these highlighted Bricks.',
    'You will have a few seconds to do this then.',
    'After the memorization phase, the grid will either disappear or revert to an unhighlighted state, leaving you with a blank grid or a grid where all Bricks look the same.',
    'Using your memory, click on the Bricks that were highlighted in the memorization phase.',
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
              color: Colors.orange,
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
                          "assets/images/memory-cards.png",
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
                        onPressed: () {
                          Navigator.pop(context);
                        },
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
                        "Memory",
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        '''Bricks Matrix: 
    Memory Matrix Mastery''',
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
              '''"The goal is to enhance memory retention and recall abilities by exercising the brain's capacity to store and retrieve visual information."''',
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
                  RuleBox(width, height, howToPlay[5]),
                  RuleBox(width, height, howToPlay[6]),
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
              borderColor: Colors.orange.shade800,
              startColor: Colors.orange.shade400,
              endColor: Colors.orange.shade400,
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
                    builder: (context) => const MemoryMatrixGame(),
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
          color: Colors.orange.shade200,
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
