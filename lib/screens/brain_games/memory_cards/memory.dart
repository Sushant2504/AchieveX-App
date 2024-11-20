import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:achievex/screens/brain_games/brain_game_screen.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class Game4 extends StatefulWidget {
  final int initialScore;

  const Game4(this.initialScore, {super.key});

  @override
  _Game4State createState() => _Game4State();
}

class _Game4State extends State<Game4> with SingleTickerProviderStateMixin {
  List<String> howToPlay = [
    'A grid of Bricks will appear on the screen.',
    'A certain number of Bricks within this grid will be highlighted.',
    'Study the grid and try to memorize the positions of these highlighted Bricks.',
    'You will have a few seconds to do this then.',
    'After the memorization phase, the grid will either disappear or revert to an unhighlighted state, leaving you with a blank grid or a grid where all Bricks look the same.',
    'Using your memory, click on the Bricks that were highlighted in the memorization phase.',
    'You can also check out Tutorial Video of it on courses section.',
  ];

  // int memoryPoints = 0;
  int rows = 3;
  int columns = 3;
  List<List<bool>> _grid = [];
  List<List<bool>> _revealed = [];
  bool _showHighlight = true;
  Timer? _timer;
  // int _timeRemaining = 60;
  int coloredBoxes = 2;
  bool _isPaused = false;
  // bool _isGameOver = false;
  bool _gameStarted = false;
  bool _gameOver = false;
  bool _countdownActive = false;
  // int visuospatialPoints = 0;
  int _countdown = 3; // Countdown value in seconds
  Timer? _countdownTimer;

  late AnimationController _controller;
  late Animation<double> _animation1;
  late Animation<double> _animation2;
  int _time = 60;

  int _ticksec = 3;
  Timer? _tickTimer;

  int _score = 0;

