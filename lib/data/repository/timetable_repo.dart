import '../../utils/app_constants.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../model/response/base/api_response.dart';

class TimetableRepo{

  final DioClient? dioClient;
  
  TimetableRepo({required this.dioClient});

  Future<ApiResponse> getTimeTableData(String category,String subcategory) async {
    try {
      final response = await dioClient!.get('${AppConstants.timetableDataUri}/$category/$subcategory');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

}
