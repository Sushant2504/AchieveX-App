// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/model/response/base/api_response.dart';
import '../data/model/response/timetable_model.dart';
import '../data/repository/timetable_repo.dart';
import '../helper/api_checker.dart';

class TimetableProvider extends ChangeNotifier {
  final TimetableRepo? timetableRepo;

  TimetableProvider({required this.timetableRepo});
  TimetableModel? _timetableModel;
  bool _isLoading = false;
  List<TimetableModel>? _timetableList;

  TimetableModel? get timetableModel => _timetableModel;
  bool get isLoading => _isLoading;
  List<TimetableModel>? get timetableList => _timetableList;
  Future<void> getTimeTable() async {
    final sp = await SharedPreferences.getInstance();
    String category = sp.getString('child_category').toString();
    String lastTImeTableId = sp.getString('last_timetable_id').toString();
    _isLoading = true;
    ApiResponse apiResponse =
        await timetableRepo!.getTimeTableData(category, lastTImeTableId);
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      _timetableList = [];

      apiResponse.response!.data.forEach(
          (category) => _timetableList!.add(TimetableModel.fromJson(category)));
      if (_timetableList!.isEmpty) {
        sp.setString('last_timetable_id', '0');
        notifyListeners();
      }

      // Utils.showToast(_timetableList!.length.toString());
      // _timetableModel = TimetableModel.fromJson(apiResponse.response!.data);
    } else {
      ApiChecker.checkApi(apiResponse);
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> saveLastTimetableId(String lastTImeTableId) async {
    final sp = await SharedPreferences.getInstance();
    sp.setString('last_timetable_id', lastTImeTableId).toString();
    notifyListeners();
  }
}
