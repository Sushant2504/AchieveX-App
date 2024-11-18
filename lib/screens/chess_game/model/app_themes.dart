import 'package:flutter/material.dart';

class AppTheme {
  String? name;
  LinearGradient? background;
  Color lightTile;
  Color darkTile;
  Color moveHint;
  Color checkHint;
  Color latestMove;
  Color border;

  AppTheme({
    this.name,
    this.background,
    this.lightTile = const Color(0xFFC9B28F),
    this.darkTile = const Color(0xFF69493b),
    this.moveHint = const Color(0xdd5c81c4),
    this.latestMove = const Color(0xccc47937),
    this.checkHint = const Color(0x88ff0000),
    this.border = const Color(0xffffffff),
  });
}

List<AppTheme> get themeList {
  var themeList = <AppTheme>[
    AppTheme(
      name: 'Grey',
      background: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xffb2b2b2),
          Color(0xff4e4e4e),
        ],
      ),
      lightTile: const Color(0xffb2b2b2),
      darkTile: const Color(0xff808080),
      moveHint: const Color(0xdd555555),
      checkHint: const Color(0xff333333),
      latestMove: const Color(0xdddddddd),
    ),
    AppTheme(
      name: 'Dark',
      background: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xff1e1e1e),
          Color(0xff2e2e2e),
        ],
      ),
      lightTile: const Color(0xff444444),
      darkTile: const Color(0xff333333),
      border: const Color(0xff555555),
    ),
    AppTheme(
      name: 'Amoled',
      background: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xff000000),
          Color(0xff000000),
        ],
      ),
      lightTile: const Color(0xff444444),
      darkTile: const Color(0xff333333),
      border: const Color(0xff555555),
    ),
    AppTheme(
      name: 'Lewis',
      background: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xff423428),
          Color(0xff423428),
        ],
      ),
      lightTile: const Color(0xffdbd1c1),
      darkTile: const Color(0xffab3848),
      moveHint: const Color(0xdd800b0b),
      latestMove: const Color(0xddcc9c6c),
      border: const Color(0xffbdaa8c),
    ),
    AppTheme(
      name: 'Cherry Funk',
      background: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xff434783),
          Color(0xffdc3b39),
        ],
      ),
      lightTile: const Color(0xffdb5e5c),
      darkTile: const Color(0xff645183),
      moveHint: const Color(0xaabdacce),
      latestMove: const Color(0xaaf0b35d),
      border: const Color(0xff434783),
    ),
    AppTheme(
      name: 'Sage',
      background: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFF83886F),
          Color(0xFF000000),
        ],
      ),
      lightTile: const Color(0xFFB2AD91),
      darkTile: const Color(0xFF83886F),
      moveHint: const Color(0xaa45a881),
      latestMove: const Color(0xaa2782b0),
      border: const Color(0xFF000000),
    ),
    AppTheme(
      name: 'Warm Tan',
      background: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFF866749),
          Color(0xFF000000),
        ],
      ),
      lightTile: const Color(0xFFD3A373),
      darkTile: const Color(0xFF866749),
      moveHint: const Color(0xaa45a881),
      latestMove: const Color(0xaa2782b0),
      border: const Color(0xFF000000),
    ),
    AppTheme(
      name: 'Jargon Jade',
      background: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFF517970),
          Color(0xFF000000),
        ],
      ),
      lightTile: const Color(0xFF85B39F),
      darkTile: const Color(0xFF517970),
      moveHint: const Color(0xaa45a881),
      latestMove: const Color(0xaa2782b0),
      border: const Color(0xFF000000),
    ),
  ];
  // themeList.sort((a, b) => a.name?.compareTo(b.name ?? "") ?? 0);
  return themeList;
}
