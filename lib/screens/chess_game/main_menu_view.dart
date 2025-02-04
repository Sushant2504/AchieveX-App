import 'package:achievex/screens/chess_game/model/app_model.dart';
import 'package:achievex/screens/chess_game/views/components/main_menu_view/game_options.dart';
import 'package:achievex/screens/chess_game/views/components/main_menu_view/main_menu_buttons.dart';
import 'package:achievex/screens/chess_game/views/components/shared/bottom_padding.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainMenuView extends StatefulWidget {
  const MainMenuView({super.key});

  @override
  _MainMenuViewState createState() => _MainMenuViewState();
}

class _MainMenuViewState extends State<MainMenuView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffddf1d7),
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
      body: Consumer<AppModel>(
        builder: (context, appModel, child) {
          return Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                Image.asset(
                  "assets/images/chess_background.png",
                  height: 200,
                ),
                const SizedBox(height: 20),
                GameOptions(appModel),
                const SizedBox(height: 10),
                MainMenuButtons(appModel),
                const BottomPadding(),
              ],
            ),
          );
        },
      ),
    );
  }
}
