import 'dart:math';
import 'package:achievex/screens/solo_games/memory/game_over_screen.dart';
import 'package:achievex/screens/solo_games/memory/memory_home_screen.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'dart:async';


class MemoryMatrixGame extends StatefulWidget {
  const MemoryMatrixGame({
    super.key,
  });

  @override
  _MemoryMatrixGameState createState() => _MemoryMatrixGameState();
}

class _MemoryMatrixGameState extends State<MemoryMatrixGame> {
  int memoryPoints = 0;
  int rows = 3;
  int columns = 3;
  List<List<bool>> _grid = [];
  List<List<bool>> _revealed = [];
  bool _showHighlight = true;
  Timer? _gameTimer;
  int _timeRemaining = 60;
  int coloredBoxes = 2;
  bool _isPaused = false;
  bool _isGameOver = false;

  final CountDownController _controller = CountDownController();

  @override
  void initState() {
    super.initState();
    _initializeGame();
  }

  void _initializeGame() {
    // Reset grid and revealed tiles
    _grid = List.generate(rows, (_) => List.generate(columns, (_) => false));
    _revealed =
        List.generate(rows, (_) => List.generate(columns, (_) => false));

    // Reset time remaining and start game timer
    _timeRemaining = 60;

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

    _startGameTimer();
  }

  void _startGameTimer() {
    _gameTimer?.cancel(); // Cancel any existing timer
    _gameTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!_isPaused) {
        setState(() {
          if (_timeRemaining > 0) {
            _timeRemaining -= 1;
          } else {
            timer.cancel();
            _endGame();
          }
        });
      }
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

  void _endGame() {
    if (!_isGameOver) {
      _isGameOver = true; // Set flag to true to prevent multiple calls
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MemoryGameOver(
              memoryPoints: memoryPoints,
            ),
          ),
        );
      }
    }
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
        memoryPoints += 20;
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
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.amber,
          title: const Center(
            child: Text("Game Paused"),
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
                icon: const Icon(Icons.play_arrow),
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MemoryHomeScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.exit_to_app_outlined),
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
  void dispose() {
    _gameTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
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
                      top: height * 0.08,
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Memory",
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
              SizedBox(height: height * 0.25),
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.05,
                  ),
                  itemCount: rows * columns,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                                  ? (isCorrect ? Colors.blue : Colors.red)
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
          Positioned(
            top: height * 0.13,
            left: width * 0.35,
            child: SizedBox(
              width: width * 0.3,
              height: height * 0.3,
              child: CircularCountDownTimer(
                width: width * 0.3,
                height: height * 0.3,
                duration: _timeRemaining,
                initialDuration: 0,
                controller: _controller,
                ringColor: Colors.transparent,
                ringGradient: null,
                fillColor: Colors.red,
                fillGradient: null,
                backgroundColor: Colors.transparent,
                backgroundGradient: null,
                strokeWidth: 5.0,
                strokeCap: StrokeCap.round,
                textStyle: const TextStyle(
                  fontSize: 50.0,
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
                  _endGame();
                },
                onChange: (String timeStamp) {
                  debugPrint('Countdown Changed $timeStamp');
                },
                timeFormatterFunction: (defaultFormatterFunction, duration) {
                  if (duration.inSeconds == 0) {
                    return defaultFormatterFunction(duration);
                  } else {
                    return Function.apply(
                      defaultFormatterFunction,
                      [duration],
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
