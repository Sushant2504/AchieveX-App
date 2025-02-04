import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'package:achievex/screens/brain_games/brain_game_screen.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class Game3 extends StatefulWidget {
  final int initialScore;

  const Game3(this.initialScore, {super.key});

  @override
  _Game3State createState() => _Game3State();
}

class _Game3State extends State<Game3> with SingleTickerProviderStateMixin {
  List<String> howToPlay = [
    'The game consists of presenting players with a sequence of numbers.',
    'Players are then given specific instructions to perform operations on the numbers in the sequence.',
    'Example Instructions:"Tell the number which comes in the 5th position.": Players must identify and state the number that appears in the 5th position of the sequence.',
    'Example Instructions:"Add the number in the 2nd position to the number in the 3rd position.": Players must add the number in the 2nd position of the sequence to the number in the 3rd position and provide the result',
    'You can also check out Tutorial Video of it on courses section.',
  ];

  final Random _random = Random();
  final List<int> _numbers = [];
  int _currentNumberIndex = 0;
  List<Map<String, dynamic>> _questions = [];
  int _currentQuestionIndex = 0;
  int _currentSetIndex = 0;
  bool _showQuestion = false;
  Timer? _timer;
  int _remainingSeconds = 60;
  bool _isPaused = false;
  bool _gameStarted = false;
  bool _gameOver = false;

  late AnimationController _controller;
  late Animation<double> _animation1;
  late Animation<double> _animation2;

  int _ticksec = 3;
  Timer? _tickTimer;

  final List<int> _questionsPerSet = [
    3,
    3,
    4
  ]; // Number of questions in each set

  int _score = 0;

  bool _countdownActive = false;
  int _countdown = 3; // Countdown value in seconds
  Timer? _countdownTimer;

