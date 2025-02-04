import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'package:achievex/screens/brain_games/brain_game_screen.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class Game1 extends StatefulWidget {
  final int initialScore;

  const Game1(
    this.initialScore, {
    super.key,
  });

  @override
  _Game1State createState() => _Game1State();
}

class _Game1State extends State<Game1> with SingleTickerProviderStateMixin {
  // late LinearTimerController _timerController1;

  final Random _random = Random();
  Timer? _timer;
  int _remainingTime = 60;
  List<int> _numbers = [];
  int _targetSum = 0;
  final List<int> _selectedNumbers = [];
  // int additionPoints = 0;
  bool _isPaused = false;
  int _score = 0;
  bool _gameStarted = false;
  bool _gameOver = false;

  bool _countdownActive = false;
  int _countdown = 3; // Countdown value in seconds
  Timer? _countdownTimer;

  late AnimationController _controller;
  late Animation<double> _animation1;
  late Animation<double> _animation2;

  int _ticksec = 3;
  Timer? _tickTimer;

  void _startCountdown() {
    final player = AudioPlayer();
    player.play(AssetSource('audio/countdown.mp3'));
    setState(() {
      _countdownActive = true;
    });

    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_countdown > 1) {
        setState(() {
          _countdown--;
        });
      } else {
        timer.cancel();
        // player.stop(); // Stop the sound effect when countdown finishes
        setState(() {
          _countdownActive = false;
          _gameStarted = true;
          // _controller.forward();
        });
        _startNewGame();
        // _controller.forward();
      }
    });
  }

  late ConfettiController _controllerCenter;

  Path drawStar(Size size) {
    // Method to convert degree to radians
    double degToRad(double deg) => deg * (pi / 180.0);

    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
  }

  void _showTickScreenAndExit() {
    final player = AudioPlayer(); // Initialize the audio player
    player.play(AssetSource('audio/finished.mp3')); // Play the sound effect

    setState(() {
      _gameOver = true;
    });

    _tickTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_ticksec > 1) {
        setState(() {
          _ticksec--;
        });
      } else {
        timer.cancel();
        setState(() {
          _gameOver = true;
        });
        Navigator.pop(context, _score);
      }
    });
  }

  @override
  void dispose() {
    _countdownTimer?.cancel(); // Cancel the countdown timer
    _timer?.cancel(); // Cancel the game timer
    _tickTimer?.cancel(); // Cancel the tick timer
    _controller.dispose(); // Dispose the animation controller
    _controllerCenter.dispose(); // Dispose the confetti controller
    super.dispose();
  }

  List<String> howToPlay = [
    'The various numbers will shown on screen.',
    'You should add some numbers give by us in multiple options to get outcome equal to shown number.',
    'You can also check out Tutorial Video of it on courses section.',
  ];

  @override
  void initState() {
    _controllerCenter = ConfettiController(
      duration: const Duration(
        seconds: 3,
      ),
    );
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
          seconds: _remainingTime), // Use total time as animation duration
    );

    // Setup animation
    _animation1 = Tween<double>(begin: 1.0, end: 0.0).animate(_controller)
      ..addListener(() {
        setState(() {
          // Update time based on animation value
          _remainingTime =
              (_controller.duration!.inSeconds * _animation1.value).floor();
        });
      });
    _animation2 = Tween<double>(begin: 0.0, end: 1.0).animate(_controller)
      ..addListener(() {
        setState(() {
          // Update time based on animation value
          _remainingTime =
              (_controller.duration!.inSeconds * _animation2.value).floor();
        });
      });
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _timer?.cancel();
        _showTickScreenAndExit();
      }
    });

    // _controller.forward();

    // Setup animation controller

    // // Start animation
    // _timeAnimCont.forward();

    // Timer to update animation periodically
    // Timer.periodic(Duration(seconds: 1), (Timer t) {
    //   setState(() {
    //     if (_remainingTime > 0) {
    //       _remainingTime--; // Decrease time by 1 every second
    //     }
    //   });
    // });
    _controllerCenter.play();
    // Future.delayed(const Duration(seconds: 1), () {
    //   setState(() {});
    // });
    super.initState();
    // _startNewGame();
    // _score = widget.initialScore;
    _score = 0;
  }

  void _startNewGame() {
    _generateUniqueNumbers();
    _generateTargetSum();
    _selectedNumbers.clear();
    _score = 0;
    _remainingTime = 60;
    _controller.reset();
    _controller.forward();
    // _startTimer();
  }

  void _pauseTimer() {
    setState(() {
      _isPaused = true;
    });
    _controller.stop();
  }

  void _resumeTimer() {
    setState(() {
      _isPaused = false;
    });
    _controller.forward();
  }

  void _generateUniqueNumbers() {
    Set<int> uniqueNumbers = {};
    while (uniqueNumbers.length < 16) {
      uniqueNumbers.add(_random.nextInt(18) + 1);
    }

    _numbers = uniqueNumbers.toList();
    // _numbers.sort();
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
        _score += 10; // 10 points for a correct pair
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

  void _showPauseMenu() {
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierLabel: 'Pause Menu',
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (context, animation, secondaryAnimation) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.white.withOpacity(0.3),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Game Paused",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey.shade800,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              _resumeTimer();
                              // _controller.forward();
                              // _timeAnimCont.forward();
                              // _timerController1.start();
                            },
                            icon: Icon(
                              color: Colors.blueGrey.shade800,
                              Icons.play_arrow,
                              size: 40,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              _startNewGame();

                              // _resetGame();
                              // _timeAnimCont.reset();
                              // _timerController1.reset();
                            },
                            icon: Icon(
                              color: Colors.blueGrey.shade800,
                              Icons.restart_alt,
                              size: 40,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const BrainGameScreen(),
                                ),
                              );
                            },
                            icon: Icon(
                              color: Colors.blueGrey.shade800,
                              Icons.exit_to_app_outlined,
                              size: 40,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    ).then((_) {
      if (_isPaused) _resumeTimer();
      // _controller.resume();
      // _timeAnimCont.forward();
      // _timerController1.start();
    });
  }

  // final CountDownController _controller = CountDownController();

  static const double _shadowHeight = 4;
  double _position = 4;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          if (!_gameStarted && !_gameOver && !_countdownActive)
            Column(
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
                                Navigator.pop(context);
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
                      _startCountdown();
                      _controller.forward();
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
          if (_countdownActive)
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/neuron.png",
                    height: height * 0.3,
                  ),
                  SizedBox(height: height * 0.1),
                  Text(
                    _countdown.toString(),
                    style: const TextStyle(
                      fontSize: 72,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber,
                    ),
                  ),
                ],
              ),
            ),
          if (_gameStarted && !_gameOver)
            WillPopScope(
              onWillPop: () {
                _pauseTimer();
                // _controller.pause();
                // _timeAnimCont.stop();
                // _timerController1.stop();
                _showPauseMenu();
                return Future.value(false);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildTopSection(height, width),
                  Expanded(
                    child: _buildGridView(),
                  ),
                ],
              ),
            ),
          if (_gameOver)
            Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: ConfettiWidget(
                    gravity: 0.1,
                    confettiController: _controllerCenter,
                    blastDirectionality: BlastDirectionality.explosive,
                    shouldLoop:
                        true, // start again as soon as the animation is finished
                    colors: const [
                      Colors.green,
                      Colors.blue,
                      Colors.pink,
                      Colors.orange,
                      Colors.purple
                    ], // manually specify the colors to be used
                    createParticlePath: drawStar, // define a custom shape/path.
                  ),
                ),
                AnimatedPositioned(
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut,
                  top: MediaQuery.of(context).size.height / 2 - 100,
                  left: MediaQuery.of(context).size.width / 2 - 100,
                  child: Image.asset(
                    "assets/images/tick.png",
                    height: 200,
                    width: 200,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
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

  Padding _buildGridView() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ), // Add padding to reduce overall grid size
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
                style: TextStyle(
                  fontSize: 20, // Reduced font size
                  color: Colors.grey.shade100,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Stack _buildTopSection(double height, double width) {
    const double height0 = 50 - _shadowHeight;
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: height * 0.18,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.amber.shade700,
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: height * 0.1,
                    left: 0,
                    child: Container(
                      height: height * 0.06,
                      width: width * 0.20,
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
                    left: width * 0.2,
                    top: height * 0.1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '''Logic Legends:''',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade700,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          '''Mastering Addition''',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: height * 0.06,
                    right: width * 0.04,
                    child: GestureDetector(
                      onTap: () {
                        _showPauseMenu();
                        if (_isPaused) {
                          _resumeTimer();
                          // _timeAnimCont.forward();
                        } else {
                          _pauseTimer();
                          // _timeAnimCont.stop();
                        }
                      },
                      onTapUp: (_) {
                        setState(() {
                          _position = 4;
                        });
                      },
                      onTapDown: (_) {
                        setState(() {
                          _position = 0;
                        });
                      },
                      onTapCancel: () {
                        setState(() {
                          _position = 4;
                        });
                      },
                      child: SizedBox(
                        height: height0 + _shadowHeight,
                        width: 50,
                        child: Stack(
                          children: [
                            Positioned(
                              bottom: 0,
                              child: Container(
                                height: height0,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Colors.blueGrey.shade800,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(100),
                                  ),
                                ),
                              ),
                            ),
                            AnimatedPositioned(
                              curve: Curves.easeIn,
                              bottom: _position,
                              duration: const Duration(milliseconds: 70),
                              child: Container(
                                height: height0,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Colors.blueGrey.shade100,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(100),
                                  ),
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.pause,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: LinearProgressIndicator(
                    color: Colors.grey.shade100,
                    minHeight: 20.0,
                    value: _animation2.value,
                    backgroundColor: Colors.amber.shade900,
                  ),
                ),
                Expanded(
                  child: LinearProgressIndicator(
                    color: Colors.amber.shade900,
                    minHeight: 20.0,
                    value: _animation1.value,
                    backgroundColor: Colors.grey.shade100,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.05,
            ),
            AvatarGlow(
              glowColor: Colors.amber,
              glowRadiusFactor: 0.3,
              child: CircleAvatar(
                backgroundColor: Colors.grey[100],
                radius: height * 0.07,
                child: Container(
                  width: width * 0.46,
                  height: height * 0.21,
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
                        fontSize: 40,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.05,
            ),
          ],
        ),
      ],
    );
  }
}
