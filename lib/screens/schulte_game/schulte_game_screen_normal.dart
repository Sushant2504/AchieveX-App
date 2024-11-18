import 'dart:async';
import 'dart:math';

import 'package:achievex/provider/schulte_table_provider.dart';
import 'package:achievex/provider/timer_provider.dart';
import 'package:achievex/screens/result_screen.dart';
import 'package:achievex/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SchulteTableGameNormalScreen extends StatefulWidget {
  const SchulteTableGameNormalScreen({super.key});

  @override
  State<SchulteTableGameNormalScreen> createState() =>
      _SchulteTableGameNormalScreenState();
}

class _SchulteTableGameNormalScreenState
    extends State<SchulteTableGameNormalScreen> {
  late String number;
  late List<int> numList = [];
  // SchulteTableProvider? schulteTableProvider;
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

  @override
  Widget build(BuildContext context) {
    return Consumer<SchulteTableProvider>(
        builder: (context, tableProvider, child) {
      number = Provider.of<SchulteTableProvider>(context, listen: false)
          .selectedNumber
          .toString();

      List<int> randomizedList = List.from(list);
      Random random = Random();

      for (int i = randomizedList.length - 1; i > 0; i--) {
        int j = random.nextInt(i + 1);
        int temp = randomizedList[i];
        randomizedList[i] = randomizedList[j];
        randomizedList[j] = temp;
      }
      numList = randomizedList;
      // Provider.of<TimerProvider>(context, listen: false).startTimer();
      return Scaffold(
        body: Stack(children: [
          Image.asset(
            'assets/images/game_bg_b.png',
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.fitHeight,
          ),
          InkWell(
            onTap: () => {Navigator.pop(context)},
            child: const Padding(
              padding: EdgeInsets.only(top: 55.0, left: 25),
              child: Icon(Icons.arrow_back),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 100,
              ),
              const SizedBox(
                height: 10,
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
              (tableProvider.isStart)
                  ? GridView.builder(
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
                                if (number == numList[index].toString()) {
                                  tableProvider.countResult();
                                  numList = tableProvider.randomList();
                                  if (int.parse(tableProvider.selectedNumber
                                          .toString()) ==
                                      26) {
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
                            ),
                          ),
                        );
                      })
                  : Container(),
              const SizedBox(
                height: 20,
              ),
              Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.6,
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: AppColors.blackColor, width: 0.4),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                    child: Consumer<TimerProvider>(
                        builder: (context, provider, child) {
                      return Text(
                        "${provider.hoursString}:${provider.minuteString}:${provider.secondString}",
                        style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff3662FF)),
                      );
                    }),
                  )),
            ],
          ),
        ]),
      );
    });
  }
}
