import 'package:achievex/utils/app_constants.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:whatsapp_share/whatsapp_share.dart';
// import 'package:share/share.dart';

import '../utils/colors.dart';

class ReferEarnScreen extends StatefulWidget {
  const ReferEarnScreen({super.key});

  @override
  State<ReferEarnScreen> createState() => _ReferEarnScreenState();
}

class _ReferEarnScreenState extends State<ReferEarnScreen> {
  String? response;
  String? referralCode;
  SharedPreferences? sp;
  Uri? shortLinkUrl;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    createDynamicLinks();
  }

  // Future<void> share() async {
  //   await FlutterShare.share(
  //       text:
  //           'AchieveX, a comprehensive educational companion designed specifically for students preparing for competitive exams such as MPSC, UPSC, NEET, JEE, as well as those navigating their 12th and 10th-grade studies. This all-in-one solution is meticulously crafted to empower students with the tools they need for success.',
  //       linkUrl: shortLinkUrl!.toString(),
  //       title: 'share',
  //       chooserTitle: 'Achievex');
  // }

  Future<String?> createDynamicLinks() async {
    sp = await SharedPreferences.getInstance();

    int? uID = sp?.getInt(AppConstants.userid);
    String? uName = "ACHI";

    // Concatenate the letters and digits

    setState(() {
      referralCode = '$uName$uID';
    });

   



    print('dLink----->$shortLinkUrl');

    return shortLinkUrl.toString();
  }

  @override
  Widget build(BuildContext context) {
    createDynamicLinks();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.accentColor,
          iconTheme: const IconThemeData(color: AppColors.whiteColor),
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: AppColors.whitebackgroundColor, fontSize: 19),
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            Container(
              color: AppColors.accentColor,
              height: 150,
              width: double.infinity,
              child: Column(
                children: [
                  const Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Refer your friend",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 18, color: AppColors.whiteColor)),
                            const Text(
                              'Get Coupon 50 each',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.whiteColor),
                            ),
                            Container(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 20,
                  ),
                ],
              ),
            ),
            Card(
              margin: const EdgeInsets.only(top: 125, right: 20, left: 20),
              shadowColor: AppColors.greyColor,
              child: SizedBox(
                height: 50,
                width: double.infinity,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Image.asset(
                        'assets/icons/rupee.png',
                        height: 24,
                        width: 24,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total Reward',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13),
                          ),
                          Text(
                            ' Rs 200',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.only(top: 205, right: 20, left: 20),
              shadowColor: AppColors.greyColor,
              child: SizedBox(
                height: 200,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Image.asset(
                            'assets/icons/link.png',
                            height: 24,
                            width: 24,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.all(10),
                                width: 250,
                                child: const Text(
                                  'Invite your friends to install the app with the link',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Image.asset(
                            'assets/icons/wallet.png',
                            height: 24,
                            width: 24,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.all(10),
                                width: 250,
                                child: const Text(
                                  'Once 4 friends install the app then you get 200 Rs coupon',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 428.0, left: 20, right: 20),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: AppColors.accentColor,
                        width: 1.5,
                        style: BorderStyle.solid),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      referralCode.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.accentColor),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 502.0, left: 20, right: 20),
              child: InkWell(
                onTap: () async => {
                  // onButtonTap(Share.whatsapp_personal,   referralCode.toString()),
                  await WhatsappShare.share(
                    text:
                        'AchieveX, a comprehensive educational companion designed specifically for students preparing for competitive exams such as MPSC, UPSC, NEET, JEE, as well as those navigating their 12th and 10th-grade studies. This all-in-one solution is meticulously crafted to empower students with the tools they need for success.',
                    linkUrl: shortLinkUrl!.toString(),
                    phone: '1234567890',
                  ),
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppColors.accentColor,
                      border:
                          Border.all(color: AppColors.accentColor, width: 1),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Text(
                        "Share On Whatsapp",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.whitebackgroundColor),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 562.0, left: 20, right: 20),
              child: InkWell(
                onTap: () async => {
                  
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: AppColors.accentColor, width: 1.5),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Text(
                        "More Options",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.accentColor),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }

}
