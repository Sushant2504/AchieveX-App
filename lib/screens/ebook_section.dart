import 'package:achievex/provider/subscription_provider.dart';
import 'package:achievex/screens/ebookpage.dart';
import 'package:achievex/screens/widgets/premium_dialogue.dart';
import 'package:achievex/utils/book_info_constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Adjust import path as necessary

class EBookSection extends StatefulWidget {
  const EBookSection({
    super.key,
  });

  @override
  State<EBookSection> createState() => _EBookSectionState();
}

List<String> bookUrls = [
  'https://utfs.io/f/4d799b5c-76e1-4fb0-9be6-ceebd7602c7f-ictp8u.pdf',
  'https://utfs.io/f/75d923ae-c372-414e-bfb6-2135747ad44c-nzowv3.pdf',
  'https://utfs.io/f/3ee1cf1c-593c-4a3f-ae8c-968dee43e5b4-9lucnk.pdf',
  'https://utfs.io/f/eb99ce36-6707-4a37-bfe4-dfc55a4bc9c3-k5vuks.pdf',
  'https://utfs.io/f/fcd9c9f5-f12d-4861-8ef2-f284b27ce205-iahr6s.pdf',
  'https://utfs.io/f/a626f225-0ea1-44f7-a65c-21d6c6e9c325-k0a1xr.pdf',
  'https://utfs.io/f/350ac4e4-8a7c-4e30-b3c6-7f016f613e4a-ytgsv2.pdf',
  'https://utfs.io/f/e392a16c-de8f-4c1f-99a0-f87786a75cdf-cpwxm3.pdf',
];

List<String> titles = [
  'Think & Grow Rich',
  'Psychology of money',
  'Mindset',
  'Atomic Habits',
  'Think and Grow Rich [Hindi]',
  'Psychology of money [Hindi]',
  'Mindset [Hindi]',
  'Atomic Habits [Hindi]',
];

List<String> bookImages = [
  'https://res.cloudinary.com/dssr9wa3x/image/upload/v1721132238/ebook/thinkandgrow_sc9ef8.png',
  'https://res.cloudinary.com/dssr9wa3x/image/upload/v1721132359/ebook/psychologyofmoney_vdirbe.png',
  'https://res.cloudinary.com/dssr9wa3x/image/upload/v1721132404/ebook/mindet_s3phlu.png',
  'https://res.cloudinary.com/dssr9wa3x/image/upload/v1721132445/ebook/atomichabits_kwtxg7.png',
  'https://res.cloudinary.com/dssr9wa3x/image/upload/v1721132238/ebook/thinkandgrow_sc9ef8.png',
  'https://res.cloudinary.com/dssr9wa3x/image/upload/v1721132359/ebook/psychologyofmoney_vdirbe.png',
  'https://res.cloudinary.com/dssr9wa3x/image/upload/v1721132404/ebook/mindet_s3phlu.png',
  'https://res.cloudinary.com/dssr9wa3x/image/upload/v1721132445/ebook/atomichabits_kwtxg7.png',
];

