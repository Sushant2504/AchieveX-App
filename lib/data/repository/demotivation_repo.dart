
import '../../utils/app_constants.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../model/response/base/api_response.dart';

class DemotivationRepo {
  final DioClient? dioClient;
  DemotivationRepo({required this.dioClient});

  Future<ApiResponse> getDemotivationVideo(String categoryId,String userID) async {
    try {
      final response = await dioClient!.get('${AppConstants.demotivationUri}$categoryId/$userID');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

}