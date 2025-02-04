// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/model/response/base/api_response.dart';
import '../data/model/response/timetable_model.dart';
import '../data/repository/tips_repo.dart';
import '../helper/api_checker.dart';

class TipsProvider extends ChangeNotifier {

  final TipsRepo? tipsRepo;

  TipsProvider({required this.tipsRepo});
  TimetableModel? _tipsModel;
  bool _isLoading = false;
  List<TimetableModel>? _tipsList;
  TimetableModel? get timetableModel => _tipsModel;
  bool get isLoading => _isLoading;
  List<TimetableModel>? get tipsList => _tipsList;


  Future<void> getTipsTricks() async {
    final sp = await SharedPreferences.getInstance();
    String lastItemId = sp.getString('last_item_id').toString();
    String category = sp.getString('child_category').toString();

    _isLoading = true;
    ApiResponse apiResponse = await tipsRepo!.getTipsData(category, lastItemId);
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      _tipsList = [];

      if(tipsList!.isEmpty){
        sp.setString('last_item_id', '0');
        notifyListeners();
      }

      apiResponse.response!.data.forEach(
          (category) => _tipsList!.add(TimetableModel.fromJson(category)));
    } else {
      ApiChecker.checkApi(apiResponse);
    }
    _isLoading = false;
    notifyListeners();
  }



  Future<void> saveLastId(String lastItemId) async {
    final sp = await SharedPreferences.getInstance();
    sp.setString('last_item_id', lastItemId).toString();
    notifyListeners();
  }


}
