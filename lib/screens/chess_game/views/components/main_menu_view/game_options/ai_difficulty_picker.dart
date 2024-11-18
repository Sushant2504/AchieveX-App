import 'package:flutter/cupertino.dart';

import 'picker.dart';

class AIDifficultyPicker extends StatelessWidget {
  final Map<int, Text> difficultyOptions = {
    1: const Text('1'),
    2: const Text('2'),
    3: const Text('3'),
  };

  final int aiDifficulty;
  final Function(int?) setFunc;

  AIDifficultyPicker(this.aiDifficulty, this.setFunc, {super.key});

  @override
  Widget build(BuildContext context) {
    return Picker<int>(
      label: 'Opponent Difficulty',
      options: difficultyOptions,
      selection: aiDifficulty,
      setFunc: setFunc,
    );
  }
}
