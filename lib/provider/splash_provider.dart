import 'package:achievex/provider/auth_provider.dart';
import 'package:achievex/utils/routes/routes_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/model/response/user_model.dart';

class SplashProvider extends ChangeNotifier {
  bool? _isFirstTime;

  bool? get isFirstTime => _isFirstTime;

  Future<Data> getUserData() => AppAuthProvider(authRepo: null).getUser();

  void checkUserAuth(BuildContext context) async {
    getUserData().then((value) {
      debugPrint("NAME::${value.fName} PHONE::${value.phone} ID::${value.id}");
      if (value.fName != '' && value.phone != null && value.id != null) {
        Navigator.pushNamedAndRemoveUntil(
            context, RoutesName.home, (Route<dynamic> route) => false);
      } else {
        Navigator.pushNamedAndRemoveUntil(
            context, RoutesName.start_journey, (Route<dynamic> route) => false);
      }
    });
  }
}
