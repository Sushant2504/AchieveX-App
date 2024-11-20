import 'dart:convert';
import 'dart:io';
import 'package:achievex/screens/category_screen.dart';
import 'package:achievex/screens/verify_otp.dart';
import 'package:achievex/utils/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:otpless_flutter/otpless_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:otpless_flutter/otpless_flutter.dart';
import 'package:provider/provider.dart';
import 'package:achievex/utils/app_constants.dart';
import '../provider/auth_provider.dart';
import '../utils/routes/routes_name.dart';
import '../utils/utils.dart';
import 'package:achievex/provider/appdata_provider.dart';

final _otplessFlutterPlugin = Otpless();

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _otplessFlutterPlugin = Otpless();
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    _otplessFlutterPlugin.initHeadless(AppConstants.OTPLESS_APP_KEY);
    _otplessFlutterPlugin.setHeadlessCallback(onHeadlessResult);
  }

  void route(bool isRoute, String? token, String errorMessage) async {
    if (isRoute) {
      print("Token: $token");

      Navigator.pushNamed(context, RoutesName.home);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage), backgroundColor: Colors.red));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppAuthProvider>(builder: (context, authProvider, child) {
      (authProvider.isLoading) ? CircularProgressIndicator : Container();
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
                          child: Text("Create An\nAccount",
                              style: TextStyle(
                                  fontSize: 28,
                                  fontFamily: 'Poppins',
                                  color: AppColors.blackColor,
                                  fontWeight: FontWeight.w700)),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 0.0),
                          child: Text("On \"Achievex X\"",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  color: AppColors.textNewColor,
                                  fontWeight: FontWeight.w700)),
                        ),
                        const SizedBox(
                          height: 34,
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
                            // height: 50,
                            child: TextField(
                              controller: nameController,
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                border: InputBorder.none,
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Image.asset(
                                    'assets/icons/fname.png',
                                    height: 5,
                                    width: 5,
                                  ),
                                ),
                                hintStyle: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Poppins'),
                                hintText: 'Full Name',
                              ),
                            ),
                          ),
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
                            'By creating an account you agree for out Terms of service and Privacy Policy.',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              const Text('Already An Member ?',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  )),
                              InkWell(
                                onTap: () => {
                                  Navigator.pushNamed(context, RoutesName.login)
                                },
                                child: const Text(' Login',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: AppColors.accentColor,
                                      fontWeight: FontWeight.w600,
                                    )),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 0.0, right: 0, top: 4),
                          child: InkWell(
                            onTap: () {
                              if (mobileNumberController.text.isNotEmpty &&
                                  nameController.text.isNotEmpty) {
                                  sendOtpless(mobileNumberController.text
                                    .toString()
                                    .trim());
                                
                              } else {
                                Utils.showToast('All fields are required');
                                Utils.showFlushbar(
                                    'All fields are required', context);
                              }
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
                        Container(
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
                                offset:
                                    const Offset(0, 1), // Offset of the shadow
                              ),
                            ],
                          ),
                          child: _isLoading ? const Center(child: CircularProgressIndicator()) : InkWell(
                            onTap: () async {
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    // Add your onPressed functionality here
                                  },
                                  icon: Image.asset(
                                    'assets/icons/g_login.png', // Replace with your image file path
                                    width: 24, // Set the width of the image
                                    height: 24, // Set the height of the image
                                  ),
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                const Text(
                                  'Continue With Google',
                                  style: TextStyle(fontWeight: FontWeight.w700),
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
      Map<String, dynamic> arg = {};
      arg["phone"] = mobileNumber;
      arg["countryCode"] = "+91";
      _otplessFlutterPlugin.startHeadless(onHeadlessResult, arg);
  
  }

  void onHeadlessResult(dynamic result) async {
    if (result['statusCode'] == 200) {
      switch (result['responseType'] as String) {
        case 'INITIATE':
          {
            print('Authentication is Intiated !');

            storeNameAndPhoneNumber(nameController.text.toString().trim(),
                mobileNumberController.text.toString().trim());

            Navigator.of(context).pushNamed('/verify_otp', arguments: {
              'name': nameController.text.toString().trim(),
              'number': mobileNumberController.text.toString().trim(),
            });
          }
          break;
        case 'VERIFY':
          {

             isLoggedIn();

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

            await storeAccessToken(token);

            isLoggedIn();

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
          title: const Text('Otp Authentication failed !'),
          content: const Center(
            child: Text(
                'It may be Server issue , wait for some time or Please enter the correct otp or click on resend otp'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
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
