import '../../utils/app_constants.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../model/response/base/api_response.dart';

class TipsRepo{

  final DioClient? dioClient;
  
  TipsRepo({required this.dioClient});

  Future<ApiResponse> getTipsData(String category,String userid) async {
    try {
      final response = await dioClient!.get('${AppConstants.tipsDataUri}/$category/$userid');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

}
