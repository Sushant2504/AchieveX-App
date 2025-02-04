import 'dart:async';
import 'package:achievex/screens/solo_games/executive/coordination_game_over.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class CoordinationGame extends StatefulWidget {
  const CoordinationGame({
    super.key,
  });

  @override
  _CoordinationGameState createState() => _CoordinationGameState();
}

class _CoordinationGameState extends State<CoordinationGame> {
  final Random _random = Random();
  final List<int> _numbers = [];
  int _currentNumberIndex = 0;
  List<Map<String, dynamic>> _questions = [];
  int _currentQuestionIndex = 0;
  int _currentSetIndex = 0;
  int executivePoints = 0;
  bool _showQuestion = false;
  bool _showFinalScore = false;
  Timer? _timer;
  int _remainingSeconds = 60;
  bool _showingNumbers = true;
  bool _isPaused = false;

  final List<int> _questionsPerSet = [
    3,
    3,
    4
  ]; // Number of questions in each set

  @override
  void initState() {
    super.initState();
    _startGame();
  }

  void _startGame() {
    executivePoints = 0;
    _currentSetIndex = 0;
    _remainingSeconds = 60;
    _startNewSet();
  }

  void _startNewSet() {
    _generateNumbers();
    _currentNumberIndex = 0;
    _questions = [];
    _currentQuestionIndex = 0;
    _showQuestion = false;
    _showFinalScore = false;
    _showingNumbers = true;
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
        _showingNumbers = false;
        _startTimer();
      });
    } else if (_currentSetIndex < 2) {
      // Pause the timer before starting the new set
      _timer?.cancel();
      _currentSetIndex++;
      _startNewSet();
    } else {
      _endGame();
    }
  }

  void _endGame() {
    _timer?.cancel();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => CoordinationGameOver(
          executivePoints: executivePoints,
        ),
      ),
    );
  }

  void _checkAnswer(String selectedOption) {
    String correctAnswer = _questions[_currentQuestionIndex]['correctAnswer'];
    if (selectedOption == correctAnswer) {
      executivePoints += 20;
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

  void _startTimer() {
    _timer?.cancel(); // Cancel any existing timer
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0 && _showQuestion) {
        setState(() {
          _remainingSeconds--;
        });
      } else {
        _timer?.cancel();
        if (_remainingSeconds <= 0) {
          _endGame();
        }
      }
    });
  }

  void _pauseTimer() {
    setState(() {
      _isPaused = true;
    });
    _timer?.cancel();
  }

  void _resumeTimer() {
    setState(() {
      _isPaused = false;
    });
    _startTimer();
  }

  void _showPauseMenu() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.green,
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
                  // Navigator.of(context).pushReplacement(
                  //   MaterialPageRoute(
                  //     builder: (context) => CoordinationHomeScreen(),
                  //   ),
                  // );
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

  final CountDownController _controller = CountDownController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: height * 0.14,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.green.shade400,
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
                                  "assets/images/functionality.png",
                                ),
                                fit: BoxFit.contain,
                              ),
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        Positioned(
                          left: width * 0.22,
                          top: height * 0.056,
                          right: width * 0.03,
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Executive",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "Functioning",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
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
                              // _controller.pause();
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
                    height: height * 0.07,
                  ),
                ],
              ),
            ],
          ),
          const Text(
            'Time remaining:',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          DottedBorder(
            color: Colors.black,
            strokeWidth: 3,
            child: Container(
              width: width * 0.6,
              height: height * 0.08,
              decoration: BoxDecoration(
                color: Colors.red.shade300,
              ),
              child: Center(
                child: Text(
                  '$_remainingSeconds seconds',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
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
                                backgroundColor: WidgetStateProperty.all(
                                  Colors.green.shade300,
                                ),
                                shape: WidgetStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
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
                    SizedBox(height: height * 0.02),
                    Container(
                      width: 200.0,
                      height: 200.0,
                      decoration: BoxDecoration(
                        color: Colors.green.shade300,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          _currentNumberIndex < _numbers.length
                              ? '${_numbers[_currentNumberIndex]}'
                              : 'Get ready for the questions!',
                          style: const TextStyle(
                            fontSize: 50,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
