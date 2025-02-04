import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:achievex/screens/sudoku_game/sudoku.dart';

class SaveManager {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  static final SaveManager _instance = SaveManager._internal();

  factory SaveManager() {
    return _instance;
  }

  SaveManager._internal();

  Future<int> getLastDifficulty() async {
    final SharedPreferences prefs = await _prefs;

    if(prefs.containsKey("lastDifficulty")) {
      return prefs.getInt("lastDifficulty")!;
    } else {
      return 2; // default to "Medium"
    }
  }

  void saveLastDifficulty(int difficulty) async {
    final SharedPreferences prefs = await _prefs;

    prefs.setInt("lastDifficulty", difficulty);
  }

  Future<bool> saveExists(int difficulty) async {
    final SharedPreferences prefs = await _prefs;

    return prefs.containsKey("board$difficulty");
  }

  void save(int difficulty, Sudoku data) async {
    final SharedPreferences prefs = await _prefs;

    await prefs.setString("board$difficulty", json.encode(data));
  }

  Future<Sudoku> load(int difficulty) async {
    final SharedPreferences prefs = await _prefs;

    String jsonData = prefs.getString("board$difficulty")!;

    final jason = json.decode(jsonData);

    return Sudoku.fromJson(jason);
  }

  void clear(int difficulty) async {
    final SharedPreferences prefs = await _prefs;

    prefs.remove("board$difficulty");
  }

  // scores are stringified as yMd#time
  void recordScore(Duration time, int difficulty) async {
    final SharedPreferences prefs = await _prefs;

    List<String> scores = prefs.getStringList("scores$difficulty") ?? List<String>.empty(growable: true);

    // delete invalid entries
    scores.removeWhere((string) => !string.contains('#'));

    DateTime now = DateTime.now();
    String currentScore = "${now.day} ${DateFormat.yMMM().format(now)}#${time.inSeconds}";

    // place new score at correct position
    int index = 0;
    int currentScoreTime = int.parse(currentScore.substring(currentScore.indexOf('#') + 1));

    while (index < scores.length) {
      String otherScore = scores[index];
      int otherScoreTime = int.parse(otherScore.substring(otherScore.indexOf('#') + 1));
      if (otherScoreTime >= currentScoreTime) {
        break;
      }
      index++;
    }
    scores.insert(index, currentScore);

    if(scores.length > 10) {
      scores.removeRange(10, scores.length);
    }

    prefs.setStringList("scores$difficulty", scores);
  }

  Future<List<Score>> getScores(int difficulty) async {
    final SharedPreferences prefs = await _prefs;

    List<String> scores = prefs.getStringList("scores$difficulty") ?? List<String>.empty(growable: true);

    // delete invalid entries
    scores.removeWhere((string) => !string.contains('#'));

    List<Score> ret = List<Score>.empty(growable: true);

    for(int i = 0; i < scores.length; i++) {
      ret.add(
        Score(
          Duration(seconds: int.parse(scores[i].substring(
              scores[i].indexOf('#') + 1, scores[i].length))),
          scores[i].substring(0, scores[i].indexOf('#'))
        )
      );
    }

    return ret;
  }

  Future<bool> hasSeenTutorial() async {
    final SharedPreferences prefs = await _prefs;

    if(!prefs.containsKey("seenTutorial")) {
      return false;
    }

    return prefs.getBool("seenTutorial")!;
  }

  Future<bool> markTutorialSeen(bool seen) async {
    final SharedPreferences prefs = await _prefs;

    return prefs.setBool("seenTutorial", seen);
  }
}

class Score {
  Duration time;
  String date;

  Score(this.time, this.date);
}
