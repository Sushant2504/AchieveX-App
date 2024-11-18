import 'package:achievex/screens/solo_games/reasoning/addition_game_over.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

class AdditionGame extends StatefulWidget {
  const AdditionGame({super.key});

  @override
  _AdditionGameState createState() => _AdditionGameState();
}

class _AdditionGameState extends State<AdditionGame> {
  final Random _random = Random();
  Timer? _timer;
  int _remainingTime = 60;
  List<int> _numbers = [];
  int _targetSum = 0;
  final List<int> _selectedNumbers = [];
  int additionPoints = 0;
  bool _isPaused = false;

  @override
  void initState() {
    super.initState();
    _startNewGame();
  }

  void _startNewGame() {
    _generateUniqueNumbers();
    _generateTargetSum();
    _selectedNumbers.clear();
    additionPoints = 0; // Reset score for new game
    _remainingTime = 60; // Reset time for new game
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel(); // Cancel any existing timer
    _isPaused = false; // Ensure the game is not in a paused state
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0 && !_isPaused) {
          _remainingTime--;
        } else if (_remainingTime == 0) {
          _timer?.cancel();
          _showGameOverScreen();
        }
      });
    });
  }

  void _pauseTimer() {
    setState(() {
      _isPaused = true;
    });
  }

  void _resumeTimer() {
    setState(() {
      _isPaused = false;
    });
  }

  void _generateUniqueNumbers() {
    Set<int> uniqueNumbers = {};
    while (uniqueNumbers.length < 16) {
      uniqueNumbers.add(_random.nextInt(30) + 1);
    }

    _numbers = uniqueNumbers.toList();
    _numbers.sort();
  }

  void _generateTargetSum() {
    if (_numbers.length >= 2) {
      int index1 = _random.nextInt(_numbers.length);
      int index2 = index1;

      while (index2 == index1) {
        index2 = _random.nextInt(_numbers.length);
      }

      _targetSum = _numbers[index1] + _numbers[index2];
    }
  }

  void _onNumberSelect(int number) {
    if (_selectedNumbers.contains(number)) {
      setState(() {
        _selectedNumbers.remove(number);
      });
    } else if (_selectedNumbers.length < 2) {
      setState(() {
        _selectedNumbers.add(number);
      });

      if (_selectedNumbers.length == 2) {
        _checkSelection();
      }
    }
  }

  void _checkSelection() {
    if (_selectedNumbers.reduce((a, b) => a + b) == _targetSum) {
      setState(() {
        additionPoints += 10; // 10 points for a correct pair
        _numbers.removeWhere((n) => _selectedNumbers.contains(n));
        _selectedNumbers.clear();

        if (_numbers.length < 2) {
          _generateUniqueNumbers(); // Reset if no more numbers left
        }

        _generateTargetSum();
      });
    } else {
      setState(() {
        _selectedNumbers.clear();
      });
    }
  }

  void _showGameOverScreen() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => GameOverScreen(
          additionPoints: additionPoints,
        ),
      ),
    );
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
                  _controller.resume();
                },
                icon: const Icon(
                  Icons.play_arrow,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _startNewGame();
                  _controller.restart(duration: _remainingTime);
                },
                icon: const Icon(
                  Icons.restart_alt,
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
      _controller.resume();
    });
  }

  final CountDownController _controller = CountDownController();

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                Positioned(
                  top: height * 0.14,
                  left: width * 0.03,
                  child: CircularCountDownTimer(
                    duration: _remainingTime,
                    initialDuration: 0,
                    controller: _controller,
                    width: width * 0.15,
                    height: height * 0.1,
                    ringColor: Colors.transparent,
                    ringGradient: null,
                    fillColor: Colors.red,
                    fillGradient: null,
                    backgroundColor: Colors.transparent,
                    backgroundGradient: null,
                    strokeWidth: 5.0,
                    strokeCap: StrokeCap.round,
                    textStyle: const TextStyle(
                      fontSize: 25.0,
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
                    },
                    onChange: (String timeStamp) {
                      debugPrint('Countdown Changed $timeStamp');
                    },
                    timeFormatterFunction:
                        (defaultFormatterFunction, duration) {
                      if (duration.inSeconds == 0) {
                      } else {
                        return Function.apply(
                          defaultFormatterFunction,
                          [duration],
                        );
                      }
                    },
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: height * 0.14,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.amber.shade700,
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
                                    "assets/images/lightbulb.png",
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
                                  "Reasoning",
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
                                _controller.pause();
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
                    SizedBox(
                      height: height * 0.1,
                    ),
                    AvatarGlow(
                      glowColor: Colors.amber,
                      glowRadiusFactor: 0.5,
                      child: CircleAvatar(
                        backgroundColor: Colors.grey[100],
                        radius: height * 0.0525,
                        child: Container(
                          width: width * 0.23,
                          height: height * 0.105,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.amber,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Center(
                            child: Text(
                              '$_targetSum',
                              style: const TextStyle(
                                fontSize: 24,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.07,
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal:
                        16.0), // Add padding to reduce overall grid size
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  itemCount: _numbers.length,
                  itemBuilder: (context, index) {
                    final number = _numbers[index];
                    return GestureDetector(
                      onTap: () => _onNumberSelect(number),
                      child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.all(4.0), // Reduced margin
                        decoration: BoxDecoration(
                          color: _selectedNumbers.contains(number)
                              ? Colors.green
                              : Colors.amber.shade600,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          '$number',
                          style: const TextStyle(
                            fontSize: 20, // Reduced font size
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
