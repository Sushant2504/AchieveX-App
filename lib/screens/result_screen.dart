import 'package:achievex/provider/schulte_table_provider.dart';
import 'package:achievex/provider/timer_provider.dart';
import 'package:achievex/utils/colors.dart';
import 'package:achievex/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResultScreen extends StatefulWidget {
  String resultTime, count;
  ResultScreen({super.key, required this.resultTime, required this.count});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    SchulteTableProvider schulteTableProvider =
        Provider.of<SchulteTableProvider>(context, listen: false);
    TimerProvider provider = Provider.of<TimerProvider>(context, listen: false);
    int result = schulteTableProvider.selectedNumber - 1;
    return Scaffold(
      body: Stack(children: [
        Image.asset(
          'assets/images/game_bg_c.png',
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.fitHeight,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 80,
            ),
            const Text(
              'Schulte Table',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: AppColors.whiteColor),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              height: 40,
              width: 140,
              decoration: const BoxDecoration(
                  color: Color(0xffFE6A66),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              child: const Center(
                  child: Text(
                'Play Again!!',
                style: TextStyle(fontSize: 18, color: AppColors.whiteColor),
              )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 28.0, right: 28),
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color(0xff3662FF)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 32.0, right: 32, top: 18, bottom: 18),
                        child: Text(
                          "${provider.hoursString}:${provider.minuteString}:${provider.secondString}",
                          style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: AppColors.whiteColor),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Congratulation you found $result numbers',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.w600),
                    ),
                  ],
                )),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () => {
                schulteTableProvider.isStart = false,
                provider.is1MinChallenge = false,
                schulteTableProvider.selectedNumber = 1,
                provider.resetTimer(),
                Future.delayed(Duration.zero, () {
                  // Navigator.popUntil(context, ModalRoute.withName(RoutesName.schulteTableScreen));})
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    RoutesName.schulteTableScreen,
                    (Route<dynamic> route) => false,
                  );
                })
              },
              child: const Text('Restart'),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  right: 28.0, left: 28, top: 28, bottom: 28),
              child: Image.asset('assets/images/icon_schult.png'),
            )
          ],
        ),
      ]),
    );
  }
}
