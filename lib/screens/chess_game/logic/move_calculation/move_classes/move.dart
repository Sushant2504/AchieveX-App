import 'package:achievex/screens/chess_game/logic/chess_piece.dart';

class Move {
  int from;
  int to;
  ChessPieceType promotionType;

  Move(this.from, this.to, {this.promotionType = ChessPieceType.promotion});

  @override
  bool operator ==(move) =>
      from == (move as Move).from && (this).to == move.to;
}
