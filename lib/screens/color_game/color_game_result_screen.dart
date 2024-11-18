import 'package:achievex/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ColorGameResultScreen extends StatefulWidget {
  const ColorGameResultScreen({super.key});

  @override
  State<ColorGameResultScreen> createState() => _ColorGameResultScreenState();
}

class _ColorGameResultScreenState extends State<ColorGameResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Image.asset(
        'assets/images/stroop_d.png',
        height: MediaQuery.of(context).size.height,
        fit: BoxFit.fitHeight,
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            color: Colors.white,
            child: Center(
              child: RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemCount: 7,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);

                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text((rating <= 3)
                            ? "You can improve"
                            : (rating <= 5)
                                ? "Best"
                                : "You are intelligent"),
                        content: Text((rating <= 3)
                            ? "You have to practice more."
                            : (rating <= 5)
                                ? "Your permorance is best"
                                : "Nice job, You are very smart person."),
                        actions: [
                          ElevatedButton(
                            child: const Text("OK"),
                            onPressed: () {
                              // Perform some action
                              Navigator.pushNamedAndRemoveUntil(context,
                                  RoutesName.colorGameScreen, (route) => false);
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () => {
                  Navigator.pushNamed(context, RoutesName.schulteTableScreen),
                },
                child: const SizedBox(
                  width: 120,
                  height: 50,
                 
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () => {
                  Navigator.pushNamed(context, RoutesName.splash),
                },
                child: const SizedBox(
                  width: 120,
                  height: 50,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 0,
          ),
        ],
      ),
    ]));
  }
}
