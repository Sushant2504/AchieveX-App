import 'package:achievex/screens/brain_games/widgets/game_menu_items.dart';
import 'package:flutter/material.dart';
import 'package:popover/popover.dart';

class MyButton extends StatelessWidget {
  final String gameName;
  final String description;

  const MyButton({
    super.key,
    required this.gameName,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        showPopover(
          context: context,
          bodyBuilder: (context) =>
              MenuItems(gameName: gameName, description: description),
          width: width * 0.7,
          height: height * 0.4,
        );
      },
      child: Container(
        height: 30,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(100),
        ),
        child: const Icon(
          Icons.question_mark,
          size: 15,
        ),
      ),
    );
  }
}
