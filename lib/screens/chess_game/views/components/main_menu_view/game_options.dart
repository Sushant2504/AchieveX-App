import 'package:achievex/screens/chess_game/model/app_model.dart';
import 'package:flutter/cupertino.dart';

import 'game_options/ai_difficulty_picker.dart';
import 'game_options/side_picker.dart';
import 'game_options/time_limit_picker.dart';

class GameOptions extends StatelessWidget {
  final AppModel appModel;

  const GameOptions(this.appModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          // GameModePicker(
          //   appModel.playerCount,
          //   appModel.setPlayerCount,
          // ),
          const SizedBox(height: 20),
          Column(
            children: [
              AIDifficultyPicker(
                appModel.aiDifficulty,
                appModel.setAIDifficulty,
              ),
              const SizedBox(height: 20),
              SidePicker(
                appModel.selectedSide,
                appModel.setPlayerSide,
              ),
              const SizedBox(height: 20),
            ],
          ),
          TimeLimitPicker(
            selectedTime: appModel.timeLimit,
            setTime: appModel.setTimeLimit,
          ),
        ],
      ),
    );
  }
}
