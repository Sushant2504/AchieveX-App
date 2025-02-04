import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/app_constants.dart';
import '../datasource/remote/dio/dio_client.dart';


class SplashRepo {
  final DioClient? dioClient;
  SharedPreferences sharedPreferences;
  SplashRepo({required this.sharedPreferences, required this.dioClient});
  late String username, phone, email;
  late bool isLogin;
  late Map<String, dynamic> map;

  Future<Map<String, dynamic>> getSharedData() async {
    sharedPreferences = await SharedPreferences.getInstance();

    username = sharedPreferences.getString(AppConstants.userName) ?? '';
    phone = sharedPreferences.getString(AppConstants.phone) ?? '';
    email = sharedPreferences.getString(AppConstants.email) ?? '';
    isLogin = sharedPreferences.getBool(AppConstants.isLogin) ?? false;

    map = {
      "username": username,
      "phone": phone,
      "email": email,
      "islogin": isLogin,
    };

    return map;
  }
}
