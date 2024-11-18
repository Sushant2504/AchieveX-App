import 'package:achievex/data/model/response/demotivation_model.dart';
import 'package:achievex/data/repository/demotivation_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/model/response/base/api_response.dart';
import '../helper/api_checker.dart';
import 'package:just_audio/just_audio.dart';

class DemotivationProvider extends ChangeNotifier {
  final DemotivationRepo? demotivationRepo;

  DemotivationProvider({required this.demotivationRepo});

  DemotivationModel? _demotivationModel;
  bool _isLoading = false;

  DemotivationModel? get demotivationModel => _demotivationModel;
  bool get isLoading => _isLoading;

  bool isPlayingAudio1 = false;
  bool isPlayingAudio2 = false;
  var player1 = AudioPlayer();
  var player2 = AudioPlayer(); // Create a player

  Future<void> getDemotivationProviderData() async {
    final sp = await SharedPreferences.getInstance();

    String category = sp.getString('category_id').toString();
    _isLoading = true;

    ApiResponse apiResponse =
        await demotivationRepo!.getDemotivationVideo(category, '0');

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



  void onBackPress() {

    notifyListeners();
  }
}
