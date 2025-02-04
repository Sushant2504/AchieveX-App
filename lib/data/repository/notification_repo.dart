import 'package:achievex/utils/app_constants.dart';

import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../model/response/base/api_response.dart';

class NotificationRepo {
  final DioClient? dioClient;

  NotificationRepo({required this.dioClient});

  Future<ApiResponse> getNotificationData() async {
    try {
      final response = await dioClient!.get(AppConstants.notificationUri);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
