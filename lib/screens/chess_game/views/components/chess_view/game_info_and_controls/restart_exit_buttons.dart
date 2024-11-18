import 'package:achievex/screens/chess_game/model/app_model.dart';
import 'package:achievex/screens/chess_game/views/components/chess_view/game_info_and_controls/rounded_alert_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RestartExitButtons extends StatelessWidget {
  final AppModel appModel;

  const RestartExitButtons(this.appModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ButtonStyle(
              elevation: WidgetStateProperty.all<double>(4),
              backgroundColor: WidgetStateProperty.all<Color>(
                const Color(0xffddf1d7),
              ),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            child: const Text(
              'Restart',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            onPressed: () {
              appModel.newGame(context);
            },
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: ElevatedButton(
            style: ButtonStyle(
              elevation: WidgetStateProperty.all<double>(4),
              backgroundColor: WidgetStateProperty.all<Color>(
                const Color(0xffddf1d7),
              ),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            child: const Text(
              'Exit',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            onPressed: () {
              appModel.exitChessView();
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }
}
