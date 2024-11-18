
import 'package:achievex/provider/schulte_table_provider.dart';
import 'package:achievex/provider/timer_provider.dart';
import 'package:achievex/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SchulteTableGameScreen extends StatelessWidget {
  const SchulteTableGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    late String number;
    late List<int> numList = [];

    TimerProvider provider = Provider.of<TimerProvider>(context, listen: false);
    SchulteTableProvider schulteTableProvider = Provider.of<SchulteTableProvider>(context, listen: false);

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
          body: Consumer<SchulteTableProvider>(
              builder: (context, tableProvider, child) {
            number = tableProvider.selectedNumber.toString();

            // return
            return Stack(children: [
              Image.asset(
                'assets/images/game_bg_a.png',
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
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/s_table.png',
                    height: 200,
                    width: 200,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Schulte Table',
                          style: TextStyle(
                              fontSize: 28,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'Sharpen focus by finding numbers in order across a scattered grid.',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () => {
                      tableProvider.isStart = true,
                      schulteTableProvider.selectedNumber = 1,
                      provider.is1MinChallenge = false,
                      numList = tableProvider.randomList(),
                      provider.startTimer(),
                      Navigator.pushNamed(
                          context, RoutesName.schulteTableScreenNormal),
                    },
                    child: Container(
                        height: 40,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: const Color(0xff006FEA),
                            borderRadius: BorderRadius.circular(6)),
                        child: const Center(
                            child: Text(
                          'Start Normal Game',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ))),
                  ),
                  InkWell(
                    onTap: () => {
                      tableProvider.isStart = true,
                      schulteTableProvider.selectedNumber = 1,
                      provider.is1MinChallenge = true,
                      numList = tableProvider.randomList(),
                      provider.startTimer(),
                      Navigator.pushNamed(context,
                          RoutesName.schulteTableScreenOneMinChallenge),
                    },
                    child: Container(
                        height: 40,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: const Color(0xff006FEA),
                            borderRadius: BorderRadius.circular(6)),
                        child: const Center(
                            child: Text(
                          '1 minute challenge',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ))),
                  ),
                ],
              ),
            ]);
          }),
        ));
  }
}
