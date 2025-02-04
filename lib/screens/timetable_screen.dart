import 'package:achievex/provider/subscription_provider.dart';
import 'package:achievex/provider/timetable_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/colors.dart';



class TimetableScreen extends StatefulWidget {
  TimetableScreen({super.key, required this.title});
  String title;
  @override
  State<TimetableScreen> createState() => _TimetableScreenState();
}

class _TimetableScreenState extends State<TimetableScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late SubscriptionProvider subscriptionProvider;
  bool showAds = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _loadData();

    subscriptionProvider =
        Provider.of<SubscriptionProvider>(context, listen: false);

    subscriptionProvider =
        Provider.of<SubscriptionProvider>(context, listen: false);

    // subscriptionProvider.isFirst10Min.then((value) {
    //   // setState(() {
    //   //   showAds = !value;
    //   // });
    //   // if (!value) loadInterstitial();
    // });
  }

  // Future<void> loadInterstitial() async {
  //   interstitialAd = AdmobInterstitial(
  //     adUnitId: getInterstitialAdUnitId()!,
  //     listener: (AdmobAdEvent event, Map<String, dynamic>? args) {
  //       if (event == AdmobAdEvent.closed) interstitialAd.load();

  //       AdmobAds().handleEvent(event, args, 'Interstitial');
  //     },
  //   );

  //   interstitialAd.load();
  // }

  @override
  void dispose() {
    // interstitialAd.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _loadData() async {
    Provider.of<TimetableProvider>(context, listen: false).getTimeTable();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // final value = await subscriptionProvider.isFirst10Min;
        // if (!value) interstitialAd.show();
        return true;
      },
      child: Scaffold(
          body: Consumer<TimetableProvider>(builder: (context, appdata, child) {
        if (appdata.isLoading || appdata.timetableList == null) {
          return const Center(
              child: CircularProgressIndicator(
            color: AppColors.accentColor,
          ));
        } else {
          return Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20),
                child: Stack(
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
                            color: AppColors.textNewColor),
                      ),
                    ),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Image.asset(
                          'assets/images/timet.png',
                          height: 110,
                        )),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.greyColor)),
                  margin: const EdgeInsets.only(top: 20, right: 18, left: 18),
                  height: 600,
                  child: ListView.builder(
                      itemCount: appdata.timetableList!.length,
                      itemBuilder: (context, index) {
                        Provider.of<TimetableProvider>(context, listen: false)
                            .saveLastTimetableId(
                                appdata.timetableList!.first.id.toString());

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(appdata.timetableList![index].content
                                  .toString()),
                              const Divider(),
                            ],
                          ),
                        );
                      }),
                ),
              ),
              // (showAds)
              //     ? Align(
              //         alignment: Alignment.bottomCenter,
              //         child: AdmobBanner(
              //           adUnitId: getBannerAdUnitId()!,
              //           adSize: AdmobBannerSize.BANNER,
              //           listener:
              //               (AdmobAdEvent event, Map<String, dynamic>? args) {
              //             AdmobAds().handleEvent(event, args, 'Banner');
              //           },
              //           onBannerCreated: (AdmobBannerController controller) {
              //             // Normally you don't need to worry about disposing this yourself, it's handled.
              //             // If you need direct access to dispose, this is your guy!
              //             // controller.dispose();
              //           },
              //         ),
              //       )
              //     : Container()
            ],
          );
        }
      })),
    );
  }
}
