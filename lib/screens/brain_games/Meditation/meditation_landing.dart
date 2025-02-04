import 'package:achievex/ui/theme.dart';
import 'package:flutter/material.dart';


class MeditationLanding  extends StatelessWidget {
  const MeditationLanding({super.key});

   
  @override
  Widget build(BuildContext context) {
        return Scaffold(
           body: Column(
              children: [
                   InkWell(
                      onTap: () => {Navigator.pop(context)},
                      child: const Padding(
                        padding: EdgeInsets.only(top: 45.0),
                        child: Icon(Icons.arrow_back),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 70.0),
                      child: Text(
                        'Timetable',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            // fontFamily: 'Prompt-Bold',
                            fontSize: 38,
                            color: Colors.black),
                      ),
                    ),
              ],
           ),
        );
  }
}