  void _startCountdown() {
    final player = AudioPlayer(); // Initialize the audio player
    player.play(AssetSource('audio/countdown.mp3')); // Play the sound effect

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
        // player.stop();
        setState(() {
          _countdownActive = false;
          _gameStarted = true;
        });
        _startNewGame();
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
          // _tickVisible = true;
        });
      } else {
        timer.cancel();
        // player.stop();
        setState(() {
          _gameOver = true;
        });
        Navigator.pop(context, _score);
      }
    });
  }

  @override
  void dispose() {
    _countdownTimer?.cancel();
    _tickTimer?.cancel();
    _timer?.cancel();
    _controller.dispose(); // Dispose the animation controller
    _controllerCenter.dispose(); // Dispose the confetti controller
    super.dispose();
  }

  @override
  void initState() {
    _controllerCenter = ConfettiController(
      duration: const Duration(
        seconds: 3,
      ),
    );
    // Setup animation controller
    _controller = AnimationController(
      vsync: this,
      duration:
          Duration(seconds: _time), // Use total time as animation duration
    );

    // Setup animation
    _animation1 = Tween<double>(begin: 1.0, end: 0.0).animate(_controller)
      ..addListener(() {
        setState(() {
          // Update time based on animation value
          _time = (_controller.duration!.inSeconds * _animation1.value).floor();
        });
      });
    _animation2 = Tween<double>(begin: 0.0, end: 1.0).animate(_controller)
      ..addListener(() {
        setState(() {
          // Update time based on animation value
          _time = (_controller.duration!.inSeconds * _animation2.value).floor();
        });
      });
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _timer?.cancel();
        _showTickScreenAndExit();
      }
    });

    // Timer to update animation periodically
    // Timer.periodic(const Duration(seconds: 1), (Timer t) {
    //   setState(() {
    //     if (_time > 0) {
    //       _time--; // Decrease time by 1 every second
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

  void _initializeGame() {
    // Reset grid and revealed tiles
    _grid = List.generate(rows, (_) => List.generate(columns, (_) => false));
    _revealed =
        List.generate(rows, (_) => List.generate(columns, (_) => false));

    // Reset time remaining and start game timer
    _time = 60;

    // Other game initialization logic
    coloredBoxes++;
    int numberOfColored = coloredBoxes;

    Set<int> chosenIndices = <int>{};
    Random random = Random();
    while (chosenIndices.length < numberOfColored) {
      chosenIndices.add(random.nextInt(rows * columns));
    }

    for (int index in chosenIndices) {
      int row = index ~/ columns;
      int col = index % columns;
      _grid[row][col] = true;
    }

    Future.delayed(
      const Duration(seconds: 3),
      () => setState(() {
        _showHighlight = false;
      }),
    );

    // _startGameTimer();
  }

  void _startNewGame() {
    _initializeGame();
    _score = 0;
    _time = 60;
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

  void _onTileTap(int row, int col) {
    if (_showHighlight) return;

    if (_grid[row][col]) {
      // Correct tile
      setState(() {
        _revealed[row][col] = true;
      });

      if (_allCorrectRevealed()) {
        _increaseGridSize();
        _score += 20;
      }
    } else {
      // Incorrect tile
      _showFailureDialog();
    }
  }

  void _showFailureDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Incorrect"),
          content: const Text("You selected the wrong tile. Try again."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _resetReveals(); // Keep grid same but reset revealed tiles
              },
              child: const Text("Retry"),
            ),
          ],
        );
      },
    );
  }

  void _resetReveals() {
    setState(() {
      _revealed =
          List.generate(rows, (_) => List.generate(columns, (_) => false));
      _showHighlight = true;
    });
    _initializeGame();
  }

  bool _allCorrectRevealed() {
    for (int row = 0; row < rows; row++) {
      for (int col = 0; col < columns; col++) {
        if (_grid[row][col] && !_revealed[row][col]) {
          return false;
        }
      }
    }
    return true;
  }

  void _increaseGridSize() {
    setState(() {
      if (columns < rows) {
        if (columns < 7) {
          // Check if columns is less than the limit
          columns += 1;
        }
      } else {
        if (rows < 8) {
          // Check if rows is less than the limit
          rows += 1;
        }
      }
      _showHighlight = true;
    });
    _initializeGame();
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
                              // Add logic for exiting the game
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
    });
  }

  static const double _shadowHeight = 4;
  double _position = 4;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    const double height0 = 50 - _shadowHeight;
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
                        ruleBox(width, height, howToPlay[0]),
                        ruleBox(width, height, howToPlay[1]),
                        ruleBox(width, height, howToPlay[2]),
                        ruleBox(width, height, howToPlay[3]),
                        ruleBox(width, height, howToPlay[4]),
                        ruleBox(width, height, howToPlay[5]),
                        ruleBox(width, height, howToPlay[6]),
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
                  child: ElevatedButton(
                    style: ButtonStyle(
                      elevation: WidgetStateProperty.all(4),
                      backgroundColor: WidgetStateProperty.all(
                        Colors.orange.shade400,
                      ),
                      padding: WidgetStateProperty.all(
                        EdgeInsets.symmetric(
                          horizontal: width * 0.36,
                          vertical: height * 0.01,
                        ),
                      ),
                    ),
                    onPressed: () {
                      print('On tap called');
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
                _showPauseMenu();
                return Future.value(false);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Stack(
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
                                          "assets/images/memory.png",
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '''Bricks Matrix:''',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey.shade700,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const Text(
                                        '''Memory Matrix Mastery''',
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
                                                // shape: BoxShape.circle,
                                                borderRadius: const BorderRadius.all(
                                                  Radius.circular(100),
                                                ),
                                              ),
                                            ),
                                          ),
                                          AnimatedPositioned(
                                            curve: Curves.easeIn,
                                            bottom: _position,
                                            duration:
                                                const Duration(milliseconds: 70),
                                            child: Container(
                                              height: height0,
                                              width: 50,
                                              decoration: BoxDecoration(
                                                color: Colors.blueGrey.shade100,
                                                // shape: BoxShape.circle,
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
                                  backgroundColor: Colors.orange.shade600,
                                ),
                              ),
                              Expanded(
                                child: LinearProgressIndicator(
                                  color: Colors.orange.shade600,
                                  minHeight: 20.0,
                                  value: _animation1.value,
                                  backgroundColor: Colors.grey.shade100,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height * 0.18,
                          ),
                        ],
                      ),
                    ],
                  ),
                  // SizedBox(
                  //   height: height * 0.15,
                  // ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: width * 0.9,
                        height: height * 0.55,
                        child: GridView.builder(
                          padding: EdgeInsets.symmetric(
                            horizontal: width * 0.01,
                          ),
                          itemCount: rows * columns,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: columns,
                          ),
                          itemBuilder: (context, index) {
                            int row = index ~/ columns; // Row index
                            int col = index % columns; // Column index

                            bool isRevealed = _revealed[row][col];
                            bool isCorrect = _grid[row][col];

                            return GestureDetector(
                              onTap: () => _onTileTap(row, col),
                              child: Container(
                                margin: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: _showHighlight
                                      ? (isCorrect ? Colors.blue : Colors.grey)
                                      : (isRevealed
                                          ? (isCorrect
                                              ? Colors.blue
                                              : Colors.red)
                                          : Colors.grey),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
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
