// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:otpless_flutter/otpless_flutter.dart';
import 'package:otpless_flutter/otpless_flutter_method_channel.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:achievex/provider/auth_provider.dart';
import 'package:achievex/provider/auth_provider.dart';
import 'package:achievex/screens/category_screen.dart';
import 'package:achievex/screens/search.dart';
import 'package:achievex/ui/theme.dart';
import 'package:achievex/utils/app_constants.dart';
import 'package:achievex/utils/routes/routes_name.dart';
import 'package:achievex/provider/appdata_provider.dart';
import '../utils/colors.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key});

  
 
  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  bool otpVisibility = false;
  bool isResendVisible = true;
  final loginProvider = AppAuthProvider(authRepo: null);
  String _enteredOtp = "";
  User? user; // Replace with the correct OTP or logic to get it
  TextEditingController otpController = TextEditingController();
  final _otplessFlutterPlugin = Otpless();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  

  @override
  void initState() {
    super.initState();
    _otplessFlutterPlugin.initHeadless(AppConstants.OTPLESS_APP_KEY);
    _otplessFlutterPlugin.setHeadlessCallback(onHeadlessResult);
  }

  @override
  Widget build(BuildContext context) {
    final routesArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final name = routesArgs['name'].toString();
    final number = routesArgs['number'].toString();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('OTP Verification'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Container(
          margin: const EdgeInsets.only(top: 20),
          width: double.infinity,
          child: Column(
            children: [
              const Text(
                "Verification",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Image(image: AssetImage("assets/icons/otp.png")),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 40),
                child: const Text(
                  "Enter the code sent to your number",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 40),
                child: Text(
                  "+91 $number",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
              Pinput(
                length: 4,
                defaultPinTheme: defaultPinTheme,
                controller: otpController,
                focusedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                    border: Border.all(color: Colors.blue),
                  ),
                ),
                onCompleted: (pin) {
                  _enteredOtp = pin;
                },
              ),
              const SizedBox(height: 20),
              TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      WidgetStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () async {
                  //  Search(); // only for the testing purpose
                  verifyOtpless(number, _enteredOtp);
                },
                child: const Text(
                  'Validate',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "otp not received!",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 5),
                  InkWell(
                    onTap: () => sendOtpless(number),
                    child: const Text(
                      "Resend otp",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          
        ),
      ),
    );
  }

  void verifyOtpless(String mobileNumber, String otp) {
    print("mobileNumber");
    if (mobileNumber.isEmpty) {
      print("Mobile Number is not properly given");
    } else {
      Map<String, dynamic> arg = {};
      arg["phone"] = mobileNumber;
      arg["countryCode"] = "+91";
      arg["otp"] = otp;
      _otplessFlutterPlugin.startHeadless(onHeadlessResult, arg);
    }
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
            print("authentication is intiated!");
          }
          break;
        case 'VERIFY':
          {
             isLoggedIn();
            Navigator.pushNamedAndRemoveUntil(context,
                RoutesName.categoryScreen, (route) => false);
          }
          break;
        case 'OTP_AUTO_READ':
          {
            if (Platform.isAndroid) {
              otp = result['response']['otp'] as String;
              isLoggedIn();
              Navigator.pushNamedAndRemoveUntil(
                context, RoutesName.categoryScreen, (route) => false);
            }
          }
          break;
        case 'ONETAP':
          {
            final token = result["response"]["token"];
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
          content: const Text(
              'It may be Server issue , wait for some time or Please enter the correct otp or click on resend otp'),
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

  
}
