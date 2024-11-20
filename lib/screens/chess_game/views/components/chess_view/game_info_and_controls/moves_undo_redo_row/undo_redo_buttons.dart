import 'package:achievex/screens/chess_game/model/app_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UndoRedoButtons extends StatelessWidget {
  final AppModel appModel;

  bool get undoEnabled {
    if (appModel.playingWithAI) {
      return (appModel.game?.board.moveStack.length ?? 0) > 1 &&
          !appModel.isAIsTurn;
    } else {
      return appModel.game?.board.moveStack.isNotEmpty ?? false;
    }
  }

  bool get redoEnabled {
    if (appModel.playingWithAI) {
      return (appModel.game?.board.redoStack.length ?? 0) > 1 &&
          !appModel.isAIsTurn;
    } else {
      return appModel.game?.board.redoStack.isNotEmpty ?? false;
    }
  }

  const UndoRedoButtons(this.appModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: IconButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(
                Colors.green[100]!,
              ),
              padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                const EdgeInsets.symmetric(
                  vertical: 18,
                ),
              ),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            icon: const Icon(
              CupertinoIcons.arrow_counterclockwise,
            ),
            onPressed: undoEnabled ? () => undo() : null,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: IconButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(
                Colors.green[100]!,
              ),
              padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                const EdgeInsets.symmetric(
                  vertical: 18,
                ),
              ),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            icon: const Icon(
              CupertinoIcons.arrow_clockwise,
            ),
            onPressed: redoEnabled ? () => redo() : null,
          ),
        ),
      ],
    );
  }

  void undo() {
    if (appModel.playingWithAI) {
      appModel.game?.undoTwoMoves();
    } else {
      appModel.game?.undoMove();
    }
  }

  void redo() {
    if (appModel.playingWithAI) {
      appModel.game?.redoTwoMoves();
    } else {
      appModel.game?.redoMove();
    }
  }
}
