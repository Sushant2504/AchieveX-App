import 'dart:async';
import 'package:achievex/screens/brain_games/addition_game/reasoning.dart';
import 'package:achievex/screens/brain_games/coloured_words/attention.dart';
import 'package:achievex/screens/brain_games/coordination_game/executive.dart';
import 'package:achievex/screens/brain_games/memory_cards/memory.dart';
import 'package:achievex/screens/brain_games/mirror_game/visuolization.dart';
import 'package:achievex/screens/brain_games/results_screen.dart';
import 'package:achievex/screens/brain_games/widgets/button.dart';
import 'package:achievex/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:nice_buttons/nice_buttons.dart';

class BrainGameScreen extends StatefulWidget {
  const BrainGameScreen({super.key});

  @override
  State<BrainGameScreen> createState() => _BrainGameScreenState();
}

class _BrainGameScreenState extends State<BrainGameScreen> {
  List<String> menuItems = [
    'Memory',
    'Reasoning',
    'Attention',
    'Visuospatial',
    'Executive Functioning',
  ];

  List<String> menuImages = [
    'assets/images/memory.png',
    'assets/images/reasoning.png',
    'assets/images/attention_dark.png',
    'assets/images/visualization.png',
    'assets/images/executive.png',
  ];

  final List<Widget Function(int)> _games = [
    (score) => Game1(score), // fixed
    (score) => Game2(score), // fixed
    (score) => Game3(score), // fixed
    (score) => Game4(score), // fixed
    (score) => Game5(score), // fixed
  ];

  final List<int> _scores = [];
  int _currentGameIndex = 0;

  @override
  void initState() {
    super.initState();
    _games.shuffle(); // Randomize game order
  }

  void _nextGame(int score) {
    _scores.add(score);
    setState(() {
      _currentGameIndex++;
    });

    if (_currentGameIndex < _games.length) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => _games[_currentGameIndex](_scores.last),
        ),
      ).then((result) {
        if (result != null) {
          _nextGame(result);
        }
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultsScreen(scores: _scores),
        ),
      );
    }
  }

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
              color: Colors.blue.shade400,
            ),
            child: Stack(
              children: [
                Positioned(
                  top: height * 0.03,
                  right: 0,
                  child: Container(
                    height: height * 0.24,
                    width: width * 0.5,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage(
                          "assets/images/neuron.png",
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
                              WidgetStateProperty.all(Colors.blueAccent),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MyHomePage(title: 's'),
                            ),
                          );
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.grey.shade400,
                        ),
                        iconSize: 30,
                      ),
                      SizedBox(
                        height: height * 0.08,
                      ),
                      Text(
                        '''NeuroSpectrum:
The Cognitive Adventure''',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade400,
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
              right: width * 0.035,
              top: height * 0.02,
            ),
            child: const Text(
              '''"Introducing "Neurospectrum" The Ultimate Cognitive Challenge. A comprehensive brain test comprising five engaging brain games, each designed to target specific cognitive parameters mentioned as below."''',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: width * 0.035,
              top: height * 0.04,
              bottom: height * 0.01,
            ),
            child: const Text(
              "Parameters:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(
                left: width * 0.035,
                right: width * 0.035,
              ),
              itemCount: menuItems.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: height * 0.01),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: height * 0.035,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: width * 0.03,
                          ),
                          child: Center(
                            child: Row(
                              children: [
                                Image.asset(
                                  menuImages[index],
                                  height: 20,
                                  width: 20,
                                ),
                                Text(
                                  ' ${menuItems[index]}',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      MyButton(
                        gameName: menuItems[index],
                        description: getDescriptionForGame(menuItems[index]),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.05,
              vertical: height * 0.013,
            ),
            child: NiceButtons(
              stretch: true,
              borderColor: Colors.blue.shade800,
              startColor: Colors.blue.shade300,
              endColor: Colors.blue.shade300,
              progress: true,
              gradientOrientation: GradientOrientation.Horizontal,
              onTap: (finish) {
                print('On tap called');
                Timer(const Duration(seconds: 3), () {
                  finish();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => _games[_currentGameIndex](0),
                    ),
                  ).then((result) {
                    if (result != null) {
                      _nextGame(result);
                    }
                  });
                });
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

  String getDescriptionForGame(String gameName) {
    switch (gameName) {
      case 'Memory':
        return 'Memory is a fundamental cognitive function that involves the encoding, storage, and retrieval of information. It plays a crucial role in our daily lives, enabling us to learn, interact, and make decisions.';
      case 'Reasoning':
        return 'Reasoning is the mental process of thinking logically and making sense of information to draw conclusions, solve problems, and make decisions.';
      case 'Attention':
        return 'Attention is a cognitive process that allows us to selectively focus on certain aspects of our environment or internal thoughts while ignoring others. It plays a crucial role in perception, learning, memory, and other cognitive functions.';
      case 'Visuospatial':
        return 'Visuospatial skills refer to the ability to perceive, analyze, and mentally manipulate visual information in relation to space. These skills involve understanding the spatial relationships between objects, navigating through environments, and mentally rotating or manipulating objects in the minds eye.';
      case 'Executive Functioning':
        return 'Executive functioning refers to a set of cognitive processes that enable individuals to plan, organize, manage time, regulate emotions, and control behavior to achieve goals. These higher-order mental abilities play a crucial role in guiding and coordinating complex tasks and behaviors.';
      default:
        return 'Description not available';
    }
  }
}
