import 'package:achievex/data/model/response/base/api_response.dart';
import 'package:achievex/data/model/response/coupon_model.dart';
import 'package:achievex/data/repository/coupon_repo.dart';
import 'package:achievex/helper/api_checker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CouponProvider extends ChangeNotifier {
  final CouponRepo? couponRepo;
  CouponProvider({required this.couponRepo});

  List<CouponModel>? _couponList;
  CouponModel? _coupon;
  double? _discount = 0.0;
  String? _code = '';
  bool _isLoading = false;

  bool _isCouponApplied = false;

  CouponModel? get coupon => _coupon;
  double? get discount => _discount;
  String? get code => _code;
  bool get isLoading => _isLoading;
  bool get isCouponApplied => _isCouponApplied;
  List<CouponModel>? get couponList => _couponList;

  Future<void> getCouponList(BuildContext context) async {
    ApiResponse apiResponse = await couponRepo!.getCouponList();
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      _couponList = [];
      apiResponse.response!.data.forEach(
          (category) => _couponList!.add(CouponModel.fromJson(category)));
      notifyListeners();
    } else {
      ApiChecker.checkApi(apiResponse);
    }
  }

  Future<double?> applyCoupon(String coupon, double order) async {
    _isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await couponRepo!.applyCoupon(coupon);

    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      _coupon = CouponModel.fromJson(apiResponse.response!.data);
      _code = _coupon!.code;
      if (_coupon!.minPurchase != null && _coupon!.minPurchase! <= order) {
        if (_coupon!.discountType == 'percent') {
          if (_coupon!.maxDiscount != null && _coupon!.maxDiscount != 0) {
            _discount =
                (_coupon!.discount! * order / 100) < _coupon!.maxDiscount!
                    ? (_coupon!.discount! * order / 100)
                    : _coupon!.maxDiscount;
          } else {
            _discount = _coupon!.discount! * order / 100;
          }
        } else {
          if (_coupon!.maxDiscount != null) {
            _discount = _coupon!.discount;
          }
          _discount = _coupon!.discount;
        }
      } else {
        _discount = 0.0;
      }
       
       Fluttertoast.showToast(msg: "Congats! You got $_discount Rs discount");

    } else {
      _discount = 0.0;
             Fluttertoast.showToast(msg: "Coupon code invalid.");

    }


    
    // 
    // if (_discount! >= 10) {
    //   isCouponCodeApplied(true);
    // }

    _isLoading = false;
    notifyListeners();
    return _discount;
  }

  bool isCouponCodeApplied(bool isCouponApplied) {
    // if(isCouponApplied){
    _isCouponApplied = true;

    // }

    notifyListeners();

    return isCouponApplied;
  }

  void removeCouponData(bool notify) {
    _coupon = null;
    _isLoading = false;
    _discount = 0.0;
    _code = '';
    if (notify) {
      notifyListeners();
    }
  }
}
