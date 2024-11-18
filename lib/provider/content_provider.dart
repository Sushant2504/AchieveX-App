// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:achievex/data/model/response/content_model.dart';
import 'package:flutter/material.dart';
import '../data/model/response/base/api_response.dart';
import '../data/repository/content_repo.dart';
import '../helper/api_checker.dart';

class ContentProvider extends ChangeNotifier {
  final ContentRepo? contentRepo;

  ContentProvider({required this.contentRepo});
  ContentModel? _contentModel;
  bool _isLoading = false;

  ContentModel? get contentModel => _contentModel;
  bool get isLoading => _isLoading;

  Future<void> getContentData() async {
    _isLoading = true;
    ApiResponse apiResponse = await contentRepo!.getContentData();
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      _contentModel = ContentModel.fromJson(apiResponse.response!.data);
    } else {
      ApiChecker.checkApi(apiResponse);
    }
    _isLoading = false;
    notifyListeners();
  }
}
