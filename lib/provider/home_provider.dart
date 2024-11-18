// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:async';

import 'package:achievex/data/repository/home_repo.dart';
import 'package:achievex/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/model/home_model.dart';
import '../data/model/response/base/api_response.dart';
import '../helper/api_checker.dart';

class HomeProvider extends ChangeNotifier {
  final HomeRepo? homeRepo;

  HomeProvider({required this.homeRepo});
  HomeModel? _homeModel;
  bool _isLoading = false;

  HomeModel? get homeModel => _homeModel;
  bool get isLoading => _isLoading;
  bool refreshLimitEnd = false;
  String? defaultQuote;

  SharedPreferences? _prefs;
  bool? _isFirstTime;
  int? _countdown = 0;

  int? get countdown => _countdown!;
  Timer? _timer;
  bool get showPopup => _showPopup;

  Future<void> initializePreferences() async {
    _prefs = await SharedPreferences.getInstance();
    _isFirstTime = _prefs!.getBool('firstTime') ?? true;
    if (_isFirstTime!) {
      _prefs!.setString('First', DateTime.now().toIso8601String());
    }
  }

  void startCountdownTimer() {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
    }

    const oneSecond = Duration(seconds: 1);
    _timer = Timer.periodic(oneSecond, (timer) {
      if (_countdown != null && _countdown! <= 0) {
        timer.cancel();
        _prefs!.setBool('firstTime', false);
      } else {
        _countdown = _countdown != null ? _countdown! - 1 : null;
      }
      print(_countdown?.toString());
      notifyListeners();
    });
  }

  Future<void> getHomeData(BuildContext context) async {
    _isLoading = true;
    final sp = await SharedPreferences.getInstance();
    defaultQuote = sp.getString(AppConstants.defaultQuote);
    int? userId = sp.getInt(AppConstants.userid);
    String idFromPage = sp.getString('category_id').toString();
    String subCatId = sp.getString('subcat_id').toString();
    String childCategory = sp.getString('child_category').toString();

    debugPrint(
        "UserId:: $userId :: Category ID:: $idFromPage :: Sub Cat Id:: $subCatId :: Child Category ID :: $childCategory");
    ApiResponse apiResponse;

    apiResponse = await homeRepo!.getHomeData(childCategory, userId, subCatId);

    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      _homeModel = HomeModel.fromJson(apiResponse.response!.data);

      defaultQuote = sp.getString(AppConstants.defaultQuote.toString());

      // apiResponse.response!.data!.defaultQuote.quote.toString();
    } else {
      ApiChecker.checkApi(apiResponse);
    }
    _isLoading = false;
    // checkIfFirstTime(context);

    notifyListeners();
  }

  Future<void> playVideoOnFullScreen(String videoUrl) async {
    notifyListeners();
  }

  Future<void> saveQuote(String quote) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    if (sp.getString(AppConstants.defaultQuote.toString()) != '') {
      sp.remove(AppConstants.defaultQuote);
    }
    sp.setString(AppConstants.defaultQuote, quote.toString());
    notifyListeners();
  }

  Future<void> refreshData(BuildContext context) async {
    _isLoading = true;
    final sp = await SharedPreferences.getInstance();
    String idFromPage = sp.getString('category_id').toString();
    String userId = sp.getInt(AppConstants.userid).toString();
    String subCatId = sp.getString('subcat_id').toString();
    String childCategory = sp.getString('child_category').toString();
    ApiResponse apiResponse =
        await homeRepo!.getHomeData(idFromPage, userId, subCatId);

    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      print("Rep----->" + apiResponse.response!.data.toString());

      _homeModel = HomeModel.fromJson(apiResponse.response!.data);
    } else {
      ApiChecker.checkApi(apiResponse);
    }
    _isLoading = false;

    notifyListeners();
  }

  Future<String> getSavedCategory(String id) async {
    final sp = await SharedPreferences.getInstance();

    return sp.getString('category_id') ?? '0';
  }

  bool _showPopup = false;
  Timer? _timer1;

  void _startTimer1() {
    const duration = Duration(seconds: 10);
    _timer1 = Timer(duration, () {
      _showPopup = true;
      notifyListeners();
    });
  }

  void _showWarningDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Warning'),
          content: const Text('Daily Limit Reach'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Close the dialog
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
