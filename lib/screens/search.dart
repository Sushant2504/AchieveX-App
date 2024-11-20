import 'package:achievex/provider/subscription_provider.dart';
import 'package:achievex/screens/notes/notenest_screen.dart';
import 'package:achievex/screens/question_bank/landing_page.dart';
import 'package:achievex/screens/schedule_timetable/schedule_screen.dart';
import 'package:achievex/screens/timetable_screen.dart';
import 'package:achievex/screens/tips_screen.dart';
import 'package:achievex/screens/widgets/premium_dialogue.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/colors.dart';
import 'demotivation_screen.dart';
import 'feelinglow_screen.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  Future<bool> showPremiumDialog(BuildContext context) async {
    final subscriptionProvider =
        Provider.of<SubscriptionProvider>(context, listen: false);
    // bool a = await subscriptionProvider.isFirst10Min;
    bool canAccess = subscriptionProvider.PLAN_ID == "0" ||
        subscriptionProvider.PLAN_ID == "3" ||
        subscriptionProvider.IS_PREMIUM!;
    // a;

    if (!canAccess) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return const PremiumContentDialog();
        },
      );
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return LayoutBuilder(builder: (context, constraints) {
      return Consumer<SubscriptionProvider>(
          builder: (context, subscription, child) {
        return SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    const Text(
                      'Your,',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Prompt-Bold',
                        fontSize: 22,
                        color: Colors.black,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Activities',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              // fontFamily: 'Prompt-Bold',
                              fontSize: 35,
                              color: AppColors.textNewColor),
                        ),
                        (Provider.of<SubscriptionProvider>(context,
                                        listen: false)
                                    .IS_PREMIUM! ==
                                true)
                            ? Container(
                                width: width * 0.3,
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
                                      height: 16,
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
                            : const SizedBox(),
                      ],
                    ),
                    Image.asset('assets/images/activities_screen.png'),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Categories',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Prompt-Bold',
                            fontSize: 24,
                            color: Colors.black)),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () => {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TimetableScreen(
                                        title: "Make a Timetable")),
                              )
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width / 2.3,
                              height: MediaQuery.of(context).size.width / 2.3,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: AppColors.makeTimeTableBoxColor),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Make A Timetable',
                                      style: TextStyle(
                                          color: AppColors.whiteColor,
                                          fontFamily: 'Prompt',
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Image.asset('assets/images/timetable.png'),
                                  ]),
                            ),
                          ),
                          InkWell(
                            onTap: () => {
                              showPremiumDialog(context).then((value) {
                                if (value) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => FeelinglowScreen(
                                            title: "Feeling low")),
                                  );
                                }
                              })
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width / 2.3,
                              height: MediaQuery.of(context).size.width / 2.3,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: AppColors.feelingLowBoxColor,
                              ),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Feeling Low',
                                      style: TextStyle(
                                          color: AppColors.whiteColor,
                                          fontFamily: 'Prompt',
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Image.asset(
                                        'assets/images/feeling_low.png'),
                                  ]),
                            ),
                          ),
                        ]),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () => {
                              showPremiumDialog(context).then((value) {
                                if (value) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DemotivationScreen(
                                                title: "Facing Demotivation")),
                                  );
                                }
                              }),
                            },
                            
                            child: Container(
                              width: MediaQuery.of(context).size.width / 2.3,
                              height: MediaQuery.of(context).size.width / 2.3,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: AppColors.demotivationBoxColor),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Facing Demotivation',
                                      style: TextStyle(
                                          color: AppColors.whiteColor,
                                          fontFamily: 'Prompt',
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Image.asset(
                                        'assets/images/demotivation.png'),
                                  ]),
                            ),
                          ),
                          InkWell(
                            onTap: () => {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        TipsScreen(title: "Tips & Tricks")),
                              )
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width / 2.3,
                              height: MediaQuery.of(context).size.width / 2.3,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: AppColors.tipsBoxColor),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Tips and Tricks',
                                      style: TextStyle(
                                          color: AppColors.whiteColor,
                                          fontFamily: 'Prompt',
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Image.asset(
                                      'assets/images/tips.png',
                                      height: 80,
                                    ),
                                  ]),
                            ),
                          ),
                        ]),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () => {
                            showPremiumDialog(context).then((value) {
                              if (value) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ScheduleScreen()),
                                );
                              }
                            })
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2.3,
                            height: MediaQuery.of(context).size.width / 2.3,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: const Color(0xFFA86CF5)),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Timetable In Action',
                                    style: TextStyle(
                                        color: AppColors.whiteColor,
                                        fontFamily: 'Prompt',
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Image.asset(
                                    'assets/icons/timetable-in-action.png',
                                    height: 80,
                                  ),
                                ]),
                          ),
                        ),
                        InkWell(
                          onTap: () => {
                            showPremiumDialog(context).then((value) {
                              if (value) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NotenestScreen(
                                            screenIndex: 0,
                                          )),
                                );
                              }
                            })
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2.3,
                            height: MediaQuery.of(context).size.width / 2.3,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: const Color(0xffFF70B4)),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    'NoteNest',
                                    style: TextStyle(
                                        color: AppColors.whiteColor,
                                        fontFamily: 'Prompt',
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Image.asset(
                                    'assets/images/notenest.png',
                                    height: 80,
                                  ),
                                ]),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () => {
                               
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2.3,
                            height: MediaQuery.of(context).size.width / 2.3,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color:
                                    const Color.fromARGB(255, 119, 230, 226)),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Explore the mindmaps',
                                    style: TextStyle(
                                        color: AppColors.whiteColor,
                                        fontFamily: 'Prompt',
                                        fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                  Image.asset(
                                    'assets/images/mindmap.png',
                                    height: 80,
                                  ),
                                ]),
                          ),
                        ),
                        InkWell(
                          onTap: () => {
                            showPremiumDialog(context).then((value) {
                              if (value) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LandingPage()),
                                );
                              }
                            })
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2.3,
                            height: MediaQuery.of(context).size.width / 2.3,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color:
                                    const Color.fromARGB(255, 243, 112, 232)),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Practice to be Sharp',
                                    style: TextStyle(
                                      color: AppColors.whiteColor,
                                      fontFamily: 'Prompt',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Image.asset(
                                    'assets/images/question.png',
                                    height: 80,
                                  ),
                                ]),
                          ),
                        ),
                      ],
                    )
                  ])),
        );
      });
    });
  }
}
