import 'package:achievex/screens/solo_games/attention/color_game_over.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class ColorGame extends StatefulWidget {
  const ColorGame({
    super.key,
  });

  @override
  _ColorGameState createState() => _ColorGameState();
}

class _ColorGameState extends State<ColorGame> {
  final List<String> _colors = ['RED', 'BLUE', 'GREEN', 'YELLOW'];
  final Map<String, Color> _colorMap = {
    'RED': Colors.red,
    'BLUE': Colors.blue,
    'GREEN': Colors.green,
    'YELLOW': Colors.yellow,
  };

  late String _displayedWord;
  late Color _displayedColor;
  int attentionPoints = 0;
  late List<String> _shuffledColors;
  bool _isPaused = false;
  final CountDownController _controller = CountDownController();

  @override
  void initState() {
    super.initState();
    _generateNewWordAndColor();
  }

  void _navigateToGameOverScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ColorGameOver(
          attentionPoints: attentionPoints,
        ),
      ),
    );
  }

  void _generateNewWordAndColor() {
    final random = Random();
    _displayedWord = _colors[random.nextInt(_colors.length)];
    _displayedColor = _colorMap[_colors[random.nextInt(_colors.length)]]!;

    // Shuffle the color options
    _shuffledColors = List.from(_colors)..shuffle();
  }

  void _checkAnswer(String selectedColor) {
    if (_colorMap[selectedColor] == _displayedColor) {
      setState(() {
        attentionPoints += 20;
      });
    }
    if (attentionPoints == 200) {
      _controller.pause();
      _navigateToGameOverScreen();
    } else {
      _generateNewWordAndColor();
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
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => ColorGameOver(
                        attentionPoints: attentionPoints,
                      ),
                    ),
                  );
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: height * 0.1),
                  child: CircularCountDownTimer(
                    duration: 30,
                    initialDuration: 0,
                    controller: _controller,
                    width: width * 0.4,
                    height: height * 0.4,
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
                      color: Colors.red.shade700,
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
                          left: width * 0.2,
                          top: height * 0.08,
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Attention",
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
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.05,
                    vertical: height * 0.01,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    _displayedWord,
                    style: TextStyle(
                      fontSize: 44,
                      color: _displayedColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  width: width * 0.8,
                  height: height * 0.3,
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: _shuffledColors.length,
                    itemBuilder: (context, index) {
                      final color = _shuffledColors[index];
                      return ElevatedButton(
                        onPressed: () => _checkAnswer(color),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            horizontal: width * 0.03,
                            vertical: height * 0.01,
                          ),
                          backgroundColor: attentionPoints < 100
                              ? Colors.white
                              : _colorMap[color],
                        ),
                        child: Text(
                          color,
                          style: const TextStyle(
                            fontSize: 24,
                            color: Colors.black,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
// import 'dart:async';

// import 'package:achievex/screens/brain_games/coloured_words/color_game_over.dart';
// import 'package:achievex/screens/brain_games/coloured_words/coloured_home_screen.dart';
// import 'package:achievex/screens/brain_games/mirror_game/mirror_home_screen.dart';
// import 'package:circular_countdown_timer/circular_countdown_timer.dart';
// import 'package:flutter/material.dart';
// import 'dart:math';

// class ColorGame extends StatefulWidget {
//   const ColorGame({Key? key}) : super(key: key);

//   @override
//   ColorGameState createState() => ColorGameState();
// }

// class ColorGameState extends State<ColorGame> {
//   final List<String> colors = ['Red', 'Green', 'Blue', 'Yellow', 'Orange'];
//   final List<Color> colorValues = [
//     Colors.red,
//     Colors.green,
//     Colors.blue,
//     Colors.yellow,
//     Colors.orange,
//   ];

//   late String displayedWord;
//   late Color displayedColor;
//   bool _isPaused = false;
//   Timer? _timer;
//   int score = 0;
//   int highScore = 0;
//   bool gameOver = false;

//   int _remainingTime = 31;
//   int questionCount = 0;

//   Random random = Random();

//   @override
//   void initState() {
//     super.initState();
//     _startNewGame();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   void _startNewGame() {
//     gameOver = false;
//     score = 0;
//     _remainingTime = 29;
//     questionCount = 0;
//     generateNewWord();
//     _startTimer();
//   }

//   void _pauseTimer() {
//     setState(() {
//       _isPaused = true;
//     });
//   }

//   void _resumeTimer() {
//     setState(() {
//       _isPaused = false;
//     });
//   }

//   void _startTimer() {
//     _timer?.cancel(); // Cancel any existing timer
//     _isPaused = false; // Ensure the game is not in a paused state
//     _timer = Timer.periodic(Duration(seconds: 1), (timer) {
//       setState(() {
//         if (_remainingTime > 0 && !_isPaused) {
//           _remainingTime--;
//         } else if (_remainingTime == 0) {
//           _timer?.cancel();
//           _showGameOverScreen();
//         }
//       });
//     });
//   }

//   void _showGameOverScreen() {
//     Navigator.of(context).pushReplacement(
//       MaterialPageRoute(
//         builder: (context) => ColorGameOver(
//           score: score,
//           startnewgame: _startNewGame,
//         ),
//       ),
//     );
//   }

//   void generateNewWord() {
//     int colorIndex = random.nextInt(colors.length);
//     int wordIndex = random.nextInt(colors.length);

//     displayedWord = colors[wordIndex];
//     displayedColor = colorValues[colorIndex];

//     questionCount++;
//   }

//   void onSelect(int index) {
//     if (gameOver) return;

//     if (colorValues[index] == displayedColor) {
//       score += 1;
//       setState(() {
//         int correctColorIndex = colors.indexOf(displayedWord);

//         colors.shuffle();

//         int shuffledCorrectIndex = colors.indexOf(displayedWord);

//         if (shuffledCorrectIndex != correctColorIndex) {
//           String temp = colors[correctColorIndex];
//           colors[correctColorIndex] = colors[shuffledCorrectIndex];
//           colors[shuffledCorrectIndex] = temp;
//         }

//         generateNewWord();
//       });
//     }

//     if (score > highScore) {
//       highScore = score;
//     }
//   }

//   void _showPauseMenu() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           backgroundColor: Colors.amber,
//           title: Center(
//             child: Text(
//               "Game Paused",
//             ),
//           ),
//           content: Row(
//             mainAxisSize: MainAxisSize.min,
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               IconButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                   _resumeTimer();
//                   _controller.resume();
//                 },
//                 icon: Icon(
//                   Icons.play_arrow,
//                 ),
//               ),
//               IconButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                   _startNewGame();
//                   _controller.restart(
//                     duration: _remainingTime,
//                   );
//                 },
//                 icon: Icon(
//                   Icons.restart_alt,
//                 ),
//               ),
//               IconButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                   Navigator.of(context).pushReplacement(
//                     MaterialPageRoute(
//                       builder: (context) => ColouredHomeScreen(),
//                     ),
//                   );
//                 },
//                 icon: Icon(
//                   Icons.exit_to_app_outlined,
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     ).then((_) {
//       if (_isPaused) _resumeTimer();
//       _controller.resume();
//     });
//   }

//   final CountDownController _controller = CountDownController();

//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Stack(
//             children: [
//               Positioned(
//                 top: height * 0.14,
//                 left: width * 0.03,
//                 child: CircularCountDownTimer(
//                   duration: 31,
//                   initialDuration: 0,
//                   controller: _controller,
//                   width: width * 0.15,
//                   height: height * 0.1,
//                   ringColor: Colors.transparent,
//                   ringGradient: null,
//                   fillColor: Colors.red,
//                   fillGradient: null,
//                   backgroundColor: Colors.transparent,
//                   backgroundGradient: null,
//                   strokeWidth: 5.0,
//                   strokeCap: StrokeCap.round,
//                   textStyle: const TextStyle(
//                     fontSize: 25.0,
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   textFormat: CountdownTextFormat.S,
//                   isReverse: true,
//                   isReverseAnimation: true,
//                   isTimerTextShown: true,
//                   autoStart: true,
//                   onStart: () {
//                     debugPrint('Countdown Started');
//                   },
//                   onComplete: () {
//                     debugPrint('Countdown Ended');
//                   },
//                   onChange: (String timeStamp) {
//                     debugPrint('Countdown Changed $timeStamp');
//                   },
//                   timeFormatterFunction: (defaultFormatterFunction, duration) {
//                     if (duration.inSeconds == 0) {
//                     } else {
//                       return Function.apply(
//                         defaultFormatterFunction,
//                         [duration],
//                       );
//                     }
//                   },
//                 ),
//               ),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Container(
//                     height: height * 0.14,
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       color: Colors.amber.shade700,
//                     ),
//                     child: Stack(
//                       children: [
//                         Positioned(
//                           top: height * 0.06,
//                           left: 0,
//                           child: Container(
//                             height: height * 0.06,
//                             width: width * 0.20,
//                             decoration: BoxDecoration(
//                               image: DecorationImage(
//                                 image: AssetImage(
//                                   "assets/images/reasoning.png",
//                                 ),
//                                 fit: BoxFit.contain,
//                               ),
//                               color: Colors.transparent,
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                           ),
//                         ),
//                         Positioned(
//                           left: width * 0.2,
//                           top: height * 0.08,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 "Reasoning",
//                                 style: TextStyle(
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Positioned(
//                           top: height * 0.06,
//                           right: width * 0.03,
//                           child: IconButton(
//                             onPressed: () {
//                               _pauseTimer();
//                               _controller.pause();
//                               _showPauseMenu();
//                             },
//                             icon: Icon(
//                               Icons.pause,
//                               size: 25,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: height * 0.1,
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 displayedWord,
//                 style: TextStyle(
//                   fontSize: 40,
//                   color: displayedColor,
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Text(
//                 'Time Left: $_remainingTime',
//                 style: const TextStyle(fontSize: 25),
//               ),
//               const SizedBox(height: 20),
//               Wrap(
//                 spacing: 30,
//                 children: List.generate(
//                   colors.length,
//                   (index) {
//                     final isWhiteOption = questionCount <=
//                         5; // The first 5 questions will have white boxes
//                     final buttonColor =
//                         isWhiteOption ? Colors.white : colorValues[index];

//                     return ElevatedButton(
//                       style: ButtonStyle(
//                         backgroundColor: MaterialStateProperty.all<Color>(
//                           buttonColor,
//                         ),
//                         shape:
//                             MaterialStateProperty.all<RoundedRectangleBorder>(
//                           RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(5),
//                           ),
//                         ),
//                       ),
//                       onPressed: () => onSelect(index),
//                       child: Text(
//                         colors[index],
//                         style: TextStyle(
//                           fontSize: 20,
//                           color: isWhiteOption ? Colors.black : Colors.white,
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Text(
//                 'Score: $score',
//                 style: const TextStyle(
//                   fontSize: 25,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }


// // Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             Text(
// //               displayedWord,
// //               style: TextStyle(
// //                 fontSize: 40,
// //                 color: displayedColor,
// //               ),
// //             ),
// //             const SizedBox(height: 20),
// //             Text(
// //               'Time Left: $timer',
// //               style: const TextStyle(fontSize: 25),
// //             ),
// //             const SizedBox(height: 20),
// //             Wrap(
// //               spacing: 30,
// //               children: List.generate(
// //                 colors.length,
// //                 (index) {
// //                   final isWhiteOption = questionCount <=
// //                       5; // The first 5 questions will have white boxes
// //                   final buttonColor =
// //                       isWhiteOption ? Colors.white : colorValues[index];

// //                   return ElevatedButton(
// //                     style: ButtonStyle(
// //                       backgroundColor: MaterialStateProperty.all<Color>(
// //                         buttonColor,
// //                       ),
// //                       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
// //                         RoundedRectangleBorder(
// //                           borderRadius: BorderRadius.circular(5),
// //                         ),
// //                       ),
// //                     ),
// //                     onPressed: () => onSelect(index),
// //                     child: Text(
// //                       colors[index],
// //                       style: TextStyle(
// //                         fontSize: 20,
// //                         color: isWhiteOption ? Colors.black : Colors.white,
// //                       ),
// //                     ),
// //                   );
// //                 },
// //               ),
// //             ),
// //             const SizedBox(height: 20),
// //             Text(
// //               'Score: $score',
// //               style: const TextStyle(
// //                 fontSize: 25,
// //               ),
// //             ),
// //           ],
// //         ),