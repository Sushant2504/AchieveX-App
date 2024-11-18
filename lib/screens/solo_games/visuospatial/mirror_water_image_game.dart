import 'dart:math';
import 'package:achievex/screens/solo_games/visuospatial/mirror_game_over.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';

class DigitGameScreen extends StatefulWidget {
  const DigitGameScreen({
    super.key,
  });

  @override
  _DigitGameScreenState createState() => _DigitGameScreenState();
}

class _DigitGameScreenState extends State<DigitGameScreen> {
  final List<int> digits = [1, 2, 3, 4, 5, 6, 7, 9];
  final Map<int, List<String>> digitImages = {
    1: [
      'assets/images/one.png',
      'assets/images/1mir.png',
      'assets/images/1wat.png',
      'assets/images/1nin.png',
    ],
    2: [
      'assets/images/two.png',
      'assets/images/2mir.png',
      'assets/images/2wat.png',
      'assets/images/2nin.png',
    ],
    // Add more transformations for other digits
    3: [
      'assets/images/three.png',
      'assets/images/3mir.png',
      'assets/images/3wat.png',
      'assets/images/3nin.png',
    ],
    4: [
      'assets/images/four.png',
      'assets/images/4mir.png',
      'assets/images/4wat.png',
      'assets/images/4nin.png',
    ],
    5: [
      'assets/images/five.png',
      'assets/images/5mir.png',
      'assets/images/5wat.png',
      'assets/images/5nin.png',
    ],
    6: [
      'assets/images/six.png',
      'assets/images/6mir.png',
      'assets/images/6wat.png',
      'assets/images/6nin.png',
    ],
    7: [
      'assets/images/seven.png',
      'assets/images/7mir.png',
      'assets/images/7wat.png',
      'assets/images/7nin.png',
    ],
    9: [
      'assets/images/nine.png',
      'assets/images/9mir.png',
      'assets/images/9wat.png',
      'assets/images/9nin.png',
    ],
  };

  late int currentDigit;
  late List<String> options = [];
  late String currentPrompt;
  final List<String> prompts = [
    'Find the Mirror Image!',
    'Find the Water Image!'
  ];

  bool _isPaused = false;

  int visualPoints = 0;

  @override
  void initState() {
    super.initState();
    generateNewRound();
  }

  void _navigateToGameOverScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => MirrorGameOver(
          visualPoints: visualPoints,
        ),
      ),
    );
  }

  void generateNewRound() {
    currentDigit = digits[Random().nextInt(digits.length)];
    currentPrompt = prompts[Random().nextInt(prompts.length)];
    List<String> possibleOptions = digitImages[currentDigit]!;
    options = [];

    if (currentPrompt == 'Find the Mirror Image!') {
      options.add(possibleOptions[3]); // Some random images
      options.add(possibleOptions[1]); // correct mirror image
      options.add(possibleOptions[2]); // Some random images
    } else if (currentPrompt == 'Find the Water Image!') {
      options.add(possibleOptions[1]); // Some random images
      options.add(possibleOptions[2]); // correct water image
      options.add(possibleOptions[3]); // Some random images
    }

    options.shuffle();
    setState(() {});
  }

  final CountDownController _controller = CountDownController();

  void checkAnswer(String selected) {
    if ((currentPrompt == 'Find the Mirror Image!' &&
            selected == digitImages[currentDigit]![1]) ||
        (currentPrompt == 'Find the Water Image!' &&
            selected == digitImages[currentDigit]![2])) {
      setState(() {
        visualPoints += 20;
      });
      generateNewRound();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Wrong! Try again.',
          ),
        ),
      );
    }

    if (visualPoints == 200) {
      _controller.pause();
      _navigateToGameOverScreen();
    }
  }

  void _pauseTimer() {
    setState(() {
      _isPaused = true;
    });
    _controller.pause();
  }

  void _resumeTimer() {
    setState(() {
      _isPaused = false;
    });
    _controller.resume();
  }

  void _showPauseMenu() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.amber,
          title: const Center(
            child: Text(
              "Game Paused",
            ),
          ),
          content: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _resumeTimer();
                },
                icon: const Icon(
                  Icons.play_arrow,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.exit_to_app_outlined,
                ),
              ),
            ],
          ),
        );
      },
    ).then((_) {
      if (_isPaused) _resumeTimer();
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: height * 0.1),
                    child: CircularCountDownTimer(
                      duration: 30,
                      initialDuration: 0,
                      controller: _controller,
                      width: width * 0.3,
                      height: height * 0.3,
                      ringColor: Colors.grey[300]!,
                      ringGradient: null,
                      fillColor: Colors.red,
                      fillGradient: null,
                      backgroundColor: Colors.transparent,
                      backgroundGradient: null,
                      strokeWidth: 5.0,
                      strokeCap: StrokeCap.round,
                      textStyle: const TextStyle(
                        fontSize: 33.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      textFormat: CountdownTextFormat.S,
                      isReverse: true,
                      isReverseAnimation: true,
                      isTimerTextShown: true,
                      autoStart: true,
                      onStart: () {
                        debugPrint('Countdown Started');
                      },
                      onComplete: () {
                        debugPrint('Countdown Ended');
                        _navigateToGameOverScreen();
                      },
                      onChange: (String timeStamp) {
                        debugPrint('Countdown Changed $timeStamp');
                      },
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: height * 0.14,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade600,
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: height * 0.06,
                            left: 0,
                            child: Container(
                              height: height * 0.06,
                              width: width * 0.20,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: AssetImage(
                                    "assets/images/visual.png",
                                  ),
                                  fit: BoxFit.contain,
                                ),
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          Positioned(
                            left: width * 0.2,
                            top: height * 0.08,
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Visuospatial",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: height * 0.06,
                            right: width * 0.03,
                            child: IconButton(
                              onPressed: () {
                                _pauseTimer();
                                _showPauseMenu();
                              },
                              icon: const Icon(
                                Icons.pause,
                                size: 25,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Text(
              currentPrompt,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: height * 0.05),
            Image.asset(
              digitImages[currentDigit]![0], // Display the original image
              width: 100,
              height: 100,
            ),
            SizedBox(height: height * 0.1),
            Wrap(
              spacing: 5.0,
              runSpacing: 5.0,
              children: options.map((option) {
                return GestureDetector(
                  onTap: () => checkAnswer(option),
                  child: Container(
                    width: 100,
                    height: 100,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset(
                      option,
                      width: 80,
                      height: 80,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
