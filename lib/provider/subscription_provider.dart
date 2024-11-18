import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:achievex/data/datasource/remote/dio/dio_client.dart';
import 'package:achievex/utils/app_constants.dart';
import 'package:achievex/utils/routes/routes_name.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:phonepe_payment_sdk/phonepe_payment_sdk.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SubscriptionProvider extends ChangeNotifier {
  String checksum = "";

  Map<String, String> headers = {};
  List<String> environmentList = <String>['SANDBOX', 'PRODUCTION'];
  bool enableLogs = true;
  Object? result;
  String body = "";
  String callback = "flutterDemoApp";
  String? status;
  String? error;
  String apiEndPoint = "/pg/v1/pay";

  SubscribePlan? subscribePlan;
  SharedPreferences? sp;
  bool? _IS_PREMIUM = false;

  String? _PLAN_ID = "";
  bool _lockAds = false;
  bool? _evaAi;
  bool? _allFeatureAccess;
  bool? _allCoursesAccess;
  // final bool _isFirst10Min = true;
  bool? shutleGame = false;
  bool? stroopGame = false;
  int? _referCount;

  bool? get IS_PREMIUM => _IS_PREMIUM;

  String? get PLAN_ID => _PLAN_ID;
  bool get lockAds => _lockAds;
  bool? get evaAi => _evaAi;
  bool? get allFeatureAccess => _allFeatureAccess;
  bool? get allCoursesAccess => _allCoursesAccess;
  int? get referCount => _referCount;

  // Future<bool> get isFirst10Min async {
  //   SharedPreferences sp = await SharedPreferences.getInstance();
  //   final a = sp.getString('First') ?? '';
  //   if (a.isNotEmpty) {
  //     final diff = DateTime.now().difference(DateTime.parse(a));
  //     final f10 = diff.inSeconds < (10 * 60 + 1);
  //     return f10;
  //   }

  //   return false;
  // }

  Future<void> checkSubscription( BuildContext context) async {
    try {
      SharedPreferences sp = await SharedPreferences.getInstance();

      final response = await http.get(
        Uri.parse(AppConstants.checkSubscriptionPlan +
            sp.getInt(AppConstants.userid).toString()),
      );

      debugPrint(
          "-------->${AppConstants.checkSubscriptionPlan}${sp.getInt(AppConstants.userid)}");

      if (response.statusCode == 200) {
        // Request successful, handle response
        debugPrint('Response body: ${response.body}');

        if (response.body == '{"msg":"not subscribed"}') {
          Fluttertoast.showToast(msg: 'Not subscribed');
        } else {
          Map<String, dynamic> data = json.decode(response.body);

          // Access the 'subscription' key from the map to get the list of subscriptions
          List<dynamic> subscriptions = data['subscription'];
          DateTime today = DateTime.now();

          // Iterate over the list of subscriptions and access individual subscription data
          for (var subscription in subscriptions) {
            int id = subscription['id'];
            int userId = subscription['user_id'];
            int duration = subscription['duration'];
            int amount = subscription['amount'];
            String createdAt = subscription['created_at'].toString();
            String updatedAt = subscription['updated_at'].toString();
            String purchaseDate = subscription['purchase_date'].toString();
            String expireDate = subscription['expire_date'].toString();
            String couponCode = subscription['coupon_code'].toString();

            DateTime purchaseDate1 =
                DateTime.parse(subscription['purchase_date']);
            DateTime expireDate1 = DateTime.parse(subscription['expire_date']);

            // Check if today's date is within the subscription period
            if (today.isAfter(purchaseDate1) && today.isBefore(expireDate1)) {
              debugPrint('ID: $id');
              debugPrint('User ID: $userId');
              debugPrint('Duration: $duration');
              debugPrint('Amount: $amount');
              debugPrint('Created At: $createdAt');
              debugPrint('Updated At: $updatedAt');
              debugPrint('Purchase Date: $purchaseDate');
              debugPrint('Expire Date: $expireDate');
              debugPrint('Coupon Code: $couponCode');
              debugPrint('Subscription is active.');

              _IS_PREMIUM = true;

              // if (!_isFirst10Min) {
              // if (duration == 30) {
              //   _PLAN_ID = "0";
              //   _lockAds = true;
              //   _evaAi = true;
              //   _evaAi = true;
              //   _allFeatureAccess = true;
              //   // Fluttertoast.showToast(msg: "Your plan id is $_PLAN_ID");
              // }
              if (duration == 180) {
                _PLAN_ID = "1";
                _lockAds = true;
                _evaAi = false;
                _allFeatureAccess = true;
              }

              if (duration == 365 || amount == 399 && amount > 300) {
                _PLAN_ID = "2";
                _lockAds = true;
                _evaAi = false;
                _allFeatureAccess = true;
                _allCoursesAccess = false;
              }

              if (duration >= 375 && amount > 500) {
                _PLAN_ID = "3";
                _lockAds = true;
                _evaAi = true;
                _allFeatureAccess = true;
                _allCoursesAccess = true;
              }
              // _IS_PREMIUM = false;
              // _lockAds = false;
              // _evaAi = false;
              // _allFeatureAccess = false;
              // _allCoursesAccess = false;
              // sp.setBool(AppConstants.IS_PREMIUM, false);
              // unlockFeaturesPlanWise();
              debugPrint("Premium: $_IS_PREMIUM Plan Id: $_PLAN_ID");
            }
            // } else {
            //   _lockAds = true;
            //   _evaAi = true;
            //   _allFeatureAccess = true;
            //   _allCoursesAccess = false;
            // }
          }
        }
      } else {
        // Request failed with status code
        debugPrint('Error: ${response.reasonPhrase}');
      }
    } catch (e) {
      // Request failed due to an error
      debugPrint('Error: $e');
    }
    notifyListeners();
  }

  Future<int> checkTotalRefferalsFriends() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    final response = await http.get(
      Uri.parse(AppConstants.chekReferCount +
          sp.getInt(AppConstants.userid).toString()),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);

