import 'package:achievex/data/model/response/appdata_model.dart';
import 'package:achievex/data/repository/app_setting_repo.dart';
import 'package:achievex/ui/theme.dart';
import 'package:achievex/utils/app_constants.dart';
import 'package:achievex/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/model/response/base/api_response.dart';
import '../helper/api_checker.dart';



Future<void> storeAccessToken(String accessToken) async {
  print("get token");
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('accessToken', accessToken);
  isLoggedIn();
}

Future<bool> isLoggedIn() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? accessToken = prefs.getString('accessToken');
  return accessToken != null;
}

Future<void> logout(context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('accessToken');
  Navigator.pushNamedAndRemoveUntil(
            context, RoutesName.start_journey, (Route<dynamic> route) => false);
}

Future<void> storeNameAndPhoneNumber(String name, String phoneNumber) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('name', name);
  await prefs.setString('phoneNumber', phoneNumber);
}

Future<Map<String, String>> retrieveNameAndPhoneNumber() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String name = prefs.getString('name') ?? '';
  String phoneNumber = prefs.getString('phoneNumber') ?? '';
  return {'name': name, 'phoneNumber': phoneNumber};
}

class AppdataProvider extends ChangeNotifier {
  final AppRepo? appRepo;

  AppdataProvider({required this.appRepo});
  AppDataModel? _appdataModel;
  bool _isLoading = false;

  String? _userName;
  String? _emailId;
  String? _phoneNum;
  String? _profileUri;

  String? get username => _userName;
  String? get email => _emailId;
  String? get phone => _phoneNum;
  String? get profileUrl => _profileUri;

  AppDataModel? get appdataModel => _appdataModel;
  bool get isLoading => _isLoading;

  Future<void> getAppData() async {
    _isLoading = true;

    ApiResponse apiResponse = await appRepo!.getAppData();

    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      _appdataModel = AppDataModel.fromJson(apiResponse.response!.data);
    } else {
      ApiChecker.checkApi(apiResponse);
    }
    _isLoading = false;

    notifyListeners();
  }

  void getSharedData() async {
    var prefs = await SharedPreferences.getInstance();

    _userName = prefs.getString(AppConstants.userName).toString();
    _phoneNum = prefs.getString(AppConstants.phone).toString();
    _emailId = prefs.getString(AppConstants.email).toString();
    _profileUri = prefs.getString(AppConstants.profileUrl).toString();

    // debugPrint("userEmail ::::$_emailId");
    notifyListeners();
  }

  Future<void> showLogoutConfirmationDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible:
          false, // Prevents closing the dialog by tapping outside
      builder: (BuildContext context) {
        // Customize the appearance of the dialog
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                15.0), // Adjust the border radius as needed
          ),
          title: const Text(
            'Log Out',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: AppColors.accentColor),
            textAlign: TextAlign.center,
          ),
          content: const Text(
              'Are you sure you want to log out? we can’t notify you of new notification if you do.?'),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            // ElevatedButton(
            //   child: const Text('Logout'),
            //   onPressed: () {
            //     AppAuthProvider authProvider = AppAuthProvider(authRepo: null);
            //     if (email!.isEmpty) {
            //       authProvider.logOutUser();
            //     } else {
            //       authProvider.socialLogout();
            //     }

            //     notifyListeners();
            //     Navigator.of(context).pop();
            //     Navigator.pushNamed(context, RoutesName.splash);
            //     // Close the dialog
            //   },
            // ),
          ],
        );
      },
    );
  }
}
