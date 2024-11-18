import 'dart:io';
import 'package:achievex/provider/appdata_provider.dart';
import 'package:achievex/utils/colors.dart';
import 'package:achievex/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:otpless_flutter/otpless_flutter.dart';
import '../provider/auth_provider.dart';
import '../utils/utils.dart';
import '../utils/app_constants.dart';
import 'package:achievex/screens/verify_otp.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _otplessFlutterPlugin = Otpless();
  bool _isLoading = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _otplessFlutterPlugin.initHeadless(AppConstants.OTPLESS_APP_KEY);
    _otplessFlutterPlugin.setHeadlessCallback(onHeadlessResult);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppAuthProvider>(builder: (context, authProvider, child) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Wrap(children: [
                  Container(
                    margin: const EdgeInsets.only(right: 25, left: 25, top: 30),
                    decoration: const BoxDecoration(
                        color: AppColors.whitebackgroundColor,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 25,
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.arrow_back,
                              weight: 20,
                            )),
                        const SizedBox(
                          height: 0,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 12.0, top: 12),
                          child: Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 28,
                              fontFamily: 'Poppins',
                              color: AppColors.blackColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 0.0),
                          child: Text(
                            "On \"Achievex X\".",
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              color: AppColors.textNewColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 34,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Card(
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: AppColors.formBgColor,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey
                                      .withOpacity(0.5), // Shadow color
                                  spreadRadius: 2, // Spread radius
                                  blurRadius: 2, // Blur radius
                                  offset: const Offset(
                                      0, 1), // Offset of the shadow
                                ),
                              ],
                            ),
                            height: 50,
                            child: TextField(
                              keyboardType: TextInputType.phone,
                              controller: mobileNumberController,
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                border: InputBorder.none,
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Image.asset(
                                    'assets/icons/contact.png',
                                    height: 5,
                                    width: 5,
                                  ),
                                ),
                                // border: const OutlineInputBorder(),
                                // labelText: 'Mobile Number',
                                // labelStyle:  TextStyle(fontWeight: FontWeight.w700,fontFamily: 'Poppins'),

                                hintStyle: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Poppins'),
                                hintText: 'Phone Number',
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 10.0, right: 2.0),
                          child: Text(
                            'Welcome back Achiever please login and continue your journey.',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w500),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 0.0, right: 0, top: 4),
                          child: InkWell(
                            onTap: () {
                              // sendOtpless(mobileNumberController.text
                              //     .toString()
                              //     .trim());

                              Navigator.pushNamedAndRemoveUntil(context,
                                  RoutesName.categoryScreen, (route) => false);
                            },
                            child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    color: AppColors.accentColor,
                                    border: Border.all(
                                        width: 2, color: AppColors.textColor),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(5))),
                                child: const Center(
                                    child: Text(
                                  "Get your OTP",
                                  style: TextStyle(
                                    color: AppColors.whiteColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ))),
                          ),
                        ),
                        Stack(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 19.0),
                              child: Divider(
                                thickness: 1,
                                height: 2,
                                color: Colors.black,
                              ),
                            ),
                            Center(
                              child: Container(
                                color: AppColors.whiteColor,
                                child: const Padding(
                                  padding: EdgeInsets.only(
                                      top: 9.0, left: 5, right: 5),
                                  child: Text('Sign in with'),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 19,
                        ),
                        _isLoading
                            ? Center(child: CircularProgressIndicator())
                            : InkWell(
                                onTap: () async {
                                  // socialLogin("GMAIL");
                                  setState(() {
                                    _isLoading = true;
                                  });

                                  await loginwithGoogle();

                                  setState(() {
                                    _isLoading = false;
                                  });

                                  storeNameAndPhoneNumber(
                                      nameController.text.toString().trim(),
                                      mobileNumberController.text
                                          .toString()
                                          .trim());

                                  Navigator.pushNamedAndRemoveUntil(
                                      context,
                                      RoutesName.categoryScreen,
                                      (route) => false);
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: AppColors.formBgColor,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey
                                            .withOpacity(0.5), // Shadow color
                                        spreadRadius: 2, // Spread radius
                                        blurRadius: 2, // Blur radius
                                        offset: const Offset(
                                            0, 1), // Offset of the shadow
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: Image.asset(
                                          'assets/icons/g_login.png', // Replace with your image file path
                                          width:
                                              24, // Set the width of the image
                                          height:
                                              24, // Set the height of the image
                                        ),
                                      ),
                                      const Text(
                                        'Continue With Google',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                        const SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),
                ]),
              ],
            ),
          ),
        ),
      );
    });
  }

  void sendOtpless(String mobileNumber) {
    print("mobileNumber");
    if (mobileNumber.isEmpty) {
      print("mobilenuber is not correct");
    } else {
      Map<String, dynamic> arg = {};
      arg["phone"] = mobileNumber;
      arg["countryCode"] = "+91";
      _otplessFlutterPlugin.startHeadless(onHeadlessResult, arg);
    }
  }

  void onHeadlessResult(dynamic result) {
    if (result['statusCode'] == 200) {
      switch (result['responseType'] as String) {
        case 'INITIATE':
          {
            print('Authentication is Intiated !');

            storeNameAndPhoneNumber(nameController.text.toString().trim(),
                mobileNumberController.text.toString().trim());
            Navigator.of(context).pushNamed(
              '/verify_otp',
              arguments: {
                'name': nameController.text.toString().trim(),
                'number': mobileNumberController.text.toString().trim(),
              },
            );
          }
          break;
        case 'VERIFY':
          {
            Navigator.pushNamedAndRemoveUntil(
                context, RoutesName.categoryScreen, (route) => false);
          }
          break;
        case 'OTP_AUTO_READ':
          {
            if (Platform.isAndroid) {
              otp = result['response']['otp'] as String;

              Navigator.pushNamedAndRemoveUntil(
                  context, RoutesName.categoryScreen, (route) => false);
            }
          }
          break;
        case 'ONETAP':
          {
            final token = result["response"]["token"];

            storeAccessToken(token);

            Navigator.pushNamedAndRemoveUntil(
                context, RoutesName.categoryScreen, (route) => false);
          }
          break;
      }
    } else {
      showInvalidOtpPopup(context);
    }
  }

  void showInvalidOtpPopup(context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Otp Authentication failed !'),
          content: Text(
              'It may be Server issue , wait for some time or Please enter the correct otp or click on resend otp'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void socialLogin(String channel) {
    print("called!");
    Map<String, dynamic> arg = {'channelType': channel};
    _otplessFlutterPlugin.startHeadless(onHeadlessResult, arg);
  }
}
