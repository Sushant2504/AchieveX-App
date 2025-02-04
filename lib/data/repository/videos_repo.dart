import '../../utils/app_constants.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../model/response/base/api_response.dart';

class VideosRepo{
   final DioClient? dioClient;
  VideosRepo({required this.dioClient});

  Future<ApiResponse> getVideos() async {
    try {
      final response = await dioClient!.get(AppConstants.videosDataUri);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}