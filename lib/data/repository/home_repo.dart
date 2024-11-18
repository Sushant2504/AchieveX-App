import '../../utils/app_constants.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../model/response/base/api_response.dart';

class HomeRepo {
  final DioClient? dioClient;
  HomeRepo({required this.dioClient});

  Future<ApiResponse> getHomeData(id,userid,cid) async {
    try {
      final response = await dioClient!.get('${AppConstants.homeDataUri}/$id/$cid');
      print('---->${AppConstants.homeDataUri}/$id/$cid');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
