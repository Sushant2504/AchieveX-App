import 'package:achievex/provider/home_provider.dart';
import 'package:achievex/provider/subscription_provider.dart';
import 'package:achievex/screens/play_course_screen.dart';
import 'package:achievex/screens/widgets/premium_dialogue.dart';
import 'package:achievex/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/colors.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({super.key});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

List<String> miniDescriptions = [
  'FINANCIAL MANAGEMENT-Master your Money in 7 Steps!  This beginner course unlocks budgeting, saving, investing & goal-setting. Enroll now & unlock financial freedom!',
  'COMMUNICATION SKILLS -Speak with confidence! This course unlocks powerful communication tools for clear speaking, active listening, and impactful presentations. Enroll now & become a master communicator!',
  'Conquer procrastination and smash distractions! This course equips you with powerful techniques to focus, manage time, and ace your goals. Learn to get things done effectively and unlock your peak productivity.',
  'TIME MANAGEMENT -Conquer your time!  This course teaches powerful strategies for prioritizing tasks, maximizing focus, and boosting productivity. Enroll now & get hours back in your day!',
  'Study smarter, not harder! This course unlocks the secrets to effective studying. Master active learning techniques, boost memory, and conquer exams.',
  '''Maximize your potential with revision and memory boosters":
     Unlock your full potential and achieve academic success with our comprehensive course!
     This course combines effective revision strategies with powerful memory techniques to help you retain information efficiently and excel in your exams.''',
  'AI COURSE-AI for Everyone! This beginner course unveils core AI concepts, applications, and ethical considerations. Master the basics of AI and its impact on our world. Enroll now & launch your AI journey!',
  'BRAIN COURSE-Unleash your brainpower!  This video course unlocks the science of your BRAIN, with memory hacks, healthy habits & brain-boosting exercises. Enroll now & maximize your potential!',
  'BRAIN TRAINING SESSION-Level up your focus, memory, and problem-solving skills. Strengthen your cognitive skills and unlock your academic potential with our science-backed brain training program-NEUROSPECTRUM- A Cognitive Adventure',
];

class _CourseScreenState extends State<CourseScreen> {
  String selectedTitle = '';
  bool _isOtherContentVisible = false;
  String selectedImage = ''; // Declare this variable
  SubscriptionProvider? subscriptionProvider;
  // bool? isFirstTime;
  int? selectedContainerIndex;
  String selectedDescription = '';
  String miniDescription = '';
  String vlink = "";
  int index = 0;
  String? planId;

  @override
  void initState() {
    super.initState();
    planId = Provider.of<SubscriptionProvider>(context, listen: false).PLAN_ID;
    subscriptionProvider =
        Provider.of<SubscriptionProvider>(context, listen: false);
    // _loadData();
  }

  // bool showPremiumDialog() {
  //   final subscriptionProvider =
  //       Provider.of<SubscriptionProvider>(context, listen: false);

  //   print('subscriptionProvider.PLAN_ID : ${subscriptionProvider.PLAN_ID}');
  //   bool canAccess = subscriptionProvider.PLAN_ID != "2" ||
  //       subscriptionProvider.PLAN_ID != "3";

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

