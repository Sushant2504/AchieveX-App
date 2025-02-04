import 'package:achievex/provider/subscription_provider.dart';
import 'package:achievex/utils/app_constants.dart';
import 'package:achievex/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:appinio_video_player/appinio_video_player.dart';

class PlayCourseScreen extends StatefulWidget {
  late String vLink;
  late String title;
  late String description;

  PlayCourseScreen(
      {super.key,
      required this.title,
      required this.description,
      required this.vLink});

  @override
  State<PlayCourseScreen> createState() => _PlayCourseScreenState();
}

class _PlayCourseScreenState extends State<PlayCourseScreen> {
  late SubscriptionProvider subscriptionProvider;
  bool showAds = false;
  late VideoPlayerController videoPlayerController;
  late CustomVideoPlayerController _customVideoPlayerController;
  String videoUrl = "";

  @override
  void initState() {
    super.initState();
    videoUrl =
        "${AppConstants.baseUrl}/storage/app/public/course/videos/${widget.vLink}";
    videoPlayerController = VideoPlayerController.network(videoUrl)
      ..initialize().then((value) => setState(() {}));
    _customVideoPlayerController = CustomVideoPlayerController(
      context: context,
      videoPlayerController: videoPlayerController,
    );
    print(
        "link------->${AppConstants.baseUrl}/storage/app/public/course/videos/${widget.vLink}");

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
  //       if (event == AdmobAdEvent.closed) interstitialAd!.load();

  //       AdmobAds().handleEvent(event, args, 'Interstitial');
  //       Fluttertoast.showToast(msg: "Ad loaded");
  //     },
  //   );

  //   interstitialAd!.load();
  // }

  @override
  void dispose() {
    // if (interstitialAd != null) {
    //   interstitialAd!.dispose();
    // }
    _customVideoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool fullscreen = false;
    return WillPopScope(
      onWillPop: () async {
        // final value = await subscriptionProvider.isFirst10Min;
        // if (!value) interstitialAd!.show();
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: AppColors.accentColor,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).padding.top,
              color: Colors.white,
            ),
            (fullscreen == false)
                ? Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 15.0, right: 15.0, bottom: 10),
                            child: Center(
                              child: CustomVideoPlayer(
                                customVideoPlayerController:
                                    _customVideoPlayerController,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 12.0, right: 12),
                            child: Text(
                              widget.title.toString(),
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  widget.description,
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 93, 91, 91),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  )
                : const SizedBox(
                    height: 0,
                    width: 0,
                  )
          ],
        ),
      ),
    );
  }
}
