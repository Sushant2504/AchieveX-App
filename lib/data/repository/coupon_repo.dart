import 'package:achievex/data/datasource/remote/dio/dio_client.dart';
import 'package:achievex/data/datasource/remote/exception/api_error_handler.dart';
import 'package:achievex/data/model/response/base/api_response.dart';
import 'package:achievex/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CouponRepo {
  final DioClient? dioClient;
  CouponRepo({required this.dioClient});

  Future<ApiResponse> getCouponList() async {
    try {
      final response =
          await dioClient!.get('${AppConstants.baseUrl}/api/v1/coupon/list');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(''));
    }
  }

  Future<ApiResponse> applyCoupon(String couponCode) async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    int? userID = sp.getInt(AppConstants.userid);

    try {
      final response = await dioClient!.get(
          '${AppConstants.baseUrl}${AppConstants.applyCoupon}?code=$couponCode&user_id=$userID');

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