  // void _loadData() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   // isFirstTime = prefs.getBool('isFirstTime');
  //   // print('isFirstTime----> $isFirstTime');
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Text(
              'Courses',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                AnimatedOpacity(
                  opacity: _isOtherContentVisible ? 0.0 : 1.0,
                  duration: const Duration(milliseconds: 500),
                  child: buildContent(),
                ),
                IgnorePointer(
                  ignoring: !_isOtherContentVisible,
                  child: AnimatedOpacity(
                    opacity: _isOtherContentVisible ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: buildOtherContent(
                      selectedTitle,
                      selectedImage,
                      selectedDescription,
                      vlink,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }

  Widget buildContent() {
    return Consumer<HomeProvider>(
      builder: (context, homeProvider, child) {
        return homeProvider.isLoading || homeProvider.homeModel!.courses == null
            ? const Center(
                child: CircularProgressIndicator(
                  color: AppColors.whiteColor,
                ),
              )
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  childAspectRatio: 0.9,
                  crossAxisCount: 2,
                ),
                itemCount: homeProvider.homeModel!.courses!.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () async => {
                      setState(
                        () {
                          selectedTitle = homeProvider
                              .homeModel!.courses![index].title
                              .toString();
                          selectedImage =
                              '${AppConstants.baseUrl}/storage/app/public/course/thumbanail/${homeProvider.homeModel!.courses![index].thumbanail.toString()}';
                          selectedDescription = homeProvider
                              .homeModel!.courses![index].description
                              .toString();
                          vlink = homeProvider
                              .homeModel!.courses![index].filename
                              .toString();

                          if (homeProvider
                                      .homeModel!.courses![index].id ==
                                  15 ||
                              homeProvider.homeModel!.courses![index].id ==
                                  13 ||
                              (planId == "2") ||
                              (planId == "1" &&
                                  [5, 6, 7, 8, 15, 13].contains(homeProvider
                                      .homeModel!.courses![index].id))) {
                            _isOtherContentVisible = !_isOtherContentVisible;
                            if (homeProvider.homeModel!.courses![index].id ==
                                3) {
                              miniDescription = miniDescriptions[0];
                            } else if (homeProvider
                                    .homeModel!.courses![index].id ==
                                4) {
                              miniDescription = miniDescriptions[1];
                            } else if (homeProvider
                                    .homeModel!.courses![index].id ==
                                5) {
                              miniDescription = miniDescriptions[2];
                            } else if (homeProvider
                                    .homeModel!.courses![index].id ==
                                6) {
                              miniDescription = miniDescriptions[3];
                            } else if (homeProvider
                                    .homeModel!.courses![index].id ==
                                7) {
                              miniDescription = miniDescriptions[4];
                            } else if (homeProvider
                                    .homeModel!.courses![index].id ==
                                8) {
                              miniDescription = miniDescriptions[5];
                            } else if (homeProvider
                                    .homeModel!.courses![index].id ==
                                9) {
                              miniDescription = miniDescriptions[6];
                            } else if (homeProvider
                                    .homeModel!.courses![index].id ==
                                15) {
                              miniDescription = miniDescriptions[7];
                            } else if (homeProvider
                                    .homeModel!.courses![index].id ==
                                13) {
                              miniDescription = miniDescriptions[8];
                            }
                          } else {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const PremiumContentDialog();
                              },
                            );
                          }

                          // selectedTitle = homeProvider
                          //     .homeModel!.courses![index].title
                          //     .toString();

                          // 1 - 89 ,2 - 249, 3 - 599

                          // selectedImage =
                          //     '${AppConstants.baseUrl}/storage/app/public/course/thumbanail/${homeProvider.homeModel!.courses![index].thumbanail.toString()}';
                          // selectedDescription = homeProvider
                          //     .homeModel!.courses![index].description
                          //     .toString();
                          // vlink = homeProvider
                          //     .homeModel!.courses![index].filename
                          //     .toString();
                          // if (subscriptionProvider!.PLAN_ID == "1" &&
                          //         homeProvider
                          //                 .homeModel!.courses![index].id ==
                          //             1 ||
                          //     homeProvider.homeModel!.courses![index].id ==
                          //         2 ||
                          //     homeProvider.homeModel!.courses![index].id ==
                          //         3 ||
                          //     homeProvider.homeModel!.courses![index].id ==
                          //         4) {
                          //   _isOtherContentVisible = !_isOtherContentVisible;
                          // } else if (subscriptionProvider!.PLAN_ID == "3" ||
                          //     subscriptionProvider!.PLAN_ID == "2") {
                          //   _isOtherContentVisible = !_isOtherContentVisible;
                          // } else {
                          //   showDialog(
                          //     context: context,
                          //     builder: (BuildContext context) {
                          //       return const PremiumContentDialog();
                          //     },
                          //   );
                          // }
                        },
                      )
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: const Offset(1, 1),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(6),
                                  child: Image.network(
                                    width: 150,
                                    height: 80,
                                    '${AppConstants.baseUrl}/storage/app/public/course/thumbanail/${homeProvider.homeModel!.courses![index].thumbanail.toString()}',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    homeProvider
                                        .homeModel!.courses![index].title
                                        .toString(),
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 3,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
      },
    );
  }

  Widget buildOtherContent(
    String selectedTitle,
    String selectedImage,
    String selectedDescription,
    String selectedLink,
  ) {
    return Consumer<HomeProvider>(
      builder: (context, homeProvider, child) {
        return homeProvider.isLoading || homeProvider.homeModel!.courses == null
            ? const Center(
                child: CircularProgressIndicator(
                  color: AppColors.whiteColor,
                ),
              )
            : WillPopScope(
                onWillPop: () async {
                  if (homeProvider.homeModel!.courses![index].id == 14 ||
                      homeProvider.homeModel!.courses![index].id == 13 ||
                      (planId == "2") ||
                      (planId == "3" &&
                          [5, 6, 7, 8, 15, 13].contains(
                              homeProvider.homeModel!.courses![index].id))) {
                    _isOtherContentVisible = !_isOtherContentVisible;
                    if (homeProvider.homeModel!.courses![index].id == 3) {
                      miniDescription = miniDescriptions[0];
                    } else if (homeProvider.homeModel!.courses![index].id ==
                        4) {
                      miniDescription = miniDescriptions[1];
                    } else if (homeProvider.homeModel!.courses![index].id ==
                        5) {
                      miniDescription = miniDescriptions[2];
                    } else if (homeProvider.homeModel!.courses![index].id ==
                        6) {
                      miniDescription = miniDescriptions[3];
                    } else if (homeProvider.homeModel!.courses![index].id ==
                        7) {
                      miniDescription = miniDescriptions[4];
                    } else if (homeProvider.homeModel!.courses![index].id ==
                        8) {
                      miniDescription = miniDescriptions[5];
                    } else if (homeProvider.homeModel!.courses![index].id ==
                        9) {
                      miniDescription = miniDescriptions[6];
                    } else if (homeProvider.homeModel!.courses![index].id ==
                        15) {
                      miniDescription = miniDescriptions[7];
                    } else if (homeProvider.homeModel!.courses![index].id ==
                        13) {
                      miniDescription = miniDescriptions[8];
                    }
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const PremiumContentDialog();
                      },
                    );
                  }
                  return true;
                },
                child: Consumer<SubscriptionProvider>(
                  builder: (context, subp, child) {
                    return Consumer<HomeProvider>(
                      builder: (context, homeProvider, child) {
                        List<String> remainingTitles = homeProvider
                            .homeModel!.courses!
                            .map((course) => course.title.toString())
                            .where((title) => title != selectedTitle)
                            .toList();
                        List<String> remainingImages = homeProvider
                            .homeModel!.courses!
                            .map((course) =>
                                '${AppConstants.baseUrl}/storage/app/public/course/thumbanail/${course.thumbanail.toString()}')
                            .where((image) => image != selectedImage)
                            .toList();

                        return homeProvider.isLoading ||
                                homeProvider.homeModel!.courses == null
                            ? const Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.whiteColor,
                                ),
                              )
                            : SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 10),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(6),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 1,
                                            blurRadius: 5,
                                            offset: const Offset(1, 1),
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                  child:
                                                      selectedImage.isNotEmpty
                                                          ? Image.network(
                                                              selectedImage,
                                                              fit: BoxFit.cover,
                                                            )
                                                          : Image.asset(
                                                              'assets/images/king.png',
                                                              fit: BoxFit.cover,
                                                            ),
                                                ),
                                                Positioned(
                                                  child: IconButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .push(
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              PlayCourseScreen(
                                                            title:
                                                                selectedTitle,
                                                            description:
                                                                selectedDescription,
                                                            vLink: selectedLink,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    style: ButtonStyle(
                                                      backgroundColor:
                                                          WidgetStateProperty
                                                              .all<Color>(
                                                        AppColors.accentColor,
                                                      ),
                                                    ),
                                                    icon: const Icon(
                                                      Icons.play_arrow,
                                                      color:
                                                          AppColors.whiteColor,
                                                      size: 30,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              selectedTitle,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            const Text(
                                              "By AchieveX",
                                              style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              miniDescription,
                                              style: const TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        PlayCourseScreen(
                                                      title: selectedTitle,
                                                      description:
                                                          selectedDescription,
                                                      vLink: selectedLink,
                                                    ),
                                                  ),
                                                );
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    const Color(0xff446EDB),
                                                elevation: 0,
                                                padding: const EdgeInsets.only(
                                                  left: 20,
                                                  right: 20,
                                                ),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    5.0,
                                                  ),
                                                ),
                                              ),
                                              child: const Text(
                                                "Play Now",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 6.0,
                                        right: 6.0,
                                      ),
                                      child: SizedBox(
                                        height: 170, // Specify the height here
                                        child: ListView(
                                          scrollDirection: Axis.horizontal,
                                          children: remainingTitles.map(
                                            (title) {
                                              int index = remainingTitles
                                                  .indexOf(title);
                                              String image =
                                                  remainingImages[index];
                                              return InkWell(
                                                onTap: () {
                                                  if (homeProvider
                                                              .homeModel!
                                                              .courses![index]
                                                              .id ==
                                                          15 ||
                                                      homeProvider
                                                              .homeModel!
                                                              .courses![index]
                                                              .id ==
                                                          13 ||
                                                      (planId == "2") ||
                                                      (planId == "1" &&
                                                          [
                                                            5,
                                                            6,
                                                            7,
                                                            8,
                                                            15,
                                                            13
                                                          ].contains(
                                                              homeProvider
                                                                  .homeModel!
                                                                  .courses![
                                                                      index]
                                                                  .id))) {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) => PlayCourseScreen(
                                                            title:
                                                                remainingTitles[
                                                                    index],
                                                            description:
                                                                homeProvider
                                                                    .homeModel!
                                                                    .courses![
                                                                        index +
                                                                            1]
                                                                    .description
                                                                    .toString(),
                                                            vLink: homeProvider
                                                                .homeModel!
                                                                .courses![
                                                                    index + 1]
                                                                .filename
                                                                .toString()),
                                                      ),
                                                    );
                                                  } else if (subscriptionProvider
                                                          ?.PLAN_ID ==
                                                      "2") {
                                                    // Navigator.push(
                                                    //   context,
                                                    //   MaterialPageRoute(
                                                    //     builder: (context) =>
                                                    //         PlayCourseScreen(
                                                    //       title:
                                                    //           remainingTitles[
                                                    //               index],
                                                    //       // description:,
                                                    //       // vLink: epi,
                                                    //     ),
                                                    //   ),
                                                    // );
                                                  } else {
                                                    showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return const PremiumContentDialog();
                                                      },
                                                    );
                                                  }
                                                },
                                                child: Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 3),
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                      vertical: 15,
                                                      horizontal: 5,
                                                    ),
                                                    child: Container(
                                                      height: 100,
                                                      width: 150,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(6),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.5),
                                                            spreadRadius: 1,
                                                            blurRadius: 5,
                                                            offset:
                                                                const Offset(
                                                              1,
                                                              1,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                6,
                                                              ),
                                                              child:
                                                                  Image.network(
                                                                image,
                                                                height: 80,
                                                                width: 150,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              height: 10,
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                left: 8.0,
                                                              ),
                                                              child: Text(
                                                                title,
                                                                style:
                                                                    const TextStyle(
                                                                  fontSize: 8,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                                maxLines: 3,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ).toList(),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                      },
                    );
                  },
                ),
              );
      },
    );
  }
}
