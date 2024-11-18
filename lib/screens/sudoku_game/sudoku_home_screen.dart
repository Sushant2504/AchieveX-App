import 'dart:math';
import 'package:achievex/screens/sudoku_game/save_manager.dart';
import 'package:achievex/screens/sudoku_game/sudoku.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:achievex/screens/sudoku_game/game.dart';

class SudokuHomeScreen extends StatefulWidget {
  const SudokuHomeScreen({super.key});

  @override
  _SudokuHomeScreenState createState() => _SudokuHomeScreenState();
}

class _SudokuHomeScreenState extends State<SudokuHomeScreen> {
  int _difficulty = 0;
  String _difficultyStr = "Medium";
  bool _hasSave = false;

  _SudokuHomeScreenState() {
    // start at saved difficulty
    SaveManager().getLastDifficulty().then((value) => _updateDifficulty(value));
  }

  void _updateDifficulty(int delta) {
    // clamp difficulty within bounds of array
    setState(() => _difficulty =
        max(0, min(difficulties.length - 1, _difficulty + delta)));

    Future<bool> saveFuture = SaveManager().saveExists(_difficulty);

    saveFuture.then((value) => setState(() {
          _difficultyStr = difficulties[_difficulty];
          _hasSave = value;
        }));

    SaveManager().saveLastDifficulty(_difficulty);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: const Color(0xffb9bfc5),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset("assets/images/sudoku_backgrounf.png"),
                const SizedBox(height: 50),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: _difficulty == 0
                          ? null
                          : () {
                              _updateDifficulty(-1);
                            },
                      style: ButtonStyle(
                        foregroundColor:
                            WidgetStateProperty.resolveWith<Color>(
                                (Set<WidgetState> states) =>
                                    states.contains(WidgetState.disabled)
                                        ? Colors.grey
                                        : Theme.of(context).primaryColor),
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                      child: const Icon(Icons.arrow_left),
                    ),
                    SizedBox(
                      width: 100,
                      child: Center(
                        child: Text(
                          _difficultyStr,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: _difficulty == difficulties.length - 1
                          ? null
                          : () {
                              _updateDifficulty(1);
                            },
                      style: ButtonStyle(
                        foregroundColor:
                            WidgetStateProperty.resolveWith<Color>(
                                (Set<WidgetState> states) =>
                                    states.contains(WidgetState.disabled)
                                        ? Colors.grey
                                        : Theme.of(context).primaryColor),
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                      child: const Icon(Icons.arrow_right),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      final temp = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              SudokuGame(difficulty: _difficulty),
                        ),
                      );
                      setState(() => _updateDifficulty(0));
                    },
                    style: ButtonStyle(
                      elevation: WidgetStateProperty.all(5.0),
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      backgroundColor: WidgetStateProperty.all(Colors.grey),
                      foregroundColor: WidgetStateProperty.all(
                          Theme.of(context).textTheme.bodyMedium!.color!),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        "New Game",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                FutureBuilder<Sudoku>(
                  future: SaveManager().load(_difficulty),
                  builder:
                      (BuildContext context, AsyncSnapshot<Sudoku> sudoku) {
                    return ElevatedButton(
                      onPressed: _hasSave
                          ? () async {
                              final temp = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SudokuGame(
                                    difficulty: _difficulty,
                                    savedGame: sudoku.data!,
                                  ),
                                ),
                              );
                              setState(
                                () => _updateDifficulty(0),
                              );
                            }
                          : null,
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Colors.grey),
                        elevation: WidgetStateProperty.all(5.0),
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        foregroundColor: WidgetStateProperty.all(
                            Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .color!
                                .withOpacity(_hasSave ? 1 : 0.5)),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          "Continue",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
