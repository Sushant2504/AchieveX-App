import 'package:achievex/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';

class ChooseColorLevelScreen extends StatelessWidget {
  const ChooseColorLevelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Image.asset(
        'assets/images/stroop_bg_a.png',
     height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
      ),
       InkWell(
                        onTap: () => {Navigator.pop(context)},
                        child: const Padding(
                          padding: EdgeInsets.only(top: 55.0,left: 25),
                          child: Icon(Icons.arrow_back),
                        ),
                      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(28.0),
            child: Image.asset(
              'assets/images/stroop_icon.png',
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 28.0),
            child: Text(
              'Stroop Test',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 38,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 28.0),
            child: Text(
              'Naming colors gets tricky when words play tricks on your brain.',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ),
          InkWell(
            onTap: () => {
              Navigator.pushNamed(
                  context, '/${RoutesName.startcolorGameScreen}',
                  arguments: "1"),
            },
            child: Container(
                margin: const EdgeInsets.only(left:20,right: 20,top: 10),
                height: 45,
                decoration: BoxDecoration(
                    color: const Color(0xff005239),
                    border:
                        Border.all(color: const Color(0xff005239), width: 1),
                    borderRadius: BorderRadius.circular(12)),
                child: const Center(
                    child: Text(
                  "Easy Level",
                  style: TextStyle(color: Colors.white),
                ))),
          ),
          InkWell(
            onTap: () => {
              Navigator.pushNamed(
                  context, '/${RoutesName.startcolorGameScreen}',
                  arguments: "2"),
            },
            child: Container(
                margin: const EdgeInsets.only(left:20,right: 20,top: 10),
                height: 45,
                decoration: BoxDecoration(
                    color: const Color(0xff005239),
                    border:
                        Border.all(color: const Color(0xff005239), width: 1),
                    borderRadius: BorderRadius.circular(12)),
                child: const Center(
                    child: Text("Medium Level", style: TextStyle(color: Colors.white)))),
          ),
          InkWell(
            onTap: () => {
              Navigator.pushNamed(
                  context, '/${RoutesName.startcolorGameScreen}',
                  arguments: "3"),
            },
            child: Container(
                margin: const EdgeInsets.only(left:20,right: 20,top: 10),
                height: 45,
                decoration: BoxDecoration(
                    color: const Color(0xff005239),
                    border:
                        Border.all(color: const Color(0xff005239), width: 1),
                    borderRadius: BorderRadius.circular(12)),
                child: const Center(
                    child: Text("Hard Level", style: TextStyle(color: Colors.white)))),
          ),
        ],
      ),
    ]));
  }
}
