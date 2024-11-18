import 'dart:convert';

import 'package:achievex/data/model/response/user_model.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/app_constants.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../model/response/base/api_response.dart';
import '../model/response/social_login_model.dart';

class AuthRepo {
  final DioClient? dioClient;

  AuthRepo? authRepo;
  final SharedPreferences? sharedPreferences;
  AuthRepo({required this.dioClient, required this.sharedPreferences});

  Future<ApiResponse> registration(Data signUpModel) async {
      String jsonData = jsonEncode(signUpModel);


    try {
      Response response = await dioClient!.post(
        AppConstants.registerUri,
        data: jsonData,
      );
            print('signUpModel--------->${jsonEncode(signUpModel)}');

      print('response--------->$response');
      return ApiResponse.withSuccess(response);
    } catch (e) {
            print('response--------->$e');

      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
    
  }

  Future<ApiResponse> checkPhoneExist(String phone) async {
    try {
      Response response = await dioClient!
          .post(AppConstants.checkPhone, data: {"mobile": phone});
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

    Future<ApiResponse> checkEmailExist(String email) async {
    try {
      Response response = await dioClient!
          .post(AppConstants.checkEmail, data: {"email": email});
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> socialLogin(SocialLoginModel socialLogin) async {
    try {
      Response response = await dioClient!.post(
        AppConstants.socialLogin,
        data: socialLogin.toJson(),
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  // for  user token
  Future<void> saveUserToken(String token) async {
    dioClient!.updateHeader(getToken: token);

    try {
      await sharedPreferences!.setString(AppConstants.token, token);
    } catch (e) {
      rethrow;
    }
  }

  String getUserToken() {
    return sharedPreferences!.getString(AppConstants.token) ?? "";
  }

  Future<ApiResponse> updateToken() async {
    try {
      String? deviceToken = '@';

      if (defaultTargetPlatform == TargetPlatform.iOS) {
        FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
            alert: true, badge: true, sound: true);
        NotificationSettings settings =
            await FirebaseMessaging.instance.requestPermission(
          alert: true,
          announcement: false,
          badge: true,
          carPlay: false,
          criticalAlert: false,
          provisional: false,
          sound: true,
        );
        if (settings.authorizationStatus == AuthorizationStatus.authorized) {
          deviceToken = (await getDeviceToken())!;
        }
      } else {
        deviceToken = (await getDeviceToken())!;
      }

      Response response = await dioClient!.post(
        AppConstants.tokenUri,
        data: {"_method": "put", "cm_firebase_token": deviceToken},
      );

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<String?> getDeviceToken() async {
    String? deviceToken = '@';
    try {
      deviceToken = (await FirebaseMessaging.instance.getToken())!;
        debugPrint('deviceTokenFromGetD====> $deviceToken');
        saveUserToken(deviceToken);
    } catch (error) {
      debugPrint('eroor ====> $error');
    }
    if (deviceToken != null) {
      debugPrint('--------Device Token---------- $deviceToken');
    }

    return deviceToken;
  }
}
