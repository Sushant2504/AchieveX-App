import 'package:achievex/screens/solo_games/reasoning/addition_game_home.dart';
import 'package:flutter/material.dart';

class AdditionHomeScreen extends StatefulWidget {
  const AdditionHomeScreen({
    super.key,
  });

  @override
  _AdditionHomeScreenState createState() => _AdditionHomeScreenState();
}

class _AdditionHomeScreenState extends State<AdditionHomeScreen>
    with SingleTickerProviderStateMixin {
  List<String> howToPlay = [
    'The various numbers will shown on screen.',
    'You should add some numbers give by us in multiple options to get outcome equal to shown number.',
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
            decoration: BoxDecoration(
              color: Colors.amber.shade400,
            ),
            child: Stack(
              children: [
                Positioned(
                  top: height * 0.06,
                  right: 0,
                  child: Container(
                    height: height * 0.2,
                    width: width * 0.5,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage(
                          "assets/images/reasoning.png",
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
                          backgroundColor:
                              WidgetStateProperty.all(Colors.grey),
                        ),
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => BrainGameScreen(),
                          //   ),
                          // );
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        iconSize: 30,
                      ),
                      SizedBox(
                        height: height * 0.048,
                      ),
                      Text(
                        "Reasoning",
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        '''Logic Legends:
      Mastering Addition''',
                        style: TextStyle(
                          fontSize: 20,
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
              '''"The Addition Game aims to enhance players' reasoning skills by providing them with mathematical addition problems to solve within a set time limit. Players must apply logical reasoning and strategic thinking to find the correct solutions efficiently. The game challenges players to improve their numerical reasoning, mental math abilities, and decision-making skills while having fun and engaging in a stimulating gameplay experience."''',
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
          ruleBox(width, height, howToPlay[0]),
          ruleBox(width, height, howToPlay[1]),
          ruleBox(width, height, howToPlay[2]),
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.05,
              vertical: height * 0.013,
            ),
            child: ElevatedButton(
              style: ButtonStyle(
                elevation: WidgetStateProperty.all(4),
                backgroundColor: WidgetStateProperty.all(
                  Colors.amber.shade400,
                ),
                padding: WidgetStateProperty.all(
                  EdgeInsets.symmetric(
                    horizontal: width * 0.36,
                    vertical: height * 0.01,
                  ),
                ),
              ),
              onPressed: () {
                // print('On tap called');
                // _startCountdown();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AdditionGame(),
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

  Padding ruleBox(double width, double height, String howToPlay) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.035,
        vertical: height * 0.005,
      ),
      child: Container(
        width: width * 0.9,
        decoration: BoxDecoration(
          color: Colors.amber.shade200,
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
