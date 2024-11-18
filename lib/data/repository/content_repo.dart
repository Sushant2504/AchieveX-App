import '../../utils/app_constants.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../model/response/base/api_response.dart';

class ContentRepo {

  final DioClient? dioClient;
  
  ContentRepo({required this.dioClient});

  Future<ApiResponse> getContentData() async {
    try {
      final response = await dioClient!.get(AppConstants.contentDataUri);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

}
