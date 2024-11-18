import 'package:achievex/provider/appdata_provider.dart';
import 'package:achievex/provider/subscription_provider.dart';
import 'package:achievex/screens/brain_training_certificate_page.dart';
import 'package:achievex/screens/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../utils/colors.dart';
import '../utils/routes/routes_name.dart';

class Profile extends StatelessWidget {
  Profile({super.key});

  SubscriptionProvider? subscriptionProvider;

  @override
  Widget build(BuildContext context) {
    subscriptionProvider =
        Provider.of<SubscriptionProvider>(context, listen: false);
    return Consumer<AppdataProvider>(
      builder: (context, appdata, child) {
        appdata.getSharedData();

        return Stack(
          children: [
            Image.asset('assets/images/profilebg.png'),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.all(15),
                    height: 200,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(80)),
                              child: Container(
                                color:
                                    (subscriptionProvider!.IS_PREMIUM != true)
                                        ? AppColors.greyColor
                                        : Colors.transparent,
                                height: 70,
                                width: 70,
                                child: Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: (subscriptionProvider!.IS_PREMIUM ==
                                          false)
                                      ? Image.asset(
                                          'assets/images/default_profile.png',
                                          height: 40,
                                          width: 40,
                                        )
                                      : Image.asset(
                                          'assets/icons/premium_user.png',
                                          height: 60,
                                          width: 60,
                                        ),
                                ),
                              )),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FutureBuilder<Map<String, String>>(
                              future: retrieveNameAndPhoneNumber(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  Map<String, String> data = snapshot.data!;
                                  return Column(
                                    children: [
                                      Text('Name: ${data['name']}', 
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),),

                                      const SizedBox(height: 6),
                                      Text(
                                          'Phone Number: ${data['phoneNumber']}',
                                          style: TextStyle(
                                             color: Colors.white,
                                              fontSize: 14,
                                          ),),
                                    ],
                                  );
                                } else {
                                  return CircularProgressIndicator();
                                }
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  InkWell(
                    onTap: () => {
                      Navigator.pushNamed(
                          context, RoutesName.subscriptionScreen)
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 18.0, top: 20),
                          child: Image.asset('assets/images/choose_plan.png'),
                        ),
                      ),
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.only(left: 30, top: 5, right: 30),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5), // Shadow color
                          spreadRadius: 2, // Spread radius
                          blurRadius: 2, // Blur radius
                          offset: const Offset(0, 1), // Offset of the shadow
                        ),
                      ],
                    ),
                    child: InkWell(
                      onTap: () => {
                        if (subscriptionProvider!.IS_PREMIUM! &&
                            subscriptionProvider!.IS_PREMIUM != null)
                          {
                            Fluttertoast.showToast(
                                msg:
                                    "You have already purchased subscription for other exam.")
                          }
                        else
                          {
                            Navigator.pushNamed(
                                context, RoutesName.categoryScreen)
                          }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/c_cat.png',
                              width: 25,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            const Text(
                              "Category change",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.blackColor,
                                  fontSize: 15),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                            ),
                            const SizedBox(
                              width: 10,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 30, top: 20, right: 30),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5), // Shadow color
                          spreadRadius: 2, // Spread radius
                          blurRadius: 2, // Blur radius
                          offset: const Offset(0, 1), // Offset of the shadow
                        ),
                      ],
                    ),
                    child: InkWell(
                      onTap: () => {
                        Navigator.pushNamed(context, RoutesName.writeYourPost)
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/w_quote.png',
                              width: 25,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            const Text(
                              "Write your Quote",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.blackColor,
                                  fontSize: 15),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // InkWell(
                  //   onTap: () =>
                  //       {Navigator.pushNamed(context, RoutesName.courseScreen)},
                  //   child: Container(
                  //     margin: const EdgeInsets.only(left: 12, bottom: 10),
                  //     width: double.infinity,
                  //     child: const Padding(
                  //       padding: EdgeInsets.all(9.0),
                  //       child: Text(
                  //         "Course & More",
                  //         textAlign: TextAlign.start,
                  //         style: TextStyle(
                  //             fontWeight: FontWeight.w400,
                  //             color: AppColors.blackColor,
                  //             fontSize: 15),
                  //       ),
                  //     ),
                  //   ),
                  // ),

                  Container(
                    margin: const EdgeInsets.only(left: 30, top: 20, right: 30),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5), // Shadow color
                          spreadRadius: 2, // Spread radius
                          blurRadius: 2, // Blur radius
                          offset: const Offset(0, 1), // Offset of the shadow
                        ),
                      ],
                    ),
                    child: InkWell(
                      onTap: () => {
                        Navigator.pushNamed(context, RoutesName.referEarnScreen,
                            arguments: "Contact Us")
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/r_earn.png',
                              width: 25,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            const Text(
                              "Refer & Earn",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.blackColor,
                                  fontSize: 15),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 30, top: 20, right: 30),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5), // Shadow color
                          spreadRadius: 2, // Spread radius
                          blurRadius: 2, // Blur radius
                          offset: const Offset(0, 1), // Offset of the shadow
                        ),
                      ],
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                BrainTrainingCertificatePage(),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/certificate_icon.png',
                              width: 25,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            const Expanded(
                              flex: 4,
                              child: Text(
                                "About Brain Training Sessions",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.blackColor,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () => {
                  Navigator.pushNamed(context, RoutesName.setting_screen),
                  
                },
                child: const Padding(
                  padding: EdgeInsets.only(right: 18.0, top: 60),
                  child: Icon(
                    Icons.settings,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
