import 'package:achievex/provider/subscription_provider.dart';
import 'package:achievex/provider/tips_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/colors.dart';

class TipsScreen extends StatefulWidget {
  TipsScreen({super.key, required this.title});
  String title;
  @override
  State<TipsScreen> createState() => _TipsScreenState();
}

class _TipsScreenState extends State<TipsScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final ScrollController _scrollController = ScrollController();
  final bool _showLastItemMessage = false;

  SubscriptionProvider? subscriptionProvider;
  // late AdmobInterstitial interstitialAd;

  @override
  void initState() {
    super.initState();
    _loadData();
    _controller = AnimationController(vsync: this);

    // subscriptionProvider =
    //     Provider.of<SubscriptionProvider>(context, listen: false);

    // if (subscriptionProvider!.lockAds == false) {
    //   loadInterstitial();
    // }
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
    _controller.dispose();
    super.dispose();
  }

  void _loadData() async {
    Provider.of<TipsProvider>(context, listen: false).getTipsTricks();
  }

  void _saveLastId(String id) {
    Provider.of<TipsProvider>(context, listen: false).saveLastId(id);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TipsProvider>(builder: (context, appdata, child) {
      if (appdata.isLoading) {
        const CircularProgressIndicator();
      } else {
         if(appdata.tipsList!=null) {
           _saveLastId(appdata.tipsList!.last.id.toString());
         }
      }

      return Scaffold(
          body: appdata.isLoading || appdata.tipsList == null
              ? const Center(
                  child: CircularProgressIndicator(
                  color: AppColors.accentColor,
                ))
              : SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                              child: Text('Tips &',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Prompt-Bold',
                                      fontSize: 22,
                                      color: Colors.black)),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 90.0),
                              child: Text(
                                'Tricks',
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
                                  'assets/images/tt.png',
                                  height: 110,
                                )),
                          ],
                        ),
                      ),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: AppColors.greyColor)),
                          margin: const EdgeInsets.only(
                              top: 20, right: 18, left: 18),
                          child: Column(children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Here are a few things you can try to lift your spirits:',
                                style: TextStyle(
                                    fontFamily: 'Promt-Bold',
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.blackColor,
                                    fontSize: 13),
                              ),
                            ),

                            const Divider(),
                            for (int index = 0;
                                index < appdata.tipsList!.length;
                                index++)
                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Text(appdata.tipsList![index].content
                                          .toString()),
                                      const Divider(),
                                    ],
                                  ))
                            // ),

                            // }),
                            // ),
                          ])),
                      // (subscriptionProvider!.lockAds == false || !subscriptionProvider!.IS_PREMIUM!)
                      //     ? Align(
                      //         alignment: Alignment.bottomCenter,
                      //         child: AdmobBanner(
                      //           adUnitId: getBannerAdUnitId()!,
                      //           adSize: AdmobBannerSize.BANNER,
                      //           listener: (AdmobAdEvent event,
                      //               Map<String, dynamic>? args) {
                      //             AdmobAds()
                      //                 .handleEvent(event, args, 'Banner');
                      //           },
                      //           onBannerCreated:
                      //               (AdmobBannerController controller) {
                      //             // Normally you don't need to worry about disposing this yourself, it's handled.
                      //             // If you need direct access to dispose, this is your guy!
                      //             // controller.dispose();
                      //           },
                      //         ),
                      //       )
                      //     : Container()
                    ])));
    });
  }
}
