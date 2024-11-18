import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/model/response/base/api_response.dart';
import '../data/model/response/category_model.dart';
import '../data/repository/category_repo.dart';
import '../helper/api_checker.dart';

class CategoryProvider extends ChangeNotifier {
  final CategoryRepo? categoryRepo;

  CategoryProvider({required this.categoryRepo});

  List<CategoryModel>? _categoryList;
  List<CategoryModel>? _subCategoryList;
  // List<Product>? _categoryProductList;
  bool _pageFirstIndex = true;
  bool _pageLastIndex = false;
  bool _isLoading = false;
  String? _selectedSubCategoryId;

  List<CategoryModel>? get categoryList => _categoryList;
  List<CategoryModel>? get subCategoryList => _subCategoryList;
  // List<Product>? get categoryProductList => _categoryProductList;
  bool get pageFirstIndex => _pageFirstIndex;
  bool get pageLastIndex => _pageLastIndex;
  bool get isLoading => _isLoading;
  String? get selectedSubCategoryId => _selectedSubCategoryId;

  Future<void> getCategoryList(bool reload) async {
    _subCategoryList = null;
    if (_categoryList == null || reload) {
      _isLoading = true;
      ApiResponse apiResponse = await categoryRepo!.getCategoryList();
      if (apiResponse.response != null &&
          apiResponse.response!.statusCode == 200) {
            print("category data is get loaded !");
            
        _categoryList = [];
        apiResponse.response!.data.forEach(
            (category) => _categoryList!.add(CategoryModel.fromJson(category)));
            
        print("loaded !");
           
      } else {
        ApiChecker.checkApi(apiResponse);
      }
      _isLoading = false;
      notifyListeners();
    }
  }

  void getSubCategoryList(String categoryID) async {
    _subCategoryList = null;
    _isLoading = true;
    ApiResponse apiResponse =
        await categoryRepo!.getSubCategoryList(categoryID);
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
          print("data loaded");
      _subCategoryList = [];
      apiResponse.response!.data.forEach((category) =>
          _subCategoryList!.add(CategoryModel.fromJson(category)));
      // getCategoryProductList(categoryID);
    } else {
      ApiChecker.checkApi(apiResponse);
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> saveCategory(
      String childId, String categoryId, String childCategory) async {
    final sp = await SharedPreferences.getInstance();
    debugPrint(
        "category id ==>$childId : child category id ==> $childCategory");

    sp.setString('subcat_id', childId);
    sp.setString('category_id', categoryId);
    sp.setString('child_category', childCategory);
    sp.setString('last_item_id', '0');

    notifyListeners();
  }

  int _selectCategory = -1;

  int get selectCategory => _selectCategory;

  updateSelectCategory(int index) {
    _selectCategory = index;
    notifyListeners();
  }

  updateProductCurrentIndex(int index, int totalLength) {
    if (index > 0) {
      _pageFirstIndex = false;
      notifyListeners();
    } else {
      _pageFirstIndex = true;
      notifyListeners();
    }
    if (index + 1 == totalLength) {
      _pageLastIndex = true;
      notifyListeners();
    } else {
      _pageLastIndex = false;
      notifyListeners();
    }
  }
}
