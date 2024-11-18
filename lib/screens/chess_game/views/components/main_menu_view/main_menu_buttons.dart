import 'package:achievex/screens/chess_game/model/app_model.dart';
import 'package:achievex/screens/chess_game/views/components/shared/rounded_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../chess_view.dart';

class MainMenuButtons extends StatelessWidget {
  final AppModel appModel;

  const MainMenuButtons(this.appModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(
                const Color(0xffddf1d7),
              ),
              elevation: WidgetStateProperty.all(10),
              padding: WidgetStateProperty.all(
                const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 50,
                ),
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) {
                    appModel.newGame(context, notify: false);
                    return ChessView(appModel);
                  },
                ),
              );
            },
            child: const Text(
              'Start',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
