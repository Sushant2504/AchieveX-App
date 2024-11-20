import 'dart:async';

import 'package:achievex/provider/home_provider.dart';
import 'package:achievex/provider/subscription_provider.dart';
import 'package:achievex/screens/games_screen.dart';
import 'package:achievex/screens/navigation.dart';
import 'package:achievex/screens/profile.dart';
import 'package:achievex/screens/search.dart';
import 'package:achievex/screens/widgets/premium_dialogue.dart';
import 'package:achievex/utils/app_constants.dart';
import 'package:achievex/utils/colors.dart';
import 'package:achievex/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const Page1(),
    const Search(),
    const Navigation(),
    const GamesScreen(),
    Profile(),
  ];

  bool? isFirstTime;
  bool? isPremium;
  String? planId;

  @override
  void initState() {
    super.initState();

    Provider.of<SubscriptionProvider>(context, listen: false)
        .checkSubscription(context);
    check();
  }

  check() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isFirstTime = prefs.getBool('isFirstTime');

    planId = Provider.of<SubscriptionProvider>(context, listen: false).PLAN_ID;
    // Provider.of<HomeProvider>(context, listen: false).initializePreferences();
    isPremium =
        Provider.of<SubscriptionProvider>(context, listen: false).IS_PREMIUM!;
    print('planId----> $planId');
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SubscriptionProvider>(
      builder: (context, subscriptionProvider, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          bottomNavigationBar: BottomNavigationBar(
            showSelectedLabels: false, // Hide selected label
            showUnselectedLabels: false,
            selectedItemColor: AppColors.accentColor,
            selectedIconTheme:
                const IconThemeData(color: AppColors.accentColor),
            currentIndex: _currentIndex,
            onTap: (index) {
              // print('$index-----------$isPremium $planId');
              if (index == 2) {
                // if (subscriptionProvider.PLAN_ID == "0" ||
                //     subscriptionProvider.PLAN_ID == "3") {
                //   // Lock the second tab and show a dialog
                setState(() {
                  _currentIndex = 2;
                });
                // } else {
                //   showDialog(
                //     context: context,
                //     builder: (BuildContext context) {
                //       return const PremiumContentDialog();
                //     },
                //   );
                //   // Switch to the second tab
                // }
              } else {
                // Switch to the selected tab (other than the second tab)
                setState(() {
                  _currentIndex = index;
                });
              }
            },
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                activeIcon: Image.asset(
                  'assets/images/home.png',
                  height: 22,
                  color: Colors.blue,
                ),
                icon: Image.asset(
                  'assets/images/home.png',
                  height: 22,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                activeIcon: Container(
                  padding: const EdgeInsets.only(top: 5),
                  child: Image.asset(
                    'assets/images/menu.png',
                    height: 25,
                    color: Colors.blue,
                  ),
                ),
                icon: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Image.asset(
                    'assets/images/menu.png',
                    height: 25,
                  ),
                ),
                label: '',
              ),
              const BottomNavigationBarItem(
                backgroundColor: Colors.white,
                activeIcon: Icon(
                  Icons.menu_book,
                  color: Colors.blue,
                  size: 30,
                ),
                icon: Icon(
                  Icons.menu_book,
                  size: 30,
                  color: Colors.black,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                activeIcon: Container(
                  child: Image.asset(
                    'assets/icons/brain_game.png',
                    height: 30,
                    color: Colors.blue,
                  ),
                ),
                icon: Image.asset(
                  'assets/icons/brain_game.png',
                  height: 30,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                activeIcon: Container(
                  child: Image.asset(
                    'assets/images/profile.png',
                    height: 30,
                    color: Colors.blue,
                  ),
                ),
                icon: Image.asset(
                  'assets/images/profile.png',
                  height: 30,
                ),
                label: '',
              ),
            ],
          ),
          body: Stack(
            children: [
              _pages[_currentIndex],

              // return Container();

              // _pages[_currentIndex],
            ],
          ),
        );
      },
    );
  }
}

