
import 'package:achievex/provider/feelinglow_provider.dart';
import 'package:achievex/provider/subscription_provider.dart';
import 'package:achievex/screens/widgets/video_data_card.dart';
import 'package:achievex/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';

import '../utils/colors.dart';

class FeelinglowScreen extends StatefulWidget {
  FeelinglowScreen({super.key, required this.title});
  String title;

  @override
  State<FeelinglowScreen> createState() => _FeelinglowScreenState();
}

class _FeelinglowScreenState extends State<FeelinglowScreen>
    with SingleTickerProviderStateMixin {
  late SubscriptionProvider subscriptionProvider;
  bool showAds = false;

  @override
  void initState() {
    super.initState();
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

  AudioPlayer player1 = AudioPlayer();
  bool isPlaying1 = false;
  double loadingProgress1 = 0.0;

  @override
  void dispose() {
    player1.dispose();
    super.dispose();
  }

  Future<dynamic> playPauseAudio1(String url) async {
    print('audio_url --->' '${AppConstants.baseUrl}/storage/app/$url');
    await player1.setUrl('${AppConstants.baseUrl}/storage/app/$url');
    if (isPlaying1) {
      player1.pause();
    } else {
      player1.play();
    }
    setState(() {
      isPlaying1 = !isPlaying1;
    });
  }

  void _loadData() async {
    Provider.of<FeelinglowProvider>(context, listen: false)
        .getFeelingLowProviderData();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // final value = await subscriptionProvider.isFirst10Min;
        // if (!value) interstitialAd.show();
        return true;
      },
      child: Consumer<FeelinglowProvider>(
        builder: (context, appdata, child) {
          return appdata.isLoading || appdata.demotivationModel == null
              ? const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.accentColor,
                  ),
                )
              : Scaffold(
                  body: SingleChildScrollView(
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
                                child: Text('Feeling',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'Prompt-Bold',
                                        fontSize: 22,
                                        color: Colors.black)),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 90.0),
                                child: Text(
                                  'LOW',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'Prompt-Bold',
                                      fontSize: 38,
                                      color: AppColors.textNewColor),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Image.asset(
                                  'assets/images/feelinglow.png',
                                  height: 110,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Comedy Video Start//
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: AppColors.greyColor)),
                          margin: const EdgeInsets.only(
                              top: 20, right: 18, left: 18),
                          child: Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Here are a few things you can try to lift your spirits:',
                                  style: TextStyle(
                                      fontFamily: 'Promt-Bold',
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.blackColor,
                                      fontSize: 13),
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 15, top: 15),
                                    height: 4,
                                    width: 4,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.black,
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'Talk to someone: Sharing your feelings\nwith a trusted friend or family member\ncan provide emotional relief and support.',
                                      style: TextStyle(
                                          fontFamily: 'Promt',
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.blackColor,
                                          fontSize: 13),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 15, top: 15),
                                    height: 4,
                                    width: 4,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.black,
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'Practice self-care: Take time for self-care\nactivities, such as taking a walk, reading\na book, or indulging in your favorite hobby.',
                                      style: TextStyle(
                                          fontFamily: 'Promt',
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.blackColor,
                                          fontSize: 13),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 15, top: 15),
                                    height: 4,
                                    width: 4,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.black,
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'Reflect on positive experiences: Think\nabout past moments when you felt\nhappy or accomplished. Sometimes,\nremembering these can provide a boost.',
                                      style: TextStyle(
                                          fontFamily: 'Promt',
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.blackColor,
                                          fontSize: 13),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 15, top: 15),
                                    height: 4,
                                    width: 4,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.black,
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'Set small, achievable goals: Accomplishing\neven small tasks can help improve your mood\nand self-esteem.',
                                      style: TextStyle(
                                          fontFamily: 'Promt',
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.blackColor,
                                          fontSize: 13),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 15, top: 15),
                                    height: 4,
                                    width: 4,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.black,
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'Consider professional help: If your low\nmood persists or is impacting your daily\nlife, consider talking to a mental health\nprofessional. They can provide guidance\nand treatment options.',
                                      style: TextStyle(
                                          fontFamily: 'Promt',
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.blackColor,
                                          fontSize: 13),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                margin: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: const Color(0xffC5D5FC)),
                                child: const Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'Here are few videos which can lighten your mood up',
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ),
                              VideoDataCard(
                                post: AppConstants.feelingLowCV +
                                    appdata.demotivationModel!.comedyVideo
                                        .videoLink
                                        .toString(),
                              ),
                              VideoDataCard(
                                post: AppConstants.feelingLowCV +
                                    appdata.demotivationModel!.motivationVideo
                                        .videoLink
                                        .toString(),
                              ),
                              Container(
                                height: 80,
                                margin: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color:
                                        AppColors.accentColor.withOpacity(0.2),
                                    border: Border.all(
                                        width: 1, color: Colors.black),
                                    borderRadius: BorderRadius.circular(14)),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      // Audio 1
                                      IconButton(
                                          icon: Icon(isPlaying1
                                              ? Icons.pause
                                              : Icons.play_arrow),
                                          onPressed: () => ({
                                                playPauseAudio1(appdata
                                                    .demotivationModel!
                                                    .audioFile
                                                    .toString()),
                                              })),
                                      if (loadingProgress1 > 0 &&
                                          loadingProgress1 < 1)
                                        LinearProgressIndicator(
                                            value: loadingProgress1),
                                      const Text('Audio 1'),
                                    ],
                                  ),
                                ),
                              ),

                              // VideoDataCard(
                              //     post: getFilePath(appdata.category) +
                              //         appdata.demotivationModel!.motivationVideo![0]
                              //             .videoLink
                              //             .toString()),
                              // (showAds)
                              //     ? Align(
                              //         alignment: Alignment.bottomCenter,
                              //         child: Positioned(
                              //           right: 0,
                              //           left: 0,
                              //           top: 0,
                              //           bottom: 1,
                              //           child: AdmobBanner(
                              //             adUnitId: getBannerAdUnitId()!,
                              //             adSize: AdmobBannerSize.BANNER,
                              //             listener: (AdmobAdEvent event,
                              //                 Map<String, dynamic>? args) {
                              //               AdmobAds()
                              //                   .handleEvent(event, args, 'Banner');
                              //             },
                              //             onBannerCreated:
                              //                 (AdmobBannerController controller) {
                              //               // Normally you don't need to worry about disposing this yourself, it's handled.
                              //               // If you need direct access to dispose, this is your guy!
                              //               // controller.dispose();
                              //             },
                              //           ),
                              //         ),
                              //       )
                              //     : Container()
                            ],
                          ),
                        ), //  Motivational Video End
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }

  String getFilePath(String categroy) {
    if (categroy == '10') {
      //  for ca
      return AppConstants.feelingLowca;
    } else if (categroy == '11') {
      // for jee

      return AppConstants.feelingLowJee;
    } else if (categroy == '12') {
      // for neet
      return AppConstants.feelingLowNeet;
    } else if (categroy == '13') {
      // for UPSC
      return AppConstants.feelingLowUpsc;
    } else {
      return AppConstants.feelingLow10th;
    }
  }
}
