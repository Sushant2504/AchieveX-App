import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nice_buttons/nice_buttons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:achievex/screens/brain_games/addition_game/reasoning.dart';
import 'package:achievex/screens/brain_games/coloured_words/attention.dart';
import 'package:achievex/screens/brain_games/coordination_game/executive.dart';
import 'package:achievex/screens/brain_games/memory_cards/memory.dart';
import 'package:achievex/screens/brain_games/mirror_game/visuolization.dart';
import 'package:achievex/screens/brain_games/neuropractice/neuro_result.dart';
import 'package:achievex/screens/home.dart';

class NeuroHomeScreen extends StatefulWidget {
  const NeuroHomeScreen({super.key});

  @override
  State<NeuroHomeScreen> createState() => _NeuroHomeScreenState();
}

class _NeuroHomeScreenState extends State<NeuroHomeScreen> {
  final List<Widget Function(int)> _allGames = [
    (score) => Game1(score),
    (score) => Game2(score),
    (score) => Game3(score),
    (score) => Game4(score),
    (score) => Game5(score),
  ];

  final List<String> _allGameNames = [
    'Reasoning',
    'Attention',
    'Executive Functioning',
    'Memory',
    'Visuospatial',
  ];

  final List<String> _allGameImages = [
    'assets/images/reasoning.png',
    'assets/images/attention_dark.png',
    'assets/images/executive.png',
    'assets/images/memory.png',
    'assets/images/visualization.png',
  ];

  late List<Widget Function(int)> _selectedGames;
  late List<String> _selectedGameNames;
  late List<String> _selectedGameImages;
  final List<int> _scores = [];
  final Map<String, int> _previousScores = {};
  final Map<String, double> _percentages = {};
  final Map<String, double> _differences = {};
  int _currentGameIndex = 0;

  @override
  void initState() {
    super.initState();
    _loadPreviousScores();
  }

  Future<void> _loadPreviousScores() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      for (String gameName in _allGameNames) {
        _previousScores[gameName] = prefs.getInt(gameName) ?? 0;
      }
    });
  }

  Future<void> _saveScores() async {
    final prefs = await SharedPreferences.getInstance();
    for (int i = 0; i < _selectedGameNames.length; i++) {
      String gameName = _selectedGameNames[i];
      int score = _scores[i];
      await prefs.setInt(gameName, score);
    }
  }

  void _navigateToNextGame() {
    int initialScore = _scores.isEmpty ? 0 : _scores.last;

    if (_currentGameIndex < 3) {
      // Only play 3 games
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => _selectedGames[_currentGameIndex](initialScore),
        ),
      ).then((result) {
        if (result != null) {
          _scores.add(result);
          setState(() {
            _currentGameIndex++;
          });
          if (_currentGameIndex < 3) {
            // Navigate to the next game if we haven't played all 3 yet
            _navigateToNextGame();
          } else {
            // Calculate percentages and differences
            _calculatePercentagesAndDifferences();
            // Save current scores
            _saveScores();
            // All games played, navigate to results screen
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => NeuroResult(
                  scores: _scores,
                  gameNames: _selectedGameNames,
                  gameImages: _selectedGameImages,
                  percentages: _percentages,
                  differences: _differences,
                ),
              ),
            );
          }
        } else {
          // Handle if result is null (user cancelled?)
        }
      });
    }
  }

  void _calculatePercentagesAndDifferences() {
    const int maxScore = 100; // Assume max score is 100 for all games

    for (int i = 0; i < _selectedGameNames.length; i++) {
      String gameName = _selectedGameNames[i];
      int currentScore = _scores[i];
      int previousScore = _previousScores[gameName] ?? 0;

      double percentage = (currentScore / maxScore) * 100;
      double difference = percentage - ((previousScore / maxScore) * 100);

      _percentages[gameName] = percentage;
      _differences[gameName] = difference;
    }
  }

  void _startGames() {
    // Shuffle and select 3 games and their names
    List<int> indices = List.generate(_allGames.length, (index) => index)
      ..shuffle();
    _selectedGames = indices.take(3).map((index) => _allGames[index]).toList();
    _selectedGameNames =
        indices.take(3).map((index) => _allGameNames[index]).toList();
    _selectedGameImages =
        indices.take(3).map((index) => _allGameImages[index]).toList();

    // Start the game sequence
    _navigateToNextGame();
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
              color: Colors.blueAccent.shade700,
            ),
            child: Stack(
              children: [
                Positioned(
                  top: height * 0.08,
                  right: width * 0.05,
                  child: Container(
                    height: height * 0.2,
                    width: width * 0.3,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage(
                          "assets/images/neuropractice.png",
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
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const MyHomePage(title: 's'),
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
                        'NeuroPractice:\nBoost Your Practice',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade800,
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
              'Welcome to NeuroPractice: Train Your Brain\n'
              'Enhance your cognitive abilities with our scientifically designed brain game. '
              'NeuroPractice challenges your brain across three key parameters of five essential cognitive skills, ensuring a comprehensive mental workout.',
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
              top: height * 0.02,
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
              itemCount: _allGameNames.length,
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
                                  _allGameImages[index],
                                  height: 20,
                                  width: 20,
                                ),
                                Text(
                                  ' ${_allGameNames[index]}',
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
                  _startGames(); // Start the game sequence
                });
              },
              child: const Text(
                'Start',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            height: height * 0.01,
          ),
        ],
      ),
    );
  }
}
