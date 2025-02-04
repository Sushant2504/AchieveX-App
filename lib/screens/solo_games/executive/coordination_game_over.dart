
import 'package:achievex/screens/solo_games/executive/coordintation_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class CoordinationGameOver extends StatelessWidget {
  final int executivePoints;

  const CoordinationGameOver({
    super.key,
    required this.executivePoints,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: height * 0.35,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.green.shade400,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: height * 0.05,
                  right: 20,
                  child: Container(
                    height: height * 0.3,
                    width: width * 0.5,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/functionality.png"),
                        fit: BoxFit.contain,
                      ),
                      color: Colors.transparent,
                    ),
                  ),
                ),
                Positioned(
                  left: 12,
                  top: height * 0.27,
                  child: const Text(
                    'Game Over!',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.06,
          ),
          _getRadialGauge(executivePoints),
          const Spacer(),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colors.green),
              padding: WidgetStateProperty.all(
                EdgeInsets.symmetric(
                  horizontal: width * 0.3,
                  vertical: height * 0.02,
                ),
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CoordinationHomeScreen()),
              );
            },
            child: const Text(
              "Exit game!",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: height * 0.025,
          )
        ],
      ),
    );
  }

  Widget _getRadialGauge(int gameScore) {
    return SfRadialGauge(
      enableLoadingAnimation: true,
      animationDuration: 3500,
      axes: <RadialAxis>[
        RadialAxis(
          minimum: 0,
          maximum: 200,
          ranges: <GaugeRange>[
            GaugeRange(
              startValue: 0,
              endValue: gameScore.toDouble(),
              startWidth: 10,
              endWidth: 10,
              gradient: const SweepGradient(
                colors: <Color>[
                  Colors.blue,
                  Colors.lightBlue,
                ],
                stops: <double>[0.5, 1.0],
              ),
            ),
          ],
          pointers: <GaugePointer>[
            NeedlePointer(
              value: gameScore.toDouble(),
              enableAnimation: true,
            ),
          ],
          annotations: <GaugeAnnotation>[
            GaugeAnnotation(
              widget: Container(
                child: Text(
                  '${gameScore.toString()}/200',
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              angle: 90,
              positionFactor: 0.5,
            ),
          ],
        ),
      ],
    );
  }
}
