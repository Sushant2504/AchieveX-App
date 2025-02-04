import 'dart:async';
import 'package:achievex/screens/solo_games/visuospatial/mirror_water_image_game.dart';
import 'package:flutter/material.dart';
import 'package:nice_buttons/nice_buttons.dart';

class MirrorHomeScreen extends StatefulWidget {
  const MirrorHomeScreen({
    super.key,
  });
  @override
  State<MirrorHomeScreen> createState() => _MirrorHomeScreenState();
}

class _MirrorHomeScreenState extends State<MirrorHomeScreen> {
  List<String> howToPlay = [
    'A number will pop up on the screen for a brief moment.',
    'You need to identify the mirror or reverse form of this number from three options provided below the number.',
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
              color: Colors.blue,
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
                          "assets/images/visualization.png",
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
                        "Visuospatial",
                        style: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        '''Numeral Nexus:
The Visuospatial Odyssey''',
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
              '''"Number Magic" aims to enhance players' visuospatial skills by presenting them with numerical puzzles and tasks that require mental manipulation, visualization, and spatial reasoning. Players must strategically arrange and manipulate numbers within a spatial grid to solve puzzles, complete patterns, and achieve specified objectives. By engaging in these activities, players exercise their ability to mentally represent and manipulate numerical information in a spatial context, leading to improvements in visuospatial skills.''',
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
              borderColor: Colors.blue.shade800,
              startColor: Colors.blue.shade400,
              endColor: Colors.blue.shade400,
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
                    builder: (context) => const DigitGameScreen(
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
          color: Colors.blue.shade200,
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
