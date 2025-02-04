import 'dart:async';
import 'package:achievex/screens/solo_games/attention/color_game.dart';
import 'package:flutter/material.dart';
import 'package:nice_buttons/nice_buttons.dart';

class ColouredHomeScreen extends StatefulWidget {
  const ColouredHomeScreen({
    super.key,
  });

  @override
  State<ColouredHomeScreen> createState() => _ColouredHomeScreenState();
}

class _ColouredHomeScreenState extends State<ColouredHomeScreen> {
  List<String> howToPlay = [
    'You will see words on the screen, each word is the name of a color (e.g., "RED", "BLUE", "GREEN").',
    'The color of the text (ink) may match or differ from the word itself.',
    'Your task is to identify the color of the text, not the word and select that text color name in given options.',
    'For example, if the word "RED" is printed in blue ink, you should select "Blue" option.',
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
              color: Colors.red,
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
                          "assets/images/attention.png",
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
                        "Attention",
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        '''Stroop Strive:
The Attention Challenge''',
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
              '''"The Stroop Test game aims to evaluate and enhance players' attentional control by presenting them with stimuli that require rapid and accurate responses while inhibiting interference from conflicting information. By measuring reaction time and accuracy in identifying target stimuli amidst distracting information, the game provides valuable insights into attentional capacity and cognitive processing efficiency."''',
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
              borderColor: Colors.red.shade800,
              startColor: Colors.red.shade400,
              endColor: Colors.red.shade400,
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
                    builder: (context) => const ColorGame(
                    ),
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
          color: Colors.red.shade200,
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
