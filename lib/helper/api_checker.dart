

import '../data/model/response/base/api_response.dart';
import '../data/model/response/base/error_response.dart';

class ApiChecker {
  static void checkApi(ApiResponse apiResponse) {
    ErrorResponse error = getError(apiResponse);
//config-missing
    // if( error.errors![0].code == '401' || error.errors![0].code == 'auth-001'
    //     && ModalRoute.of(Get.context!)?.settings.name != Routes.getLoginRoute()) {
    //   Provider.of<SplashProvider>(Get.context!, listen: false).removeSharedData();

    //   if( ModalRoute.of(Get.context!)!.settings.name != Routes.getLoginRoute()) {
    //     Navigator.pushNamedAndRemoveUntil(Get.context!, Routes.getLoginRoute(), (route) => false);
    //   }
    // }else {
    //   showCustomSnackBar(error.errors![0].message);
    // }
  }

  static ErrorResponse getError(ApiResponse apiResponse){
    ErrorResponse error;

    try{
      error = ErrorResponse.fromJson(apiResponse);
    }catch(e){
      if(apiResponse.error is String){
        error = ErrorResponse(errors: [Errors(code: '', message: apiResponse.error.toString())]);

      }else{
        error = ErrorResponse.fromJson(apiResponse.error);
      }
    }
    return error;
  }
}