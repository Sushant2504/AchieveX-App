import 'dart:async';
import 'dart:math';

import 'package:achievex/provider/color_game_provider.dart';
import 'package:achievex/utils/colors.dart';
import 'package:achievex/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StarColorGameScreen extends StatefulWidget {
  const StarColorGameScreen({super.key});

  @override
  _StarColorGameScreenState createState() => _StarColorGameScreenState();
}

class _StarColorGameScreenState extends State<StarColorGameScreen> {
  late Timer _timer;
  late int totalNum = 1;
  late ColorGameProvider provider;
  late bool gameStart = false;
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Access BuildContext here
      BuildContext context1 = context;
      // Use the BuildContext as needed
      provider = Provider.of<ColorGameProvider>(context1, listen: false);

      final String argument =
          ModalRoute.of(context1)!.settings.arguments as String;
      int seconds = 6;
      if (argument == "1") {
        seconds = 6;
      }
      if (argument == "2") {
        seconds = 4;
      }
      if (argument == "3") {
        seconds = 2;
      }
      _timer = Timer.periodic(Duration(seconds: seconds), (timer) {
        // Access the provider and update the data
        totalNum++;
        if (totalNum >= 7) {
          _timer.cancel();
          Navigator.pushNamedAndRemoveUntil(
              context1, RoutesName.colorGameResultScreen, (route) => false);
        }
        // Force the widget to rebuild with the new data
        setState(() {});
      });
    });
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<ColorGameProvider>(context, listen: false);
    List<String> sentences = ["What is the text meaning?", "What is color?"];

    int randomIndex = Random().nextInt(sentences.length);

    // Select a random sentence
    String randomSentence = sentences[randomIndex];

    return Scaffold(
      body: Stack(
        children: [
          (gameStart)
              ? Stack(children: [
                  Image.asset(
                    'assets/images/stroop_bg_c.png',
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fill,
                  ),
                  InkWell(
                    onTap: () => {Navigator.pop(context)},
                    child: const Padding(
                      padding: EdgeInsets.only(top: 55.0, left: 25),
                      child: Icon(Icons.arrow_back),
                    ),
                  ),
                ])
              : InkWell(
                  onTap: () => {
                    gameStart = true,
                    setState(() {}),
                  },
                  child: Image.asset(
                    'assets/images/stroop_bg_b.png',
                    height: MediaQuery.of(context).size.height,
                    fit: BoxFit.fitHeight,
                  ),
                ),
          (gameStart)
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        provider.getColorName().toString(),
                        style: TextStyle(
                          fontSize: 29,
                          fontWeight: FontWeight.w600,
                          color: Color(
                            int.parse(
                              provider.getColorCode().toString(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text(
                        randomSentence,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColors.blackColor,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    Image.asset(
                      'assets/images/think_icon.png',
                      height: 200,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Write your answers down in a book or Keep it in your mind',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColors.blackColor,
                        ),
                      ),
                    )
                  ],
                )
              : const Column(
                  children: [],
                )
        ],
      ),
    );
  }
}
