import 'package:achievex/provider/appdata_provider.dart';
import 'package:achievex/screens/privacy_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/colors.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  
    Consumer<AppdataProvider>(builder: (context, appdata, child) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () => {Navigator.pop(context)},
              child: const Padding(
                padding: EdgeInsets.only(top: 45.0),
                child: Icon(Icons.arrow_back),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Settings',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Prompt-Bold',
                  fontSize: 38,
                  color: AppColors.textNewColor),
            ),
          ),
          InkWell(
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        PrivacyPolicyScreen(title: "About Us")),
              ),
            },
            child: Container(
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
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/about_us.png',
                      width: 25,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Text(
                      "About Us",
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
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () => {
              // Navigator.pushNamed(context, RoutesName.privacyPolicyScreen,arguments: "Privacy Policy" )
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        PrivacyPolicyScreen(title: "Privacy Policy")),
              ),
            },
            child: Container(
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
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/privacy-policy.png',
                      width: 25,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Text(
                      "Privacy Policy",
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
           const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () => {
              // Navigator.pushNamed(context, RoutesName.privacyPolicyScreen,arguments: "Privacy Policy" )
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        PrivacyPolicyScreen(title: "Terms & Conditions")),
              ),
            },
            child: Container(
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
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/privacy-policy.png',
                      width: 25,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Text(
                      "Terms & Conditions",
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
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        PrivacyPolicyScreen(title: "Contact Us")),
              ),
            },
            child: Container(
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
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/contact_us.png',
                      width: 25,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Text(
                      "Contact Us",
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
          const Spacer(),
          Container(
            margin: const EdgeInsets.all(40),
            height: 50,
            decoration: BoxDecoration(
                  color: AppColors.accentColor,
                  border: Border.all(width: 2, color: AppColors.textColor),
                  borderRadius: const BorderRadius.all(Radius.circular(5))),
            child: InkWell(
              onTap: () async {
                 await logout(context);
              },
              child: const Center(
                    child: Text(
                  "Log Out",
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                )),
            ),
          ),
        ],
      ),
    );});
  }

  
}
