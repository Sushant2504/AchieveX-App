import 'package:achievex/data/repository/videos_repo.dart';
import 'package:flutter/cupertino.dart';

import '../data/model/response/base/api_response.dart';
import '../data/model/response/video_model.dart';
import '../helper/api_checker.dart';

class VideosProvider extends ChangeNotifier {
  final VideosRepo? videosRepo;

  VideosProvider({required this.videosRepo});
  Videos? _videosModel;
  bool _isLoading = false;

  List<Videos>? _videoList;

  Videos? get videosModel => _videosModel;
  bool get isLoading => _isLoading;
  List<Videos>? get videoList => _videoList;

  Future<void> getVideosData() async {
    _isLoading = true;
    ApiResponse apiResponse = await videosRepo!.getVideos();

    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
           _videoList = [];
                   apiResponse.response!.data.forEach((category) => _videoList!.add(Videos.fromJson(category)));

      // _videosModel = Videos.fromJson(apiResponse.response!.data);
    } else {
      ApiChecker.checkApi(apiResponse);
    }
    _isLoading = false;

    notifyListeners();
  }
}
