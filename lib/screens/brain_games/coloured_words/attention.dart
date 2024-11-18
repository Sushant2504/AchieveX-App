import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:achievex/screens/brain_games/brain_game_screen.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class Game2 extends StatefulWidget {
  final int initialScore;

  const Game2(this.initialScore, {super.key});

  @override
  _Game2State createState() => _Game2State();
}

class _Game2State extends State<Game2> with TickerProviderStateMixin {
  final List<String> _colors = [
    'RED',
    'BLUE',
    'GREEN',
    'YELLOW',
  ];
  final Map<String, Color> _colorMap = {
    'RED': Colors.red,
    'BLUE': Colors.blue,
    'GREEN': Colors.green,
    'YELLOW': Colors.yellow,
  };

  late String _displayedWord;
  late Color _displayedColor;
  late List<String> _shuffledColors;
  bool _isPaused = false;
  bool _gameStarted = false;
  bool _gameOver = false;
  Timer? _timer;
  bool _countdownActive = false;
  int _countdown = 3; // Countdown value in seconds
  Timer? _countdownTimer;

  late AnimationController _controller;
  late Animation<double> _animation1;
  late Animation<double> _animation2;
  int _remainingTime = 30;

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
        setState(() {
          _countdownActive = false;
          _gameStarted = true;
        });
        _startNewGame();
      }
    });
  }

  void _startNewGame() {
    _generateNewWordAndColor();
    _score = 0;
    _remainingTime = 30;
    _controller.reset();
    _controller.forward();
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

    super.initState();
    _score = 0;
  }

  void _generateNewWordAndColor() {
    final random = Random();
    _displayedWord = _colors[random.nextInt(_colors.length)];

    // Select a random color for display
    _displayedColor = _colorMap[_colors[random.nextInt(_colors.length)]]!;

    // Shuffle the color options for buttons
    _shuffledColors = _colors.toList()..shuffle();
  }

  void _checkAnswer(String selectedColor) {
    // Get the color corresponding to the selected text
    final selectedColorValue = _colorMap[selectedColor];

    // Check if the selected text matches the displayed color
    if (selectedColorValue == _displayedColor) {
      setState(() {
        _score += 20;
      });
    }

    // Generate a new word and color regardless of the correctness of the answer
    _generateNewWordAndColor();

    if (_score == 200) {
      _showTickScreenAndExit();
      setState(() {
        _gameOver = true;
      });
    }
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

  List<String> howToPlay = [
    'You will see words on the screen, each word is the name of a color (e.g., "RED", "BLUE", "GREEN").',
    'The color of the text (ink) may match or differ from the word itself.',
    'Your task is to identify the color of the text, not the word and select that text color name in given options.',
    'For example, if the word "RED" is printed in blue ink, you should select "Blue" option.',
    'You can also check out Tutorial Video of it on courses section.',
  ];

  @override
  void dispose() {
    _controllerCenter.dispose();
    _countdownTimer?.cancel();
    _timer?.cancel();
    _tickTimer?.cancel();
    _controller.dispose();
    // _tickTimer?.cancel();
    super.dispose();
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
                    color: Colors.red,
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
                                "assets/images/attention_dark.png",
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
                              "Attention",
                              style: TextStyle(
                                color: Colors.grey.shade700,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              '''Stroop Strive:
The Attention Challenge''',
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
                    '''"The Stroop Test game aims to evaluate and enhance players' attentional control by presenting them with stimuli that require rapid and accurate responses while inhibiting interference from conflicting information. By measuring reaction time and accuracy in identifying target stimuli amidst distracting information, the game provides valuable insights into attentional capacity and cognitive processing efficiency."''',
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
                        RuleBox(width, height, howToPlay[3]),
                        RuleBox(width, height, howToPlay[4]),
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
                        Colors.red.shade400,
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
                              color: Colors.red.shade700,
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
                                          "assets/images/attention_dark.png",
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
                                        '''Stroop Strive:''',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey.shade400,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const Text(
                                        '''The Attention Challenge''',
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
                                      _pauseTimer();
                                      // _controller.pause();
                                      _showPauseMenu();
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
                                  backgroundColor: Colors.red.shade600,
                                ),
                              ),
                              Expanded(
                                child: LinearProgressIndicator(
                                  color: Colors.red.shade600,
                                  minHeight: 20.0,
                                  value: _animation1.value,
                                  backgroundColor: Colors.grey.shade100,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height * 0.2,
                          ),
                        ],
                      ),
                    ],
                  ),
                  // SizedBox(
                  //   height: height * 0.15,
                  // ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: width * 0.2,
                            vertical: height * 0.01,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade800,
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
                          height: height * 0.15,
                        ),
                        SizedBox(
                          width: width * 0.8,
                          height: height * 0.3,
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 3,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                            ),
                            itemCount: _shuffledColors.length,
                            itemBuilder: (context, index) {
                              final colorText = _shuffledColors[index];
                              final buttonColor =
                                  _buttonColors[index % _buttonColors.length];
                              return ElevatedButton(
                                onPressed: () => _checkAnswer(colorText),
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: width * 0.03,
                                  ),
                                  backgroundColor:
                                      _score < 40 ? Colors.white : buttonColor,
                                ),
                                child: Text(
                                  colorText,
                                  style: const TextStyle(
                                    fontSize: 30,
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

  final List<Color> _buttonColors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
  ];

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
          color: Colors.red.shade200,
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
