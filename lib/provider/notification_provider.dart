// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:achievex/data/model/response/notification_model.dart';
import 'package:achievex/data/repository/notification_repo.dart';
import 'package:flutter/material.dart';
import '../data/model/response/base/api_response.dart';
import '../helper/api_checker.dart';

class NotificationProvider extends ChangeNotifier {
  final NotificationRepo? notificationRepo;

NotificationProvider({required this.notificationRepo});
  NotificationModel? _contentModel;
  bool _isLoading = false;

  NotificationModel? get contentModel => _contentModel;
  bool get isLoading => _isLoading;
    List<NotificationModel>? _notificationList;
  List<NotificationModel>? get notificationList => _notificationList;


  Future<void> getNotifications() async {
    _isLoading = true;
    _notificationList = null;
    ApiResponse apiResponse = await notificationRepo!.getNotificationData();
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
            _notificationList = [];
            apiResponse.response!.data.forEach(
            (category) => _notificationList!.add(NotificationModel.fromJson(category)));

            print("check------->"+_notificationList!.length.toString());
      // _contentModel = NotificationModel.fromJson(apiResponse.response!.data);
    } else {
      ApiChecker.checkApi(apiResponse);
    }
    _isLoading = false;
    notifyListeners();
  }
}
