
import '../../utils/app_constants.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../model/response/base/api_response.dart';

class CategoryRepo {
  final DioClient? dioClient;
  CategoryRepo({required this.dioClient});

  Future<ApiResponse> getCategoryList() async {
    try {
      final response = await dioClient!.get(AppConstants.categoryUri);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getSubCategoryList(String parentID) async {
    try {
      final response = await dioClient!.get('${AppConstants.subCategoryUri}$parentID',
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

}