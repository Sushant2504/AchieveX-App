import 'package:achievex/provider/subscription_provider.dart';
import 'package:achievex/screens/brain_games/brain_game_screen.dart';
import 'package:achievex/screens/brain_games/neuropractice/neuro_home_screen.dart';
import 'package:achievex/screens/widgets/premium_dialogue.dart';
import 'package:achievex/utils/colors.dart';
import 'package:achievex/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GamesScreen extends StatefulWidget {
  const GamesScreen({super.key});

  @override
  State<GamesScreen> createState() => _GamesScreenState();
}

class _GamesScreenState extends State<GamesScreen> {
  String? planId;

  @override
  void initState() {
    super.initState();
    planId = Provider.of<SubscriptionProvider>(context, listen: false).PLAN_ID;
  }

  // Future<bool> showPremiumDialog(BuildContext context) async {
  //   final subscriptionProvider =
  //       Provider.of<SubscriptionProvider>(context, listen: false);
  //   bool canAccess = subscriptionProvider.PLAN_ID == "0" ||
  //       subscriptionProvider.PLAN_ID == "3" ||
  //       subscriptionProvider.IS_PREMIUM!;

  //   if (!canAccess) {
  //     showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return const PremiumContentDialog();
  //       },
  //     );
  //     return false;
  //   }

  //   return true;
  // }

  Future<bool> checkIfPlayedBefore() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('hasPlayedBrainGame') ?? false;
  }

  Future<void> setPlayedStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasPlayedBrainGame', true);
  }

  void navigateToScreen(String routeName) async {
    bool hasPlayedBefore = await checkIfPlayedBefore();
    if (planId == "0" || hasPlayedBefore) {
      await setPlayedStatus();
      Navigator.pushNamed(context, routeName);
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return const PremiumContentDialog();
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Consumer<SubscriptionProvider>(
      builder: (context, subscription, child) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 10, top: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Your,',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Prompt-Bold',
                              fontSize: 22,
                              color: Colors.black,
                            ),
                          ),
                          if (subscription.IS_PREMIUM!)
                            Container(
                              width: width * 0.35,
                              height: height * 0.04,
                              decoration: BoxDecoration(
                                color: Colors.amber.shade200,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/icons/premium_icon.png",
                                    height: 20,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    "Premium",
                                    style: TextStyle(
                                      color: Colors.amber.shade800,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          else
                            const SizedBox(),
                        ],
                      ),
                      const Text(
                        'Brain Booster',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 38,
                          color: AppColors.textNewColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Image.asset('assets/images/game_banner.png'),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 12.0, top: 8, left: 15),
                  child: Text(
                    'Brain Training Sessions',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => {
                    Navigator.pushNamed(context, RoutesName.schulteTableScreen),
                  },
                  child: Image.asset('assets/images/bt_a.png'),
                ),
                InkWell(
                  onTap: () => {
                    if (subscription.IS_PREMIUM! &&
                        subscription.IS_PREMIUM != null)
                      {
                        Navigator.pushNamed(
                            context, RoutesName.colorGameScreen),
                      }
                    else
                      {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const PremiumContentDialog();
                          },
                        )
                      }
                  },
                  child: Image.asset('assets/images/bt_b.png'),
                ),
                const SizedBox(
                  height: 5,
                ),
                buildGameCard(
                  imagePath: 'assets/images/chess_background.png',
                  onTap: () => {
                    if (subscription.IS_PREMIUM! &&
                        subscription.IS_PREMIUM != null)
                      {
                        Navigator.pushNamed(
                            context, RoutesName.chessHomeScreen),
                      }
                    else
                      {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const PremiumContentDialog();
                          },
                        )
                      }
                  },
                  isPremium: true,
                  title: "Chess",
                  subtitle: "Master your moves",
                  containerColor: const Color(0xffddf1d7),
                ),
                const SizedBox(
                  height: 15,
                ),
                buildGameCard(
                  imagePath: 'assets/images/sudoku_backgrounf.png',
                  onTap: () => {
                    if (subscription.IS_PREMIUM! &&
                        subscription.IS_PREMIUM != null)
                      {
                        Navigator.pushNamed(
                            context, RoutesName.sudokuHomeScreen),
                      }
                    else
                      {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const PremiumContentDialog();
                          },
                        )
                      }
                  },
                  isPremium: true,
                  title: "Sudoku",
                  subtitle: "Numbers in harmony",
                  containerColor: Colors.grey.shade400,
                ),
                const SizedBox(
                  height: 15,
                ),
                buildGameCard(
                  imagePath: 'assets/images/neuron.png',
                  // onTap: () => navigateToScreen(RoutesName.brainGameScreen),
                  onTap: () async {
                    bool hasPlayedBefore = await checkIfPlayedBefore();
                    print(planId);
                    if (!hasPlayedBefore) {
                      await setPlayedStatus();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BrainGameScreen(),
                        ),
                      );
                    } else if (planId == '1' || planId == '2') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BrainGameScreen(),
                        ),
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const PremiumContentDialog();
                        },
                      );
                    }

                    // else {
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => const BrainGameScreen(),
                    //     ),
                    //   );
                    // }
                  },
                  title: "Neuro Spectrum",
                  subtitle: "The Cognitive Adventure",
                  containerColor: Colors.blue.shade300,
                  textColor: Colors.black,
                ),
                const SizedBox(
                  height: 15,
                ),
                buildGameCard(
                  imagePath: 'assets/images/neuropractice.png',
                  onTap: () {
                    if (planId == '1' || planId == '2') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NeuroHomeScreen(),
                        ),
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const PremiumContentDialog();
                        },
                      );
                    }
                  },
                  title: "Neuro Practice",
                  subtitle: "Boost Your Practice",
                  containerColor: Colors.blue.shade600,
                  textColor: Colors.white,
                ),
                const SizedBox(
                  height: 5,
                ),
                InkWell(
                  onTap: () => Fluttertoast.showToast(msg: 'Coming Soon'),
                  child: Image.asset('assets/images/md.png'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildGameCard({
    required String imagePath,
    required VoidCallback onTap,
    bool isPremium = false,
    String title = "",
    String subtitle = "",
    Color containerColor = Colors.white,
    Color textColor = Colors.black,
  }) {
    return InkWell(
      onTap: onTap,
      child: Center(
        child: Container(
          height: 110,
          width: MediaQuery.of(context).size.width * 0.95,
          decoration: BoxDecoration(
            color: containerColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "assets/images/play.png",
                        height: 20,
                        color: textColor,
                      ),
                      Text(
                        "  Start Playing",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: textColor,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: textColor,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Image.asset(imagePath),
              const SizedBox(width: 20),
            ],
          ),
        ),
      ),
    );
  }
}