class Page1 extends StatefulWidget {
  const Page1({super.key});
  @override
  State<Page1> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Page1> with TickerProviderStateMixin {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  // final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  //     FlutterLocalNotificationsPlugin();
  void _onRefresh() async {
    setState(() {
      // Update the widget's state to refresh it
    });
    // final pf =
    //     Provider.of<HomeProvider>(context, listen: false).getHomeData(context);

    // monitor network fetch
    await Future.delayed(const Duration(milliseconds: 5000));

    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  bool? isFirstTime;
  SubscriptionProvider? subscription;

  @override
  void initState() {
    super.initState();

    _loadData();
  }

  bool showPremiumDialog() {
    final subscriptionProvider =
        Provider.of<SubscriptionProvider>(context, listen: false);
    bool canAccess = subscriptionProvider.PLAN_ID != "2" ||
        subscriptionProvider.PLAN_ID != "3";

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

  void _loadData() async {
    Provider.of<HomeProvider>(context, listen: false).getHomeData(context);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Provider.of<SubscriptionProvider>(context, listen: false)
        .checkSubscription(context);

    subscription = Provider.of<SubscriptionProvider>(context, listen: false);
    isFirstTime = prefs.getBool('isFirstTime');
    print('isFirstTime----> $isFirstTime');
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homedata, child) {
        return homedata.refreshLimitEnd == true
            ? AlertDialog(
                title: const Text('Warning'),
                content: const Text('Your daily refresh limit is finished'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('OK'),
                  ),
                ],
              )
            : homedata.isLoading || homedata.homeModel == null
                ? const Center(
                    child: CircularProgressIndicator(
                    color: AppColors.accentColor,
                  ))
                : SmartRefresher(
                    controller: _refreshController,
                    enablePullDown: true,
                    enablePullUp: false,
                    onRefresh: _onRefresh,
                    child: Wrap(
                      children: [
                        Stack(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // Text(homedata.countdown.toString()),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 18.0, left: 18),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 50,
                                          ),
                                          Text(
                                            'Hey,',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'Prompt-Bold',
                                              fontSize: 22,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            'Achiever',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              // fontFamily: 'Prompt-Bold',
                                              fontSize: 38,
                                              color: AppColors.textNewColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                      InkWell(
                                        onTap: () async => {
                                          Navigator.pushNamed(context,
                                              RoutesName.notificationScreen),
                                        },
                                        child: const Center(
                                            child: Icon(
                                          Icons.notifications,
                                          size: 30,
                                          color: AppColors.accentColor,
                                        )),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.only(
                                      top: 15, right: 15, left: 15),
                                  decoration: BoxDecoration(
                                      color: AppColors.primaryColor,
                                      borderRadius: BorderRadius.circular(13)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      (homedata.homeModel!.defaultQuote!.quote
                                                  .toString() !=
                                              '')
                                          ? homedata
                                              .homeModel!.defaultQuote!.quote
                                              .toString()
                                          : homedata.defaultQuote.toString(),
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          color: AppColors.whitebackgroundColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                // Align(
                                //   alignment: Alignment.topLeft,
                                //   child: Padding(
                                //     padding: const EdgeInsets.only(left: 18.0),
                                //     child: Row(
                                //       children: [
                                //         const Text('Courses & More',
                                //             textAlign: TextAlign.left,
                                //             style: TextStyle(
                                //                 fontWeight: FontWeight.w600,
                                //                 fontFamily: 'Prompt-Bold',
                                //                 fontSize: 15,
                                //                 color: Colors.black)),
                                //         const Spacer(),
                                //         InkWell(
                                //           onTap: () => {
                                //             if (showPremiumDialog())
                                //               {
                                //                 Navigator.of(context).push(
                                //                   MaterialPageRoute(
                                //                     builder: (context) =>
                                //                         const Navigation(),
                                //                   ),
                                //                 ),
                                //               }

                                //             // Navigator.pushNamed(
                                //             //     context, RoutesName.courseScreen),
                                //           },
                                //           child: const Text('View all',
                                //               textAlign: TextAlign.left,
                                //               style: TextStyle(
                                //                   fontWeight: FontWeight.w600,
                                //                   fontFamily: 'Prompt-Bold',
                                //                   fontSize: 15,
                                //                   color: Colors.blue)),
                                //         ),
                                //         const SizedBox(
                                //           width: 20,
                                //         ),
                                //       ],
                                //     ),
                                //   ),
                                // ),
                                // // SingleChildScrollView(
                                //   scrollDirection: Axis.horizontal,
                                //   child:

                                // Container(
                                //   height: 200,
                                //   padding: const EdgeInsets.only(
                                //       left: 10.0, right: 10),
                                //   child: ListView.builder(
                                //       scrollDirection: Axis.horizontal,
                                //       itemCount: (homedata
                                //                   .homeModel!.courses!.length <
                                //               3)
                                //           ? homedata.homeModel!.courses!.length
                                //           : 3,
                                //       itemBuilder: (context, index) {
                                //         return InkWell(
                                //           onTap: () async => {
                                //             print(
                                //                 "------->${subscription!.PLAN_ID}"),
                                //             if (subscription!.PLAN_ID == "1" &&
                                //                     homedata
                                //                             .homeModel!
                                //                             .courses![index]
                                //                             .id ==
                                //                         5 ||
                                //                 homedata.homeModel!
                                //                         .courses![index].id ==
                                //                     6 ||
                                //                 homedata.homeModel!
                                //                         .courses![index].id ==
                                //                     7 ||
                                //                 homedata.homeModel!
                                //                         .courses![index].id ==
                                //                     8)
                                //               {
                                //                 Navigator.of(context).push(
                                //                     MaterialPageRoute(
                                //                         builder: (context) =>
                                //                             PlayCourseScreen(
                                //                                 title: homedata
                                //                                     .homeModel!
                                //                                     .courses![
                                //                                         index]
                                //                                     .title
                                //                                     .toString(),
                                //                                 description: homedata
                                //                                     .homeModel!
                                //                                     .courses![
                                //                                         index]
                                //                                     .description
                                //                                     .toString(),
                                //                                 vLink: homedata
                                //                                     .homeModel!
                                //                                     .courses![
                                //                                         index]
                                //                                     .filename
                                //                                     .toString()))),
                                //               }
                                //             else if (subscription!.PLAN_ID ==
                                //                     "3" ||
                                //                 subscription!.PLAN_ID == "2")
                                //               {
                                //                 Navigator.of(context).push(
                                //                     MaterialPageRoute(
                                //                         builder: (context) =>
                                //                             PlayCourseScreen(
                                //                                 title: homedata
                                //                                     .homeModel!
                                //                                     .courses![
                                //                                         index]
                                //                                     .title
                                //                                     .toString(),
                                //                                 description: homedata
                                //                                     .homeModel!
                                //                                     .courses![
                                //                                         index]
                                //                                     .description
                                //                                     .toString(),
                                //                                 vLink: homedata
                                //                                     .homeModel!
                                //                                     .courses![
                                //                                         index]
                                //                                     .filename
                                //                                     .toString()))),
                                //               }
                                //             else
                                //               {
                                //                 showDialog(
                                //                   context: context,
                                //                   builder:
                                //                       (BuildContext context) {
                                //                     return const PremiumContentDialog();
                                //                   },
                                //                 ),
                                //               }
                                //             // MaterialPageRoute(builder:  )
                                //             //  Navigator.pushNamed(context, PlayCourseScreen(title: title, description: description, vLink: vLink) ),
                                //           },
                                //           child: Padding(
                                //             padding: const EdgeInsets.symmetric(
                                //                 horizontal: 3.0),
                                //             child: SizedBox(
                                //               width: 150,
                                //               height: 150,
                                //               child: Card(
                                //                 elevation: 2,
                                //                 child: Column(
                                //                   children: [
                                //                     ClipRRect(
                                //                       borderRadius:
                                //                           BorderRadius.circular(
                                //                               12),
                                //                       child: Image.network(
                                //                         height: 100,
                                //                         '${AppConstants.baseUrl}/storage/app/public/course/thumbanail/${homedata.homeModel!.courses![index].thumbanail.toString()}',
                                //                         fit: BoxFit.contain,
                                //                       ),
                                //                     ),
                                //                     const Spacer(),
                                //                     Padding(
                                //                       padding:
                                //                           const EdgeInsets.only(
                                //                               left: 8.0,
                                //                               right: 0),
                                //                       child: Text(
                                //                         homedata
                                //                             .homeModel!
                                //                             .courses![index]
                                //                             .title
                                //                             .toString(),
                                //                         maxLines: 2,
                                //                       ),
                                //                     ),
                                //                     const Padding(
                                //                       padding: EdgeInsets.only(
                                //                           left: 8.0,
                                //                           top: 8,
                                //                           bottom: 14),
                                //                       child: Align(
                                //                           alignment: Alignment
                                //                               .centerLeft,
                                //                           child: Text(
                                //                             'By AchieveX',
                                //                             textAlign:
                                //                                 TextAlign.start,
                                //                             style: TextStyle(
                                //                                 fontSize: 10,
                                //                                 color: Colors
                                //                                     .blue),
                                //                           )),
                                //                     )
                                //                   ],
                                //                 ),
                                //               ),
                                //             ),
                                //           ),
                                //         );

                                //         // InkWell(
                                //         //   onTap: () async => {
                                //         //     Navigator.of(context).push(
                                //         //         MaterialPageRoute(
                                //         //             builder: (context) =>
                                //         //                 PlayCourseScreen(
                                //         //                     title: homedata.homeModel!
                                //         //                         .courses![index].title
                                //         //                         .toString(),
                                //         //                     description: homedata
                                //         //                         .homeModel!
                                //         //                         .courses![index]
                                //         //                         .description
                                //         //                         .toString(),
                                //         //                     vLink: homedata
                                //         //                         .homeModel!
                                //         //                         .courses![index]
                                //         //                         .filename
                                //         //                         .toString()))),
                                //         //     // MaterialPageRoute(builder:  )
                                //         //     //  Navigator.pushNamed(context, PlayCourseScreen(title: title, description: description, vLink: vLink) ),
                                //         //   },
                                //         //   child: Container(
                                //         //     margin: const EdgeInsets.all(6),
                                //         //     height: 100,
                                //         //     width: 150,
                                //         //     decoration: BoxDecoration(
                                //         //         color: Colors.grey.withOpacity(0.4),
                                //         //         borderRadius:
                                //         //             BorderRadius.circular(12)),
                                //         //     //'https://achievex.swiftsoftix.com/storage/app/public/course/videos/'
                                //         //     child: Image.network(
                                //         //       '${AppConstants.baseUrl}/storage/app/public/course/thumbanail/${homedata.homeModel!.courses![index].thumbanail.toString()}',
                                //         //       fit: BoxFit.cover,
                                //         //     ),
                                //         //   ),
                                //         // );
                                //       }),
                                // ),
                                // // ),

                                const Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(left: 18.0, top: 20),
                                    child: Text('Bonus videos',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'Prompt-Bold',
                                            fontSize: 15,
                                            color: Colors.black)),
                                  ),
                                ),
                                // VideoPostCard(post: homedata.homeModel!.posts![0]),
                                // VideoPostCard(post: homedata.homeModel!.posts![1]),

                                // SizedBox(
                                //   height: 800,
                                //   child: ListView.builder(
                                //     scrollDirection: Axis.vertical,

                                //     itemCount: homedata.homeModel!.posts!.length ,
                                //      itemBuilder: (context, index){
                                //     return

                                for (int i = 0; i <= 3; i++)
                                  InkWell(
                                    onTap: () => {
                                      _launchYouTubeURL(homedata
                                          .homeModel!.posts![i].source
                                          .toString())
                                    },
                                    child: Card(
                                      margin: const EdgeInsets.all(10),
                                      child: Image.network(getYouTubeThumbnail(
                                              homedata
                                                  .homeModel!.posts![i].source
                                                  .toString()) ??
                                          ''),
                                    ),
                                  )

                                //   ),
                                // ),
                                // InkWell(
                                //   onTap: () => {
                                //     _launchYouTubeURL(homedata
                                //         .homeModel!.posts![5].source
                                //         .toString())
                                //   },
                                //   child: Card(
                                //     margin: const EdgeInsets.all(10),
                                //     child: Image.network(extractVideoIdFromUrl(
                                //         homedata.homeModel!.posts![5].source
                                //             .toString())),
                                //   ),
                                // ),
                                // InkWell(
                                //   onTap: () => {
                                //     _launchYouTubeURL(homedata
                                //         .homeModel!.posts![6].source
                                //         .toString())
                                //   },
                                //   child: Card(
                                //     margin: const EdgeInsets.all(10),
                                //     child: Image.network(extractVideoIdFromUrl(
                                //         homedata.homeModel!.posts![6].source
                                //             .toString())),
                                //   ),
                                // ),
                                // InkWell(
                                //   onTap: () => {
                                //     _launchYouTubeURL(homedata
                                //         .homeModel!.posts![7].source
                                //         .toString())
                                //   },
                                //   child: Card(
                                //     margin: const EdgeInsets.all(10),
                                //     child: Image.network(extractVideoIdFromUrl(
                                //         homedata.homeModel!.posts![7].source
                                //             .toString())),
                                //   ),
                                // ),
                                // VideoPostCard(post: homedata.homeModel!.posts![3]),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
      },
    );
  }

  void _launchYouTubeURL(String youtubeURL) async {
    if (await canLaunch(youtubeURL)) {
      await launch(youtubeURL);
    } else {
      throw 'Could not launch $youtubeURL';
    }
  }

  String? extractVideoId(String videoUrl) {
    RegExp regExp = RegExp(
        r"^(?:https?:\/\/)?(?:www\.)?(?:youtube\.com\/(?:[^\/\n\s]+\/\S+\/|(?:v|e(?:mbed)?)\/|\S*?[?&]v=)|youtu\.be\/)([a-zA-Z0-9_-]{11})",
        caseSensitive: false);
    RegExpMatch? match = regExp.firstMatch(videoUrl);
    if (match != null && match.groupCount >= 1) {
      return match.group(1);
    }
    return null;
  }

  String? getYouTubeThumbnail(String? videoUrl) {
    String? videoId = extractVideoId(videoUrl!);
    if (videoId != null) {
      return 'https://img.youtube.com/vi/$videoId/0.jpg';
    }
    return null;
  }

  void _showWarningDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Warning'),
          content: const Text('This is a warning message.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

String getFilePath(String type) {
  if (type == '1') {
    //  for ca
    return AppConstants.homepageMotivation;
  } else if (type == '2') {
    // for jee
    return AppConstants.homepageInformative;
  } else if (type == '3') {
    // for neet
    return AppConstants.homepageJokes;
  } else {
    return AppConstants.homepageQuotes;
  }
}

String extractVideoIdFromUrl(String url) {
  Uri uri = Uri.parse(url);

  if (uri.host == "youtu.be" && uri.pathSegments.isNotEmpty) {
    return 'https://img.youtube.com/vi/${uri.pathSegments.first}/0.jpg';
  }

  return "";
}