class _EBookSectionState extends State<EBookSection> {
  bool _isOtherContentVisible = false;
  String selectedTitle = "";
  String selectedBookImage = "";
  String selectedUrl = "";
  SubscriptionProvider? subscriptionProvider;
  int index = 0;
  String selectedBookInfo = bookInfo[0];

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
                  'E-Book',
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
                          selectedBookImage,
                          selectedUrl,
                          selectedBookInfo,
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
        itemCount: bookImages.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              if (index == 0 ||
                  index == 4 ||
                  (subscriptionProvider?.PLAN_ID == "1" &&
                      (index == 0 || index == 2 || index == 4 || index == 6))) {
                setState(() {
                  _isOtherContentVisible = true;
                  selectedTitle = titles[index];
                  selectedBookImage = bookImages[index];
                  selectedUrl = bookUrls[index];
                  selectedBookInfo = bookInfo[index];
                });
              } else if (subscriptionProvider?.PLAN_ID == "2") {
                setState(() {
                  _isOtherContentVisible = true;
                  selectedTitle = titles[index];
                  selectedBookImage = bookImages[index];
                  selectedUrl = bookUrls[index];
                  selectedBookInfo = bookInfo[index];
                });
              } else {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const PremiumContentDialog();
                  },
                );
              }

              //  if (index == 0) {
              //   setState(() {
              //     _isOtherContentVisible = true;
              //     selectedTitle = audioTitles[index];
              //     selectedAudioImage = audioBookImages[index];
              //   });
              // } else if (subscriptionProvider?.PLAN_ID == "1" ||
              //     index == 0 ||
              //     index == 2) {
              //   setState(() {
              //     _isOtherContentVisible = true;
              //     selectedTitle = audioTitles[index];
              //     selectedAudioImage = audioBookImages[index];
              //   });
              // } else {
              //   showDialog(
              //     context: context,
              //     builder: (BuildContext context) {
              //       return const PremiumContentDialog();
              //     },
              //   );
              // }
              // setState(() {
              //   _isOtherContentVisible = true;
              //   selectedTitle = titles[index];
              //   selectedBookImage = bookImages[index];
              // });
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
                          bookImages[index],
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
                                titles[index],
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
                                    index == 4 ||
                                    (subscriptionProvider?.PLAN_ID == "1" &&
                                        (index == 0 ||
                                            index == 2 ||
                                            index == 4 ||
                                            index == 6))) {
                                  setState(() {
                                    _isOtherContentVisible = true;
                                    selectedTitle = titles[index];
                                    selectedBookImage = bookImages[index];
                                    selectedUrl = bookUrls[index];
                                    selectedBookInfo = bookInfo[index];
                                  });
                                } else if (subscriptionProvider?.PLAN_ID ==
                                    "2") {
                                  setState(() {
                                    _isOtherContentVisible = true;
                                    selectedTitle = titles[index];
                                    selectedBookImage = bookImages[index];
                                    selectedUrl = bookUrls[index];
                                    selectedBookInfo = bookInfo[index];
                                  });
                                } else {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return const PremiumContentDialog();
                                    },
                                  );
                                }
                                // setState(() {
                                //   _isOtherContentVisible = true;
                                //   selectedTitle = titles[index];
                                //   selectedBookImage = bookImages[index];
                                //   selectedUrl = bookUrls[index];
                                // });
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
                                "Read More",
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
    String selectedUrl,
    String selectedBookInfo,
  ) {
    List<String> remainingTitles =
        titles.where((title) => title != selectedTitle).toList();
    List<String> remainingImages =
        bookImages.where((image) => image != selectedBookImage).toList();
    String epi = "";
    return WillPopScope(
      onWillPop: () async {
        if (index == 0 ||
            index == 4 ||
            (subscriptionProvider?.PLAN_ID == "1" &&
                (index == 0 || index == 2 || index == 4 || index == 6))) {
          setState(() {
            _isOtherContentVisible = true;
            selectedTitle = titles[index];
            selectedBookImage = bookImages[index];
            selectedUrl = bookUrls[index];
            selectedBookInfo = bookInfo[index];
          });
        } else if (subscriptionProvider?.PLAN_ID == "2") {
          setState(() {
            _isOtherContentVisible = true;
            selectedTitle = titles[index];
            selectedBookImage = bookImages[index];
            selectedUrl = bookUrls[index];
            selectedBookInfo = bookInfo[index];
          });
        } else {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const PremiumContentDialog();
            },
          );
        }
        return true; // Returning false prevents default back button behavior
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
                selectedBookInfo,
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
                      builder: (context) => EBookPage(
                        bookTitle: selectedTitle,
                        bookUrl: selectedUrl,
                      ),
                    ),
                  );
                  // if (titles[index] == 0) {
                  //   setState(() {
                  //     _isOtherContentVisible = true;
                  //     selectedTitle = titles[index];
                  //     selectedBookImage = bookImages[index];
                  //   });
                  // } else if (subscriptionProvider?.PLAN_ID == "2" ||
                  //     subscriptionProvider?.PLAN_ID == "1" &&
                  //         (titles[index] == 0 || titles[index] == 2)) {
                  //   setState(() {
                  //     _isOtherContentVisible = true;
                  //     selectedTitle = titles[index];
                  //     selectedBookImage = bookImages[index];
                  //   });
                  // } else {
                  //   showDialog(
                  //     context: context,
                  //     builder: (BuildContext context) {
                  //       return const PremiumContentDialog();
                  //     },
                  //   );
                  // }
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
                  "Read Now",
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
                  itemCount: remainingTitles.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        if (remainingTitles[index] == "Think & Grow Rich") {
                          epi = bookUrls[0];
                        } else if (remainingTitles[index] ==
                            "Psychology of money") {
                          epi = bookUrls[1];
                        } else if (remainingTitles[index] == "Mindset") {
                          epi = bookUrls[2];
                        } else if (remainingTitles[index] == "Atomic Habits") {
                          epi = bookUrls[3];
                        } else if (remainingTitles[index] ==
                            "Think and Grow Rich [Hindi]") {
                          epi = bookUrls[4];
                        } else if (remainingTitles[index] ==
                            "Psychology of money [Hindi]") {
                          epi = bookUrls[5];
                        } else if (remainingTitles[index] ==
                            "Mindset [Hindi]") {
                          epi = bookUrls[6];
                        } else if (remainingTitles[index] ==
                            "Atomic Habits [Hindi]") {
                          epi = bookUrls[7];
                        }
                        if (remainingTitles[index] == "Think & Grow Rich" ||
                            remainingTitles[index] ==
                                "Think and Grow Rich [Hindi]" ||
                            (subscriptionProvider?.PLAN_ID == "1" &&
                                (remainingTitles[index] == "Mindset" ||
                                    remainingTitles[index] ==
                                        "Mindset [Hindi]" ||
                                    remainingTitles[index] ==
                                        "Think & Grow Rich" ||
                                    remainingTitles[index] ==
                                        "Think and Grow Rich [Hindi]"))) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EBookPage(
                                bookTitle: remainingTitles[index],
                                bookUrl: epi,
                              ),
                            ),
                          );
                        } else if (subscriptionProvider?.PLAN_ID == "2") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EBookPage(
                                bookTitle: remainingTitles[index],
                                bookUrl: epi,
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