  late ConfettiController _controllerCenter;

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
        _startGame();
      }
    });
  }

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
    super.initState();
    _controllerCenter = ConfettiController(
      duration: const Duration(
        seconds: 3,
      ),
    );
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
          seconds: _remainingSeconds), // Use total time as animation duration
    );

    // Setup animation
    _animation1 = Tween<double>(begin: 1.0, end: 0.0).animate(_controller)
      ..addListener(() {
        setState(() {
          // Update time based on animation value
          _remainingSeconds =
              (_controller.duration!.inSeconds * _animation1.value).floor();
        });
      });
    _animation2 = Tween<double>(begin: 0.0, end: 1.0).animate(_controller)
      ..addListener(() {
        setState(() {
          // Update time based on animation value
          _remainingSeconds =
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
    _score = 0;
    _startGame();
  }

  void _startGame() {
    _score = 0;
    _currentSetIndex = 0;
    _remainingSeconds = 60;
    _startNewSet();
    _controller.reset();
    _controller.forward();
  }

  void _startNewSet() {
    _generateNumbers();
    _currentNumberIndex = 0;
    _questions = [];
    _currentQuestionIndex = 0;
    _showQuestion = false;
    _generateQuestions();
    _nextNumber();
  }

  void _generateNumbers() {
    // Generate initial list of numbers
    _numbers.clear();
    _numbers.add(_random.nextInt(10));
    for (int i = 1; i < 5; i++) {
      int newNumber;
      do {
        newNumber = _random.nextInt(10);
      } while (newNumber == _numbers[i - 1]); // Ensure no consecutive numbers
      _numbers.add(newNumber);
    }
  }

  void _generateQuestions() {
    List<String> possibleQuestions = [];
    switch (_currentSetIndex) {
      case 0: // Position-based questions for the first set
        possibleQuestions = [
          'What is the 1st number?',
          'What is the 2nd number?',
          'What is the 3rd number?',
          'What is the 4th number?',
          'What is the last number?',
          'What is the second last number?',
        ];
        break;
      case 1: // Addition-based questions for the second set
        possibleQuestions = [
          'What is the difference of 1st and 2nd numbers?',
          'What is the difference of 2nd and 3rd numbers?',
          'What is the difference of 3rd and 4th numbers?',
          'What is the difference of 4th and 5th numbers?',
          'What is the difference of 1st and 3rd numbers?',
          'What is the difference of 3rd and 5th numbers?',
          'What is the difference of 2nd and 4th numbers?',
          'What is the difference of 2nd and 5th numbers?',
          'What is the sum of 1st and 2nd numbers?',
          'What is the sum of 2nd and 3rd numbers?',
          'What is the sum of 3rd and 4th numbers?',
          'What is the sum of last two numbers?',
          'What is the sum of 1st and 3rd numbers?',
          'What is the sum of the first two numbers?',
          'What is the sum of the 2nd and 4th numbers?',
        ];
        break;
      case 2: // Product-based questions for the third set
        possibleQuestions = [
          '1st number X 2nd number?',
          '1st number X 3rd number?',
          '1st number X 4th number?',
          '1st number X 5th number?',
          '2nd number X 3rd number?',
          '2nd number X 4th number?',
          '2nd number X 5th number?',
          '3rd number X 4th number?',
          '3rd number X 5th number?',
          '4th number X 5th number?',
          '1st number X 2nd number X 3rd number?', // 123
          '1st number X 3rd number X 4th number?', // 134
          '1st number X 3rd number X 5th number?', // 135
          '1st number X 4th number X 5th number?', // 145
          '1st number X 2nd number X 4th number?', // 124
          '1st number X 2nd number X 5th number?', // 125
          '2nd number X 3rd number X 4th number?', // 234
          '2nd number X 3rd number X 5th number?', // 235
          '2nd number X 4th number X 5th number?', // 245
          '3rd number X 4th number X 5th number?', // 345
        ];
        break;
    }

    int numQuestions = _questionsPerSet[_currentSetIndex];

    for (int i = 0; i < numQuestions; i++) {
      String question =
          possibleQuestions[_random.nextInt(possibleQuestions.length)];
      String correctAnswer;
      switch (question) {
        case 'What is the 1st number?':
          correctAnswer = _numbers[0].toString();
          break;
        case 'What is the 2nd number?':
          correctAnswer = _numbers[1].toString();
          break;
        case 'What is the 3rd number?':
          correctAnswer = _numbers[2].toString();
          break;
        case 'What is the 4th number?':
          correctAnswer = _numbers[3].toString();
          break;
        case 'What is the last number?':
          correctAnswer = _numbers[4].toString();
          break;
        case 'What is the second last number?':
          correctAnswer = _numbers[3].toString();
          break;
        case 'What is the difference of 1st and 2nd numbers?':
          correctAnswer = (_numbers[0] - _numbers[1]).toString();
          break;
        case 'What is the difference of 2nd and 3rd numbers?':
          correctAnswer = (_numbers[1] - _numbers[2]).toString();
          break;
        case 'What is the difference of 3rd and 4th numbers?':
          correctAnswer = (_numbers[2] - _numbers[3]).toString();
          break;
        case 'What is the difference of 4th and 5th numbers?':
          correctAnswer = (_numbers[3] - _numbers[4]).toString();
          break;
        case 'What is the difference of 1st and 3rd numbers?':
          correctAnswer = (_numbers[0] - _numbers[2]).toString();
          break;
        case 'What is the difference of 3rd and 5th numbers?':
          correctAnswer = (_numbers[2] - _numbers[4]).toString();
          break;
        case 'What is the difference of 2nd and 4th numbers?':
          correctAnswer = (_numbers[1] - _numbers[3]).toString();
          break;
        case 'What is the difference of 2nd and 5th numbers?':
          correctAnswer = (_numbers[1] - _numbers[4]).toString();
          break;
        case 'What is the sum of 1st and 2nd numbers?':
          correctAnswer = (_numbers[0] + _numbers[1]).toString();
          break;
        case 'What is the sum of 2nd and 3rd numbers?':
          correctAnswer = (_numbers[1] + _numbers[2]).toString();
          break;
        case 'What is the sum of 3rd and 4th numbers?':
          correctAnswer = (_numbers[2] + _numbers[3]).toString();
          break;
        case 'What is the sum of last two numbers?':
          correctAnswer = (_numbers[3] + _numbers[4]).toString();
          break;
        case 'What is the sum of 1st and 3rd numbers?':
          correctAnswer = (_numbers[0] + _numbers[2]).toString();
          break;
        case 'What is the sum of the first two numbers?':
          correctAnswer = (_numbers[0] + _numbers[1]).toString();
          break;
        case 'What is the sum of the 2nd and 4th numbers?':
          correctAnswer = (_numbers[1] + _numbers[3]).toString();
          break;
        case '1st number X 2nd number?':
          correctAnswer = (_numbers[0] * _numbers[1]).toString();
          break;
        case '1st number X 3rd number?':
          correctAnswer = (_numbers[0] * _numbers[2]).toString();
          break;
        case '1st number X 4th number?':
          correctAnswer = (_numbers[0] * _numbers[3]).toString();
          break;
        case '1st number X 5th number?':
          correctAnswer = (_numbers[0] * _numbers[4]).toString();
          break;
        case '2nd number X 3rd number?':
          correctAnswer = (_numbers[1] * _numbers[2]).toString();
          break;
        case '2nd number X 4th number?':
          correctAnswer = (_numbers[1] * _numbers[3]).toString();
          break;
        case '2nd number X 5th number?':
          correctAnswer = (_numbers[1] * _numbers[4]).toString();
          break;
        case '3rd number X 4th number?':
          correctAnswer = (_numbers[2] * _numbers[3]).toString();
          break;
        case '3rd number X 5th number?':
          correctAnswer = (_numbers[2] * _numbers[4]).toString();
          break;
        case '4th number X 5th number?':
          correctAnswer = (_numbers[3] * _numbers[4]).toString();
          break;
        case '1st number X 2nd number X 3rd number?':
          correctAnswer = (_numbers[0] * _numbers[1] * _numbers[2]).toString();
          break;
        case '1st number X 3rd number X 4th number?':
          correctAnswer = (_numbers[0] * _numbers[2] * _numbers[3]).toString();
          break;
        case '1st number X 3rd number X 5th number?':
          correctAnswer = (_numbers[0] * _numbers[2] * _numbers[4]).toString();
          break;
        case '1st number X 4th number X 5th number?':
          correctAnswer = (_numbers[0] * _numbers[3] * _numbers[4]).toString();
          break;
        case '1st number X 2nd number X 4th number?':
          correctAnswer = (_numbers[0] * _numbers[1] * _numbers[3]).toString();
          break;
        case '1st number X 2nd number X 5th number?':
          correctAnswer = (_numbers[0] * _numbers[1] * _numbers[4]).toString();
          break;
        case '2nd number X 3rd number X 4th number?':
          correctAnswer = (_numbers[1] * _numbers[2] * _numbers[3]).toString();
          break;
        case '2nd number X 3rd number X 5th number?':
          correctAnswer = (_numbers[1] * _numbers[2] * _numbers[4]).toString();
          break;
        case '2nd number X 4th number X 5th number?':
          correctAnswer = (_numbers[1] * _numbers[3] * _numbers[4]).toString();
          break;
        case '3rd number X 4th number X 5th number?':
          correctAnswer = (_numbers[2] * _numbers[3] * _numbers[4]).toString();
          break;
        default:
          correctAnswer = '_numbers[_currentSetIndex].toString()';
      }

      // Generate options
      List<String> options = [correctAnswer];
      while (options.length < 3) {
        String randomOption =
            (_random.nextInt(20)).toString(); // Random number between 0 and 20
        if (!options.contains(randomOption)) {
          options.add(randomOption);
        }
      }
      options.shuffle(); // Shuffle the options

      _questions.add({
        'question': question,
        'correctAnswer': correctAnswer,
        'options': options,
      });
      possibleQuestions.remove(question); // Ensure no duplicate questions
    }
  }

  void _nextNumber() {
    if (_currentNumberIndex < _numbers.length) {
      setState(() {});
      _timer = Timer(const Duration(seconds: 3), () {
        _currentNumberIndex++;
        _nextNumber();
      });
    } else {
      _timer?.cancel();
      _askNextQuestion();
    }
  }

  void _askNextQuestion() {
    if (_currentQuestionIndex < _questions.length) {
      setState(() {
        _showQuestion = true;
        // _startTimer();
      });
    } else if (_currentSetIndex < 2) {
      _timer?.cancel();
      _currentSetIndex++;
      _startNewSet();
    } else {
      // _endGame();
      // Navigator.pop(context, _score);
      setState(() {
        _gameStarted = false;
        _gameOver = true;
      });
    }
  }

  void _checkAnswer(String selectedOption) {
    String correctAnswer = _questions[_currentQuestionIndex]['correctAnswer'];
    if (selectedOption == correctAnswer) {
      _score += 20;
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(
      //     content: Text('Correct!'),
      //   ),
      // );
    } else {
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //     content: Text('Wrong! The correct answer was $correctAnswer'),
      //   ),
      // );
    }
    _currentQuestionIndex++;
    _askNextQuestion();
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
                              _startGame();
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
                                    builder: (context) =>
                                        const BrainGameScreen(),
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

  @override
  void dispose() {
    _countdownTimer?.cancel(); // Cancel the countdown timer
    _timer?.cancel(); // Cancel the game timer
    _tickTimer?.cancel(); // Cancel the tick timer
    _controller.dispose(); // Dispose the animation controller
    _controllerCenter.dispose(); // Dispose the confetti controller
    super.dispose();
  }

  static const double _shadowHeight = 4;
  double _position = 4;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
                    color: Colors.green,
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
                                "assets/images/executive.png",
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
                              "Executive Functioning",
                              style: TextStyle(
                                color: Colors.grey.shade700,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              '''Executive Edge: 
Number Edition''',
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
                    '''"Number Edition.The objective of the game is to test and improve executive functioning skills such as working memory, cognitive flexibility, and attention by manipulating and processing number sequences."''',
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
                        Colors.green.shade400,
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
                              color: Colors.green.shade400,
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
                                          "assets/images/executive.png",
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
                                        '''Executive Edge:''',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey.shade700,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const Text(
                                        '''Number Edition''',
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
                                                color: Colors.blueGrey.shade100,
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
                  Row(
                    children: [
                      Expanded(
                        child: LinearProgressIndicator(
                          color: Colors.grey.shade100,
                          minHeight: 20.0,
                          value: _animation2.value,
                          backgroundColor: Colors.green.shade600,
                        ),
                      ),
                      Expanded(
                        child: LinearProgressIndicator(
                          color: Colors.green.shade600,
                          minHeight: 20.0,
                          value: _animation1.value,
                          backgroundColor: Colors.grey.shade100,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _showQuestion
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: height * 0.1),
                            Text(
                              _questions[_currentQuestionIndex]['question'],
                              style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            ..._questions[_currentQuestionIndex]['options']
                                .map(
                                  (option) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        padding: WidgetStateProperty.all(
                                          EdgeInsets.symmetric(
                                            vertical: height * 0.01,
                                            horizontal: width * 0.2,
                                          ),
                                        ),
                                        backgroundColor:
                                            WidgetStateProperty.all(
                                          Colors.green.shade300,
                                        ),
                                        shape: WidgetStateProperty.all(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                      ),
                                      onPressed: () => _checkAnswer(option),
                                      child: Text(
                                        option,
                                        style: const TextStyle(
                                          fontSize: 30,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ],
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: height * 0.1),
                            Text(
                              _currentNumberIndex < _numbers.length
                                  ? 'Number:'
                                  : 'Get ready for the questions!',
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: height * 0.1),
                            Container(
                              width: 200.0,
                              height: 200.0,
                              decoration: const BoxDecoration(
                                color: Colors.transparent,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Text(
                                  _currentNumberIndex < _numbers.length
                                      ? '${_numbers[_currentNumberIndex]}'
                                      : 'Get ready for the questions!',
                                  style: const TextStyle(
                                    fontSize: 100,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
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
          color: Colors.green.shade200,
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
