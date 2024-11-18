import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'package:achievex/screens/brain_games/brain_game_screen.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class Game5 extends StatefulWidget {
  final int initialScore;

  const Game5(this.initialScore, {super.key});

  @override
  _Game5State createState() => _Game5State();
}

class _Game5State extends State<Game5> with SingleTickerProviderStateMixin {
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
  List<String> howToPlay = [
    'A number will pop up on the screen for a brief moment.',
    'You need to identify the mirror or reverse form of this number from three options provided below the number.',
    'You can also check out Tutorial Video of it on courses section.',
  ];
  late int currentDigit;
  late List<String> options = [];
  late String currentPrompt;
  final List<String> prompts = [
    'Find the Mirror Image!',
    'Find the Water Image!'
  ];
  Timer? _timer;
  bool _isPaused = false;
  int _remainingTime = 30;
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
        // player.stop(); // Stop the sound effect when countdown finishes
        setState(() {
          _countdownActive = false;
          _gameStarted = true;
        });
        _startNewGame();
        // _timerController1.start();
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
    _controllerCenter.dispose();
    _countdownTimer?.cancel();
    _timer?.cancel();
    _tickTimer?.cancel();
    _controller.dispose();
    // _timerController1.dispose();
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
    generateNewRound();
    _score = 0;
    _remainingTime = 30;
    _controller.reset();
    _controller.forward();
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

  void checkAnswer(String selected) {
    if ((currentPrompt == 'Find the Mirror Image!' &&
            selected == digitImages[currentDigit]![1]) ||
        (currentPrompt == 'Find the Water Image!' &&
            selected == digitImages[currentDigit]![2])) {
      setState(() {
        _score += 20;
      });
      if (_score == 200) {
        _showTickScreenAndExit();
      } else {
        generateNewRound();
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Wrong! Try again.',
          ),
        ),
      );
    }

    if (_score == 200) {
      // _navigateToGameOverScreen();
      // Navigator.pop(context, _score);
      _showTickScreenAndExit();
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
                                  ));
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
                        ruleBox(width, height, howToPlay[0]),
                        ruleBox(width, height, howToPlay[1]),
                        ruleBox(width, height, howToPlay[2]),
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
                        Colors.blue.shade400,
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
                _showPauseMenu();
                return Future.value(false);
              },
              child: Center(
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Stack(
                          children: [
                            Center(
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top: height * 0.18,
                                  bottom: height * 0.2,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: LinearProgressIndicator(
                                        color: Colors.grey.shade100,
                                        minHeight: 20.0,
                                        value: _animation2
                                            .value, // Assuming _animation2 controls the first progress indicator
                                        backgroundColor: Colors.blue.shade800,
                                      ),
                                    ),
                                    Expanded(
                                      child: LinearProgressIndicator(
                                        color: Colors.blue.shade800,
                                        minHeight: 20.0,
                                        value: _animation1
                                            .value, // Assuming _animation1 controls the second progress indicator
                                        backgroundColor: Colors.grey.shade100,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: height * 0.18,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.blue.shade600,
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
                                                "assets/images/visualization.png",
                                              ),
                                              fit: BoxFit.contain,
                                            ),
                                            color: Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(10),
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
                                              '''Numeral Nexus:''',
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.grey.shade700,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const Text(
                                              '''The Visuospatial Odyssey''',
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
                                                      color: Colors
                                                          .blueGrey.shade800,
                                                      // shape: BoxShape.circle,
                                                      borderRadius:
                                                          const BorderRadius.all(
                                                        Radius.circular(100),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                AnimatedPositioned(
                                                  curve: Curves.easeIn,
                                                  bottom: _position,
                                                  duration: const Duration(
                                                      milliseconds: 70),
                                                  child: Container(
                                                    height: height0,
                                                    width: 50,
                                                    decoration: BoxDecoration(
                                                      color: Colors
                                                          .blueGrey.shade100,
                                                      // shape: BoxShape.circle,
                                                      borderRadius:
                                                          const BorderRadius.all(
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
                          digitImages[currentDigit]![
                              0], // Display the original image
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
                                  border:
                                      Border.all(color: Colors.blue, width: 2),
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
                  ],
                ),
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
