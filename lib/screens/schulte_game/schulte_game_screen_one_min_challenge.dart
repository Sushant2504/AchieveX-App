import 'dart:async';
import 'dart:math';

import 'package:achievex/provider/schulte_table_provider.dart';
import 'package:achievex/provider/timer_provider.dart';
import 'package:achievex/screens/result_screen.dart';
import 'package:achievex/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timer_count_down/timer_count_down.dart';

class SchulteTableGameOneMinChallengeScreen extends StatelessWidget {
  const SchulteTableGameOneMinChallengeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    late String number;
    late List<int> numList = [];

    TimerProvider provider = Provider.of<TimerProvider>(context, listen: false);
    SchulteTableProvider schulteTableProvider =
        Provider.of<SchulteTableProvider>(context, listen: false);
    String resultTime = "";
    List<int> list = [
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9,
      10,
      11,
      12,
      13,
      14,
      15,
      16,
      17,
      18,
      19,
      20,
      21,
      22,
      23,
      24,
      25
    ];
    return PopScope(
        canPop: true,
        onPopInvoked: (bool didPop) {
          if (didPop) {
            schulteTableProvider.isStart = false;
            provider.is1MinChallenge = false;
            schulteTableProvider.selectedNumber = 1;
            provider.resetTimer();
            return;
          }
        },
        child: Scaffold(
            body: Stack(children: [
          Image.asset(
            'assets/images/game_bg_b.png',
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.fitHeight,
          ),
            InkWell(
                        onTap: () => {Navigator.pop(context)},
                        child: const Padding(
                          padding: EdgeInsets.only(top: 55.0,left: 25),
                          child: Icon(Icons.arrow_back),
                        ),
                      ),
          Consumer<SchulteTableProvider>(
              builder: (context, tableProvider, child) {
            number = tableProvider.selectedNumber.toString();
            List<int> randomizedList = List.from(list);
            Random random = Random();

            for (int i = randomizedList.length - 1; i > 0; i--) {
              int j = random.nextInt(i + 1);
              int temp = randomizedList[i];
              randomizedList[i] = randomizedList[j];
              randomizedList[j] = temp;
            }
            numList = randomizedList;
            // return
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 100,
                ),
                const SizedBox(
                  height: 10,
                ),
                Stack(children: [
                  Image.asset(
                    'assets/images/square_a.png',
                    height: 60,
                    width: 60,
                  ),
                  SizedBox(
                      height: 60,
                      width: 60,
                      child: Center(
                          child: Text(
                        tableProvider.selectedNumber.toString(),
                        style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ))),
                ]),
                const Padding(
                  padding: EdgeInsets.only(top: 18.0),
                  child: Text(
                    'Find The Number',
                    style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 22,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                (tableProvider.isStart)
                    ? Center(
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          child: GridView.builder(
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 5),
                              itemCount: 25,
                              itemBuilder: (context, index) {
                                return Padding(
                                    padding: const EdgeInsets.all(0.0),
                                    child: Center(
                                        child: InkWell(
                                      onTap: () {
                                        debugPrint(
                                            "check::::$number :: '${numList[index].toString()}'");
                                        if (number ==
                                            numList[index].toString()) {
                                          schulteTableProvider.countResult();
                                          numList =
                                              schulteTableProvider.randomList();
                                          if (int.parse(schulteTableProvider
                                                  .selectedNumber
                                                  .toString()) ==
                                              26) {
                                            Future.delayed(Duration.zero, () {
                                              Navigator.pushAndRemoveUntil(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        ResultScreen(
                                                      resultTime: resultTime,
                                                      count: number,
                                                    ),
                                                  ),
                                                  ((route) => false));
                                            });
                                            // });
                                          }
                                        }
                                      },
                                      child: Stack(children: [
                                        Image.asset(
                                          'assets/images/square_b.png',
                                          height: 50,
                                          width: 50,
                                        ),
                                        SizedBox(
                                            height: 50,
                                            width: 50,
                                            child: Center(
                                              child: Text(
                                                numList[index].toString(),
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                    color: AppColors.blackColor,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 22),
                                              ),
                                            ))
                                      ]),
                                    )));
                              }),
                        ),
                      )
                    : Container(),
                Consumer<TimerProvider>(
                    builder: (context, timerProvider, child) {
                  resultTime =
                      "${timerProvider.hoursString}:${timerProvider.minuteString}:${timerProvider.secondString}";
                  schulteTableProvider.randomizedList;
                  return Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.6,
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: AppColors.blackColor, width: 0.4),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: Countdown(
                        // controller: _controller,
                        seconds: 60,
                        build: (_, double time) => Text(
                          time.toString(),
                          style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff3662FF)),
                        ),
                        interval: const Duration(milliseconds: 100),
                        onFinished: () {
                          Future.delayed(Duration.zero, () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ResultScreen(
                                    resultTime: resultTime,
                                    count: number,
                                  ),
                                ),
                                ((route) => false));
                          });

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Time Finish!'),
                            ),
                          );
                        },
                      ),
                      // Text(
                      //   "${timerProvider.hoursString}:${timerProvider.minuteString}:${timerProvider.secondString}",
                      //   style: const TextStyle(fontSize: 19),
                      // ),
                    ),
                  );
                }),
              ],
            );
          }),
        ])));
  }
}
