import 'package:achievex/provider/subscription_provider.dart';
import 'package:achievex/screens/brain_games/Meditation/meditation_player.dart';
import 'package:achievex/screens/widgets/premium_dialogue.dart';
import 'package:achievex/utils/audio_book_episodes.dart';
import 'package:achievex/utils/book_info_constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class MediatationPage extends StatefulWidget {
  const MediatationPage({super.key});


  @override
  State<MediatationPage> createState() => _MediatationPageState();
}

List<String> audioTitles = [
  'Meditation-1',
  'Meditation-2',
  'Meditation-3',
  'Meditation-4',
];

List<String> audioBookImages = [
  'https://res.cloudinary.com/dssr9wa3x/image/upload/v1721132238/ebook/thinkandgrow_sc9ef8.png',
  'https://res.cloudinary.com/dssr9wa3x/image/upload/v1721132359/ebook/psychologyofmoney_vdirbe.png',
  'https://res.cloudinary.com/dssr9wa3x/image/upload/v1721132404/ebook/mindet_s3phlu.png',
  'https://res.cloudinary.com/dssr9wa3x/image/upload/v1721132445/ebook/atomichabits_kwtxg7.png',
];

class _MediatationPageState extends State<MediatationPage> {
  int index = 0;
  bool _isOtherContentVisible = false;
  String selectedTitle = "";
  String selectedAudioImage = "";
  String selectedAudio = "";
  List selectedAudioList = thinkandgrow;
  SubscriptionProvider? subscriptionProvider;
  List selectedEpisodes = [];
  String selectedEpisodeInfo = bookInfo[0];
  String temp = '';

  @override
  void initState() {
    super.initState();
    subscriptionProvider =
        Provider.of<SubscriptionProvider>(context, listen: false);
  }

