import 'dart:async';

import 'package:achievex/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:timezone/data/latest.dart' as tz;

class StartJourneyScreen extends StatefulWidget {
  const StartJourneyScreen({super.key});

  @override
  State<StartJourneyScreen> createState() => _StartJourneyScreenState();
}

class _StartJourneyScreenState extends State<StartJourneyScreen> {
  //SplashProvider splashProvider = SplashProvider();
  bool isVisiblePage = false;

  @override
  void initState() {
    super.initState();
    tz.initializeTimeZones();
    changeDoc();
  }

  void changeDoc() {
    Future.delayed(
      const Duration(seconds: 1),
      () {
        if (mounted) {
          setState(() {
            isVisiblePage = true;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          (!isVisiblePage)
              ? Image.asset(
                  'assets/images/frame-a.png',
                  height: MediaQuery.of(context).size.height,
                  fit: BoxFit.cover,
                )
              : SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: InkWell(
                    onTap: () => Navigator.pushNamedAndRemoveUntil(context,
                        RoutesName.register, (Route<dynamic> route) => false),
                    child: Image.asset(
                      'assets/images/start_page.png',
                      height: MediaQuery.of(context).size.height,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
