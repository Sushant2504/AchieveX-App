import 'dart:async';
import 'package:achievex/provider/home_provider.dart';
import 'package:achievex/provider/subscription_provider.dart';
import 'package:achievex/screens/games_screen.dart';
import 'package:achievex/screens/navigation.dart';
import 'package:achievex/screens/profile.dart';
import 'package:achievex/screens/quotes_data.dart';
import 'package:achievex/screens/search.dart';
import 'package:achievex/screens/widgets/premium_dialogue.dart';
import 'package:achievex/utils/app_constants.dart';
import 'package:achievex/utils/colors.dart';
import 'package:achievex/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:swipe_deck/swipe_deck.dart';
import 'package:animated_background/animated_background.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:achievex/screens/motivational_card.dart';
import 'package:swipe_cards/draggable_card.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:achievex/screens/widgets/flutter_tindercard_plus.dart';

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

  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
 
  List<SwipeItem> _swipeItems = <SwipeItem>[];
  MatchEngine? _matchEngine;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

   late CardController controller;

  // final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  //     FlutterLocalNotificationsPlugin();

  void _onRefresh() async {
    setState(() {
      // Update the widget's state to refresh it
    });

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
    _animationController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 0.9, end: 1.1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );
    _loadData();

    // for (int i = 0; i < quotes.length; i++) {
    //   _swipeItems.add(SwipeItem(
    //       // content: Content(text: quotes[i], color: _COlors.blue),
    //       likeAction: () {
    //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //           content: Text("Liked ${quotes[i]}"),
    //           duration: Duration(milliseconds: 500),
    //         ));
    //       },
    //       nopeAction: () {
    //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //           content: Text("Nope ${quotes[i]}"),
    //           duration: Duration(milliseconds: 500),
    //         ));
    //       },
    //       superlikeAction: () {
    //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //           content: Text("Superliked ${quotes[i]}"),
    //           duration: Duration(milliseconds: 500),
    //         ));
    //       },
    //       onSlideUpdate: (SlideRegion? region) async {
    //         print("Region $region");
    //       }));
    // }

    // _matchEngine = MatchEngine(swipeItems: _swipeItems);
    // super.initState();
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
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

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
                      // height: height,
                      // child: Column(
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
                                  // height: height,
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

                                // // SizedBox(height: 10.0),
                                // // //

                                const Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(left: 18.0, top: 20),
                                    child: Text('Motivational Quotes',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'Prompt-Bold',
                                            fontSize: 15,
                                            color: Colors.black)),
                                  ),
                                ),

                                // const SizedBox(height: 3.0),

                                Center(
                                  child: SizedBox(
                                    height: height * 0.55,
                                    child: TinderSwapCard(
                                      swipeUp: true,
                                      swipeDown: true,
                                      orientation: AmassOrientation.bottom,
                                      totalNum: quotes.length,
                                      stackNum: 3,
                                      swipeEdge: 4.0,
                                      maxWidth:
                                         width * 0.92,
                                      maxHeight:
                                          height * 0.55,
                                      minWidth:
                                         width * 0.80,
                                      minHeight:
                                          height * 0.40,
                                      cardBuilder: (context, index) => Card(
                                        child: Container(
                                      height: 420,
                                      width: 330,
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 92, 159, 245),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Center(
                                        child: Container(
                                          height: 400,
                                          width: 310,
                                          decoration: BoxDecoration(
                                            color: HexColor('#5C76FF'),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10.0),
                                                    child: Image.asset(
                                                        'assets/images/stars.png'),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 35.0,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 8.0,
                                                  right: 8.0,
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    quotes[index],
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily:
                                                          "Times New Roman",
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 35.0,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 10.0),
                                                    child: Image.asset(
                                                        'assets/images/stars.png'),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                            
                                      ),


                                      cardController: controller =
                                          CardController(),
                                      swipeUpdateCallback:
                                          (DragUpdateDetails details,
                                              Alignment align) {
                                        /// Get swiping card's alignment
                                        if (align.x < 0) {
                                          //Card is LEFT swiping
                                          print("right swipe");
                                        } else if (align.x > 0) {
                                          //Card is RIGHT swiping
                                          print("left swipe");
                                        }
                                      },
                                      swipeCompleteCallback:
                                          (CardSwipeOrientation orientation,
                                              int index) {
                                        /// Get orientation & index of swiped card!
                                      },
                                    ),
                                  ),
                                ),

                                // Swiper(
                                //   itemBuilder: (context, index) {
                                //     return Container(
                                //       height: 460,
                                //       width: 370,
                                //       decoration: BoxDecoration(
                                //         color: const Color.fromARGB(
                                //             255, 92, 159, 245),
                                //         borderRadius:
                                //             BorderRadius.circular(10.0),
                                //         boxShadow: [
                                //           BoxShadow(
                                //             color: Colors.grey.withOpacity(0.5),
                                //             spreadRadius: 7,
                                //             blurRadius: 3,
                                //             offset: Offset(0, 3),
                                //           ),
                                //         ],
                                //       ),
                                //       child: Center(
                                //         child: Container(
                                //           height: 440,
                                //           width: 350,
                                //           decoration: BoxDecoration(
                                //             color: HexColor('#5C76FF'),
                                //             borderRadius:
                                //                 BorderRadius.circular(10.0),
                                //           ),
                                //           child: Column(
                                //             mainAxisAlignment:
                                //                 MainAxisAlignment.center,
                                //             crossAxisAlignment:
                                //                 CrossAxisAlignment.center,
                                //             children: [
                                //               Row(
                                //                 mainAxisAlignment:
                                //                     MainAxisAlignment.start,
                                //                 crossAxisAlignment:
                                //                     CrossAxisAlignment.center,
                                //                 children: [
                                //                   Padding(
                                //                     padding:
                                //                         const EdgeInsets.only(
                                //                             left: 10.0),
                                //                     child: Image.asset(
                                //                         'assets/images/stars.png'),
                                //                   ),
                                //                 ],
                                //               ),
                                //               const SizedBox(
                                //                 height: 35.0,
                                //               ),
                                //               Padding(
                                //                 padding: const EdgeInsets.only(
                                //                   left: 8.0,
                                //                   right: 8.0,
                                //                 ),
                                //                 child: Center(
                                //                   child: Text(
                                //                     quotes[index],
                                //                     style: TextStyle(
                                //                       fontSize: 22,
                                //                       fontWeight:
                                //                           FontWeight.bold,
                                //                       fontFamily:
                                //                           "Times New Roman",
                                //                       color: Colors.white,
                                //                     ),
                                //                   ),
                                //                 ),
                                //               ),
                                //               const SizedBox(
                                //                 height: 35.0,
                                //               ),
                                //               Row(
                                //                 mainAxisAlignment:
                                //                     MainAxisAlignment.end,
                                //                 crossAxisAlignment:
                                //                     CrossAxisAlignment.center,
                                //                 children: [
                                //                   Padding(
                                //                     padding:
                                //                         const EdgeInsets.only(
                                //                             right: 10.0),
                                //                     child: Image.asset(
                                //                         'assets/images/stars.png'),
                                //                   ),
                                //                 ],
                                //               ),
                                //             ],
                                //           ),
                                //         ),
                                //       ),
                                //     );
                                //   },

                                //   itemCount: quotes.length,
                                //   itemWidth: 370.0,
                                //   itemHeight: 460.0,
                                //   // scrollDirection: Axis.vertical,
                                //   // pagination: const SwiperPaginati3on(
                                //   //     alignment: Alignment.centerRight),
                                //   // control: const SwiperControl(),
                                //   //  indicatorLayout: PageIndicatorLayout.COLOR,
                                //   layout: SwiperLayout.TINDER,
                                // ),

                                // SwipeCards(
                                //   matchEngine: _matchEngine!,
                                //   itemBuilder:
                                //       (BuildContext context, int index) {
                                //     return Container(
                                //       alignment: Alignment.center,
                                //       color: Colors.blue,
                                //       child: Text(
                                //         quotes[index],
                                //         style: TextStyle(fontSize: 100),
                                //       ),
                                //     );
                                //   },
                                //   onStackFinished: () {
                                //     ScaffoldMessenger.of(context)
                                //         .showSnackBar(SnackBar(
                                //       content: Text("Stack Finished"),
                                //       duration: Duration(milliseconds: 500),
                                //     ));
                                //   },
                                //   itemChanged: (SwipeItem item, int index) {
                                //     print(
                                //         "item: ${item.content.text}, index: $index");
                                //   },
                                //   leftSwipeAllowed: true,
                                //   rightSwipeAllowed: true,
                                //   upSwipeAllowed: true,
                                //   fillSpace: true,
                                // ),
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

  // void _launchYouTubeURL(String youtubeURL) async {
  //   if (await canLaunch(youtubeURL)) {
  //     await launch(youtubeURL);
  //   } else {
  //     throw 'Could not launch $youtubeURL';
  //   }
  // }

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