  bool showPremiumDialog() {
    final subscriptionProvider =
        Provider.of<SubscriptionProvider>(context, listen: false);

    print('subscriptionProvider.PLAN_ID : ${subscriptionProvider.PLAN_ID}');
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Text(
                  'Meditation Playlists',
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
                      child: allContent(),
                    ),
                    IgnorePointer(
                      ignoring: !_isOtherContentVisible,
                      child: AnimatedOpacity(
                        opacity: _isOtherContentVisible ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 500),
                        child: specificContent(
                          selectedTitle,
                          selectedAudioImage,
                          selectedEpisodeInfo,
                          selectedEpisodes,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }



  Widget allContent() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 9, right: 10),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 5,
          childAspectRatio: 1.9,
          crossAxisCount: 1,
        ),
        itemCount: audioBookImages.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              if (index == 0 ||
                  (subscriptionProvider?.PLAN_ID == "1" &&
                      (index == 2 || index == 0))) {
                setState(() {
                  _isOtherContentVisible = true;
                  selectedTitle = audioTitles[index];
                  selectedAudioImage = audioBookImages[index];
                  selectedEpisodeInfo = bookInfo[index];
                  if (selectedTitle == audioTitles[0]) {
                    selectedEpisodes = thinkandgrow;
                  } else if (selectedTitle == audioTitles[1]) {
                    selectedEpisodes = psychology;
                  } else if (selectedTitle == audioTitles[2]) {
                    selectedEpisodes = mindset;
                  } else if (selectedTitle == audioTitles[3]) {
                    selectedEpisodes = atomic;
                  }
                });
              } else if (subscriptionProvider?.PLAN_ID == "2") {
                setState(() {
                  _isOtherContentVisible = true;
                  selectedEpisodeInfo = bookInfo[index];
                  selectedTitle = audioTitles[index];
                  selectedAudioImage = audioBookImages[index];
                  if (selectedTitle == audioTitles[0]) {
                    selectedEpisodes = thinkandgrow;
                  } else if (selectedTitle == audioTitles[1]) {
                    selectedEpisodes = psychology;
                  } else if (selectedTitle == audioTitles[2]) {
                    selectedEpisodes = mindset;
                  } else if (selectedTitle == audioTitles[3]) {
                    selectedEpisodes = atomic;
                  }
                });
              } else {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const PremiumContentDialog();
                  },
                );
              }
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image.network(
                          audioBookImages[index],
                          fit: BoxFit.cover,
                          height: 300,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 4),
                              child: Text(
                                audioTitles[index],
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 3,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 4),
                              child: Text(
                                bookInfo[index],
                                style: const TextStyle(
                                  fontSize: 12,
                                ),
                                textAlign: TextAlign.left,
                                maxLines: 3,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                if (index == 0 ||
                                    (subscriptionProvider?.PLAN_ID == "1" &&
                                        (index == 2 || index == 0))) {
                                  setState(() {
                                    _isOtherContentVisible = true;
                                    selectedTitle = audioTitles[index];
                                    selectedAudioImage = audioBookImages[index];
                                    selectedEpisodeInfo = bookInfo[index];
                                    if (selectedTitle == audioTitles[0]) {
                                      selectedEpisodes = thinkandgrow;
                                    } else if (selectedTitle ==
                                        audioTitles[1]) {
                                      selectedEpisodes = psychology;
                                    } else if (selectedTitle ==
                                        audioTitles[2]) {
                                      selectedEpisodes = mindset;
                                    } else if (selectedTitle ==
                                        audioTitles[3]) {
                                      selectedEpisodes = atomic;
                                    }
                                  });
                                } else if (subscriptionProvider?.PLAN_ID ==
                                    "2") {
                                  setState(() {
                                    _isOtherContentVisible = true;
                                    selectedTitle = audioTitles[index];
                                    selectedAudioImage = audioBookImages[index];
                                    selectedEpisodeInfo = bookInfo[index];
                                    if (selectedTitle == audioTitles[0]) {
                                      selectedEpisodes = thinkandgrow;
                                    } else if (selectedTitle ==
                                        audioTitles[1]) {
                                      selectedEpisodes = psychology;
                                    } else if (selectedTitle ==
                                        audioTitles[2]) {
                                      selectedEpisodes = mindset;
                                    } else if (selectedTitle ==
                                        audioTitles[3]) {
                                      selectedEpisodes = atomic;
                                    }
                                  });
                                } else {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return const PremiumContentDialog();
                                    },
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff446EDB),
                                elevation: 0,
                                padding: const EdgeInsets.only(
                                  left: 20,
                                  right: 20,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              child: const Text(
                                "Listen More",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget specificContent(
    String selectedTitle,
    String selectedBookImage,
    String selectedEpisodeInfo,
    List selectedEpisodes,
  ) {
    List<String> remainingTitles =
        audioTitles.where((title) => title != selectedTitle).toList();
    List<String> remainingImages =
        audioBookImages.where((image) => image != selectedBookImage).toList();
    List epi = [];
    // List remainingEpisodes = selectedEpisodes.where((episode) {
    //   return episode != selectedEpisodes;
    // }).toList();
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              height: MediaQuery.of(context).size.height * 0.4,
              child: Image.network(
                selectedBookImage,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                selectedTitle,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                selectedEpisodeInfo,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MeditationPlayer(
                        audioTitle: selectedTitle,
                        audioBookImage: selectedAudioImage,
                        episodes: selectedEpisodes,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff446EDB),
                  elevation: 0,
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                child: const Text(
                  "Listen Now",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 6.0,
                right: 6.0,
              ),
              child: SizedBox(
                height: MediaQuery.of(context).size.height *
                    0.28, // Specify the height here
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: audioTitles.length - 1,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        if (remainingTitles[index] == "Think & Grow Rich") {
                          epi = thinkandgrow;
                        } else if (remainingTitles[index] ==
                            "Psychology of money") {
                          epi = psychology;
                        } else if (remainingTitles[index] == "Mindset") {
                          epi = mindset;
                        } else if (remainingTitles[index] == "Atomic Habits") {
                          epi = atomic;
                        }
                        if (remainingTitles[index] == "Think & Grow Rich" ||
                            (subscriptionProvider?.PLAN_ID == "1" &&
                                (remainingTitles[index] == "Mindset" ||
                                    remainingTitles[index] ==
                                        "Think & Grow Rich"))) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MeditationPlayer(
                                audioTitle: remainingTitles[index],
                                audioBookImage: remainingImages[index],
                                episodes: epi,
                              ),
                            ),
                          );
                        } else if (subscriptionProvider?.PLAN_ID == "2") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MeditationPlayer(
                                audioTitle: remainingTitles[index],
                                audioBookImage: remainingImages[index],
                                episodes: epi,
                              ),
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
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 5,
                          ),
                          child: SizedBox(
                            height: 200,
                            width: 120,
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    child: Image.network(
                                      remainingImages[index],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    remainingTitles[index],
                                    style: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 3,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