// Access the value of the "count" property
      int count = jsonResponse['count'];

      _referCount = count;
      debugPrint("----->$_referCount");

      // debugdebugPrint("----->$count");
    } else {
      debugPrint("----->${response.body}");
    }

    return _referCount ?? 0;
  }

  void getPackageSignatureForAndroid() {
    if (Platform.isAndroid) {
      PhonePePaymentSdk.getPackageSignatureForAndroid()
          .then((packageSignature) => {
                result = 'getPackageSignatureForAndroid - $packageSignature',
                debugPrint('res--->$result'),
                notifyListeners(),
              })
          .catchError((error) {
        handleError(error);
        return <dynamic>{};
      });
    }
  }

  void initPhonePeSdk() {
    PhonePePaymentSdk.init(AppConstants.ENVIRONMENT_VALUE, '',
            AppConstants.MERACHANT_ID, enableLogs)
        .then((isInitialized) => {
              result = 'PhonePe SDK Initialized - $isInitialized',
              notifyListeners(),
            })
        .catchError((error) {
      handleError(error);
      return <dynamic>{};
    });
    //  body = getCheckSum().toString();
  }

  void startSubscribe(int planIndex, int amount, int duration,
      BuildContext context, String? couponCode) async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    startTransaction(
        planIndex,
        context,
        SubscribePlan(
            user_id: sp.getInt(AppConstants.userid) ?? 0,
            amount: amount,
            duration: duration,
            couponCode: couponCode),
        couponCode);

    // purchasePlan(context, SubscribePlan(
    // user_id: sp.getInt(AppConstants.userid) ?? 0,
    // amount: amount,
    // duration: duration));
  }

  void startTransaction(int planIndex, BuildContext context,
      SubscribePlan subscribePlan, String? couponCode) async {

        if(subscribePlan.amount == 0){
      
           subscribePlan = SubscribePlan(user_id: subscribePlan.user_id, amount: (planIndex ==3) ?  799 : 599, duration: subscribePlan.duration);

           purchasePlan(context, subscribePlan,couponCode);
           return;
        }
    //  purchasePlan(context, subscribePlan,couponCode);

    final requestData = {
      "merchantId": AppConstants.MERACHANT_ID,
      "merchantTransactionId": generateMerchantTransactionId(),
      "merchantUserId": generateNumericId(),
      "amount": subscribePlan.amount * 100,
      "callbackUrl":
          "https://webhook.site/94d2f42f-7e89-4f9f-a85a-50ae556256e5",
      "mobileNumber": "99999999",
      "paymentInstrument": {"type": "PAY_PAGE"}
    };

    String base64Body = base64.encode(utf8.encode(json.encode(requestData)));

    checksum =
        '${sha256.convert(utf8.encode(base64Body + apiEndPoint + AppConstants.SALT_KEY))}###${AppConstants.SALT_INDEX}';

    debugPrint('checksum--> : $checksum');

    body = base64Body;

    //getCheckSum(subscribePlan.amount, subscribePlan.user_id).toString();

    try {
      PhonePePaymentSdk.startTransaction(body, callback, checksum, '')
          .then((response) => {
                debugPrint('payment_response---->$response'),
                status = response!['status'].toString(),
                error = response['error'].toString(),
                debugPrint('$status--PaymentStatus'),
                if (status == 'SUCCESS')
                  {

                    // result = "-------->Flow Completed - Status: Success!",
                    purchasePlan( context, subscribePlan, couponCode),
                  }
                else
                  {
                    result =
                        "--------->Flow Completed - Status: $status and Error: $error",
                  }
              })
          .catchError((error) {
        handleError(error);
        return <dynamic>{};
      });
    } catch (error) {
      handleError(error);
    }
  }

  void handleError(error) {
    if (error is Exception) {
      result = error.toString();
    } else {
      result = {"error": error};
    }
    notifyListeners();
  }

  String generateMerchantTransactionId() {
    String prefix = 'MT';
    String randomNumber1 = Random().nextInt(10000).toString().padLeft(4, '0');
    String randomNumber2 = Random().nextInt(10000).toString().padLeft(4, '0');
    String randomNumber3 = Random().nextInt(10000).toString().padLeft(4, '0');
    String randomNumber4 = Random().nextInt(10000).toString().padLeft(4, '0');
    debugPrint(
        '$prefix$randomNumber1$randomNumber2$randomNumber3$randomNumber4');
    return '$prefix$randomNumber1$randomNumber2$randomNumber3$randomNumber4';
  }

  String generateNumericId() {
    DateTime now = DateTime.now();
    int timestamp =
        now.microsecondsSinceEpoch; // Get current timestamp in microseconds
    String numericId = timestamp
        .toString()
        .substring(7, 15); // Extract 8 digits starting from the 7th digit
    debugPrint(numericId.toString());

    return numericId;
  }

  DioClient? dioClient;

  Future<void> purchasePlan(
      BuildContext context, SubscribePlan data, String? coupon) async {
    try {
      final response = await http.post(
        Uri.parse(AppConstants.subscibePlan),
        body: json.encode(data),
        headers: {
          'Content-Type': 'application/json',
          // Add any additional headers if needed
        },
      );

      if (response.statusCode == 200) {
        // Request successful, handle response
        debugPrint('Response body: ${response.body}');

        SharedPreferences sp = await SharedPreferences.getInstance();

        Fluttertoast.showToast(msg: 'You are now premium user');

        IS_PREMIUM == true;
        Navigator.pushNamedAndRemoveUntil(
            context, RoutesName.splash, (route) => false);
      } else {
        // Request failed with status code
        debugPrint('Error: ${response.reasonPhrase}');
      }
    } catch (e) {
      // Request failed due to an error
      debugPrint('Error: $e');
    }
  }

  // Future<void> applyCoupon(BuildContext context, String code) async {
  //   try {
  //     final response = await http.get(
  //       Uri.parse(
  //           '${AppConstants.baseUrl}${AppConstants.applyCoupon}?code=$code'),
  //     );

  //     if (response.statusCode == 200) {
  //       // Request successful, handle response
  //       debugPrint('Response body: ${response.body}');
  //       Fluttertoast.showToast(msg: response.body.toString());
  //     } else {
  //       // Request failed with status code
  //       debugPrint('Error: ${response.reasonPhrase}');
  //     }
  //   } catch (e) {
  //     // Request failed due to an error
  //     debugPrint('Error: $e');
  //   }
  // }
}

class SubscribePlan {
  final int user_id;
  final int amount;
  final int duration;
  final String? couponCode;

  SubscribePlan(
      {required this.user_id,
      required this.amount,
      required this.duration,
      this.couponCode});

  Map<String, dynamic> toJson() {
    return {
      'user_id': user_id,
      'amount': amount,
      'duration': duration,
      'coupon_code': couponCode,
    };
  }
}
