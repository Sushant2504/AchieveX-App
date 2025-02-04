import 'dart:async';

import 'package:achievex/screens/chess_game/model/app_model.dart';
import 'package:achievex/screens/chess_game/views/components/chess_view/chess_board_widget.dart';
import 'package:achievex/screens/chess_game/views/components/chess_view/game_info_and_controls.dart';
import 'package:achievex/screens/chess_game/views/components/chess_view/promotion_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/chess_view/game_info_and_controls/game_status.dart';
import 'components/shared/bottom_padding.dart';

class ChessView extends StatefulWidget {
  final AppModel appModel;

  const ChessView(this.appModel, {super.key});

  @override
  _ChessViewState createState() => _ChessViewState(appModel);
}

class _ChessViewState extends State<ChessView> {
  AppModel appModel;
  _ChessViewState(this.appModel);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _willPopCallback,
      child: Consumer<AppModel>(
        builder: (context, appModel, child) {
          if (appModel.promotionRequested) {
            appModel.promotionRequested = false;
            WidgetsBinding.instance
                .addPostFrameCallback((_) => _showPromotionDialog(appModel));
          }
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
            body: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  const Spacer(),
                  ChessBoardWidget(appModel),
                  const SizedBox(height: 30),
                  const GameStatus(),
                  const Spacer(),
                  GameInfoAndControls(appModel),
                  const BottomPadding(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _showPromotionDialog(AppModel appModel) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return PromotionDialog(appModel);
      },
    );
  }

  Future<bool> _willPopCallback() async {
    appModel.exitChessView();

    return true;
  }
}
