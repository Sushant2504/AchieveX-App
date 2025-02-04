   
   import 'package:achievex/ui/theme.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';

Widget TimerWidget(BuildContext context){

   return Positioned(
              bottom: 1,
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(color: AppColors.whiteColor),
                alignment: Alignment.center,
                child: TimerCountdown(
                  format: CountDownTimerFormat.minutesSeconds,
                  endTime: DateTime.now().add(
                    const Duration(
                      minutes: 10,
                      seconds: 00,
                    ),
                  ),
                  onEnd: () {
                    print("Timer finished");
                  },
                ),
              ),
            );

   }
   