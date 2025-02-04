import 'package:achievex/screens/chess_game/logic/chess_piece.dart';
import 'package:achievex/screens/chess_game/model/app_model.dart';
import 'package:achievex/screens/chess_game/views/components/chess_view/promotion_option.dart';
import 'package:flutter/cupertino.dart';

const PROMOTIONS = [
  ChessPieceType.queen,
  ChessPieceType.rook,
  ChessPieceType.bishop,
  ChessPieceType.knight
];

class PromotionDialog extends StatelessWidget {
  final AppModel appModel;

  const PromotionDialog(this.appModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      actions: [
        SizedBox(
          height: 66,
          child: Row(
            children: PROMOTIONS
                .map(
                  (promotionType) => PromotionOption(
                    appModel,
                    promotionType,
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
