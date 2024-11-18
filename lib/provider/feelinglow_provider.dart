
import 'package:achievex/data/model/response/demotivation_model.dart';
import 'package:achievex/data/repository/feelinglow_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/model/response/base/api_response.dart';
import '../helper/api_checker.dart';

class FeelinglowProvider extends ChangeNotifier {
  final FeelinglowRepo? feelinglowRepo;

  FeelinglowProvider({required this.feelinglowRepo});

  DemotivationModel? _demotivationModel;
  bool _isLoading = false;
  String _category = '';
  DemotivationModel? get demotivationModel => _demotivationModel;
  bool get isLoading => _isLoading;
  String get category => _category;

  Future<void> getFeelingLowProviderData() async {
    final sp = await SharedPreferences.getInstance();

     _category = sp.getString('category_id').toString();
    _isLoading = true;

    ApiResponse apiResponse =
        await feelinglowRepo!.getFeelingLowVideo(_category, '0');

    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      _demotivationModel =
          DemotivationModel.fromJson(apiResponse.response!.data);
      notifyListeners();
    } else {
      ApiChecker.checkApi(apiResponse);
    }
    _isLoading = false;

    notifyListeners();
  }
}
