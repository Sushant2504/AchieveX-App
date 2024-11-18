import 'package:achievex/provider/demotivation_provider.dart';
import 'package:achievex/provider/subscription_provider.dart';
import 'package:achievex/screens/widgets/video_data_card.dart';
import 'package:achievex/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';

import '../utils/colors.dart';

class DemotivationScreen extends StatefulWidget {
  DemotivationScreen({super.key, required this.title});
  String title;

  @override
  State<DemotivationScreen> createState() => _DemotivationScreenState();
}

class _DemotivationScreenState extends State<DemotivationScreen>
    with SingleTickerProviderStateMixin {
  // late AnimationController _controller;
  late SubscriptionProvider subscriptionProvider;
  bool showAds = false;

  String v1 = "";
  String v2 = "";

  @override
  void initState() {
    super.initState();
    _loadData();
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
    Provider.of<DemotivationProvider>(context, listen: false)
        .getDemotivationProviderData();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // final value = await subscriptionProvider.isFirst10Min;
        // if (!value) interstitialAd.show();

        return true; // Return true to allow the back press
      },
      child: Scaffold(
        body: Consumer<DemotivationProvider>(
          builder: (context, appdata, child) {
            // v1 = AppConstants.facingDemotiovationMotivationalVideo +
            //     appdata.demotivationModel!.motivationVideo.videoLink.toString();

            // v2 = AppConstants.facingDemotiovationComedyVideo +
            //     appdata.demotivationModel!.comedyVideo.videoLink.toString();

            return appdata.isLoading || appdata.demotivationModel == null
                ? const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.accentColor,
                    ),
                  )
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
                                child: Text(
                                  'Facing',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Prompt-Bold',
                                    fontSize: 22,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 90.0),
                                child: Text(
                                  'Demotivation',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    // fontFamily: 'Prompt-Bold',
                                    fontSize: 38,
                                    color: AppColors.textNewColor,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Image.asset(
                                  'assets/images/fd.png',
                                  height: 110,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: AppColors.greyColor,
                            ),
                          ),
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
                                      fontWeight: FontWeight.w600,
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
                                      'Identify the Source: Understand what\'s\ncausing your lack of motivation to address\n it effectively.',
                                      style: TextStyle(
                                        fontFamily: 'Promt',
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.blackColor,
                                        fontSize: 13,
                                      ),
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
                                      'Set Clear Goals: Define specific, achievable\ngoals to give your efforts direction.',
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
                                      'Reconnect with Your Purpose:\nRemember why you started and how it\naligns with your values and long-term\ngoals.',
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
                                      'Visualize Success: Envision the positive\noutcomes to reignite your motivation.',
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
                                      'Celebrate Small Wins: Acknowledge and\ncelebrate your achievements, no matter\nhow small they may seem.',
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
                                )),
                              ),

                              Center(
                                child: VideoDataCard(
                                    post: AppConstants
                                            .facingDemotiovationComedyVideo +
                                        appdata.demotivationModel!.comedyVideo
                                            .videoLink
                                            .toString()),
                              ),
                              Center(
                                child: VideoDataCard(
                                    post: AppConstants
                                            .facingDemotiovationMotivationalVideo +
                                        appdata.demotivationModel!
                                            .motivationVideo.videoLink
                                            .toString()),
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
                                        onPressed: () => (
                                          {
                                            playPauseAudio1(
                                              appdata
                                                  .demotivationModel!.audioFile
                                                  .toString(),
                                            ),
                                          },
                                        ),
                                      ),
                                      if (loadingProgress1 > 0 &&
                                          loadingProgress1 < 1)
                                        LinearProgressIndicator(
                                          value: loadingProgress1,
                                        ),
                                      const Text('Audio 1'),
                                    ],
                                  ),
                                ),
                              ),

                              // Container(
                              //   height: 80,
                              //   margin: const EdgeInsets.all(10),
                              //   decoration: BoxDecoration(
                              //       color: AppColors.accentColor.withOpacity(0.2),
                              //       border: Border.all(width: 1, color: Colors.black),
                              //       borderRadius: BorderRadius.circular(14)),
                              //   child: Center(
                              //     child: Row(
                              //         mainAxisAlignment: MainAxisAlignment.center,
                              //         children: [
                              //           // Audio 2
                              //           const SizedBox(height: 20),
                              //           IconButton(
                              //             icon: Icon(isPlaying2
                              //                 ? Icons.pause
                              //                 : Icons.play_arrow),
                              //             onPressed: playPauseAudio2,
                              //           ),
                              //           if (loadingProgress2 > 0 &&
                              //               loadingProgress2 < 1)
                              //             LinearProgressIndicator(
                              //                 value: loadingProgress2),
                              //           const Text('Audio 2'),
                              //         ]),
                              //   ),
                              // ),
                              // Center(child: VideoDataCard(post: v1)),
                              // Center(
                              //   child: VideoDataCard(post: v2),
                              // ),
                              // Container(
                              //   height: 80,
                              //   margin: const EdgeInsets.all(10),
                              //   decoration: BoxDecoration(
                              //       color: AppColors.accentColor.withOpacity(0.2),
                              //       border: Border.all(width: 1, color: Colors.black),
                              //       borderRadius: BorderRadius.circular(14)),
                              //   child: Row(
                              //     children: [
                              //       InkWell(
                              //         onTap: () {
                              //           if (!appdata.isPlayingAudio1) {
                              //             appdata.playPauseAudio1(true);
                              //           } else {
                              //             appdata.playPauseAudio1(false);
                              //           }
                              //         },
                              //         child: Container(
                              //           margin: const EdgeInsets.all(10),
                              //           width: 60,
                              //           height: 60,
                              //           decoration: BoxDecoration(
                              //               border: Border.all(
                              //                   width: 1,
                              //                   color: AppColors.blackColor),
                              //               borderRadius: BorderRadius.circular(50)),
                              //           child: (appdata.isPlayingAudio1)
                              //               ? const Icon(Icons.pause)
                              //               : const Icon(Icons.play_arrow),
                              //         ),
                              //       ),
                              //       const Text('Audio 1'),
                              //     ],
                              //   ),
                              // ),
                              // Container(
                              //   height: 80,
                              //   margin: const EdgeInsets.all(10),
                              //   decoration: BoxDecoration(
                              //       color: AppColors.accentColor.withOpacity(0.2),
                              //       border: Border.all(width: 1, color: Colors.black),
                              //       borderRadius: BorderRadius.circular(14)),
                              //   child: Row(
                              //     children: [
                              //       InkWell(
                              //         onTap: () => {
                              //           if (!appdata.isPlayingAudio2)
                              //             {
                              //               appdata.playPauseAudio2(true),
                              //             }
                              //           else
                              //             {
                              //               appdata.playPauseAudio1(false),
                              //             }
                              //         },
                              //         child: Container(
                              //           margin: const EdgeInsets.all(10),
                              //           width: 60,
                              //           height: 60,
                              //           decoration: BoxDecoration(
                              //               border: Border.all(
                              //                   width: 1,
                              //                   color: AppColors.blackColor),
                              //               borderRadius: BorderRadius.circular(50)),
                              //           child: (appdata.isPlayingAudio2)
                              //               ? const Icon(Icons.pause)
                              //               : const Icon(Icons.play_arrow),
                              //         ),
                              //       ),
                              //       const Text('Audio 2'),
                              //     ],
                              //   ),
                              // ),

                              const SizedBox(
                                height: 40,
                              ),
                              // (showAds)
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
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
          },
        ),
      ),
    );
  }
}
