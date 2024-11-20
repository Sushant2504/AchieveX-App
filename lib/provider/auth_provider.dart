import 'dart:async';
import 'dart:io';
import 'package:achievex/data/repository/authentication_repo.dart';
import 'package:achievex/provider/home_provider.dart';
import 'package:achievex/utils/app_constants.dart';
import 'package:achievex/utils/routes/routes_name.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/model/response/base/api_response.dart';
import 'package:otpless_flutter/otpless_flutter.dart';
import '../data/model/response/user_model.dart';
import '../helper/api_checker.dart';
import '../utils/utils.dart';
import 'package:achievex/provider/appdata_provider.dart';
import 'package:achievex/screens/register_screen.dart';

var otp;

// firebaseauth _auth =

// Future<String> loginUser({
//       required String email,
//       required String password,
//    }) async {
     
//      String res = "Some error occurred";

//      try{
          
//           if(email.isNotEmpty || password.isNotEmpty) {
//              await _auth.signInWithEmailAndPassword(email: email, password: password);
//              res = "success";
//           }else{
//              res = "user need to enter all the feeds!";
//           }
//      } catch(err) {
//          res = err.toString();
//      }

//      return res;
//   }


final _auth = FirebaseAuth.instance;


Future<UserCredential?> loginwithGoogle() async {
     try{
           final googleUser = await GoogleSignIn().signIn();

           final googleAuth = await googleUser?.authentication;
           var token;

           final cred = GoogleAuthProvider.credential(
            idToken: googleAuth?.idToken, 
            accessToken: googleAuth?.accessToken,
            // token = idToken;
            );

            storeAccessToken(googleAuth!.accessToken.toString());

           return await _auth.signInWithCredential(cred);


     } catch (e) {
       print(e.toString());
     }
     return null;
}


Future<UserCredential> signInWithGoogle() async {
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  if (googleUser != null) {
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  } else {
    // Handle sign-in cancellation
    throw FirebaseAuthException(
      code: 'sign_in_cancelled',
      message: 'Google sign-in cancelled',
    );
  }
}

class AppAuthProvider extends ChangeNotifier {
  final AuthRepo? authRepo;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  bool otpVisibility = false;
  User? user;

  bool _isLoading = false;
  String verificationIDs = "";
  Map<String, dynamic> _data = <String, dynamic>{};
  String? _registrationErrorMessage = '';
  int _start = 30;
  bool _timerRunning = false;
  GoogleSignInAccount?
      _googleAccount; // Private variable to hold Google account

  // Getter for googleAccount
  GoogleSignInAccount? get googleAccount => _googleAccount;

  // Other properties and methods...

  Future<GoogleSignInAuthentication> googleLogin() async {
    _googleAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication auth = await _googleAccount!.authentication;

    debugPrint('HELLO=====>${auth.idToken}');

    return auth;
  }

  AppAuthProvider({required this.authRepo});

  bool get isLoading => _isLoading;
  Map<String, dynamic> get data => _data;
  String? get registrationErrorMessage => _registrationErrorMessage;
  int get start => _start;
  bool get timerRunning => _timerRunning;

  // Registration method
  Future<Map<String, dynamic>> registration(Data signUpModel) async {
    _isLoading = true;
    _registrationErrorMessage = '';
    notifyListeners();

    ApiResponse apiResponse = await authRepo!.registration(signUpModel);
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      _data = apiResponse.response?.data;
    } else {
      if (apiResponse.response != null) {
        _data = apiResponse.response!.data;
      }
      _registrationErrorMessage =
          ApiChecker.getError(apiResponse).errors![0].message;
    }

    _isLoading = false;
    notifyListeners();
    return _data;
  }

  // Check if phone number exists
  Future<Map<String, dynamic>> checkPhone(String mobile) async {
    _isLoading = true;
    _registrationErrorMessage = '';
    notifyListeners();

    ApiResponse apiResponse = await authRepo!.checkPhoneExist(mobile);
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      _data = apiResponse.response?.data;
      debugPrint("Success: ${apiResponse.response?.data['msg']}");
      if (apiResponse.response?.data['msg'] != 'Mobile Number Found') {
        Utils.showToast('Mobile Number Not Found');
      }
    } else {
      _data = apiResponse.response!.data;
      _registrationErrorMessage =
          ApiChecker.getError(apiResponse).errors![0].message;
      debugPrint("Error: ${apiResponse.response?.data}");
    }

    _isLoading = false;
    notifyListeners();
    return _data;
  }

  // Timer for OTP verification
  void startTimer() {
    _timerRunning = true;
    const oneSec = Duration(seconds: 1);

    Timer.periodic(oneSec, (Timer timer) {
      if (_start == 0) {
        _start = 30;
        _timerRunning = false;
        timer.cancel();
      } else {
        _start--;
      }
      notifyListeners();
    });
  }

  // Save user data to SharedPreferences
  Future<bool> saveUser(Data data) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString(AppConstants.userName, data.fName.toString());
    sp.setString(AppConstants.phone, data.phone.toString());
    sp.setString(AppConstants.email, data.email.toString());
    sp.setInt(AppConstants.userid, data.id!.toInt());
    sp.setString("referBy", data.referBy.toString());
    sp.setBool(AppConstants.isLogin, true);

    notifyListeners();
    return true;
  }

  // Retrieve user data from SharedPreferences
  Future<Data> getUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return Data(
      fName: sp.getString(AppConstants.userName).toString(),
      phone: sp.getString(AppConstants.phone).toString(),
      email: sp.getString(AppConstants.email).toString(),
      id: sp.getInt(AppConstants.userid),
    );
  }

  // Log out user
  Future<bool> logOutUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    notifyListeners();
    return sp.clear();
  }

  // Login with Google
  Future<void> loginWithGoogle(
      String displayName, String email, BuildContext context) async {
    ApiResponse apiResponse = await authRepo!.checkEmailExist(email);

    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      if (apiResponse.response?.data['msg'] == 'Email Found') {
        int id = apiResponse.response?.data['data'][0]['id'];

        saveUser(Data(
          fName: apiResponse.response?.data['data'][0]['f_name'],
          phone: apiResponse.response?.data['data'][0]['phone'],
          email: apiResponse.response?.data['data'][0]['email'],
          id: id,
        )).then((value) async {
          Fluttertoast.showToast(msg: "Login successfully");
          await Navigator.pushNamedAndRemoveUntil(
              context, RoutesName.categoryScreen, (route) => false);
        });
      } else {
        debugPrint("Registering new user with Google: $displayName, $email");
        registerWithGoogle(displayName, '', email, context);
      }
    }
  }

  // Logout from Google account
  Future<void> socialLogout() async {
    await _googleSignIn.disconnect();
    SharedPreferences sp = await SharedPreferences.getInstance();
    notifyListeners();
    sp.clear();
  }

  // Check if user already exists
  Future<String> checkUserAlreadyExist(String mobileNumber,
      BuildContext context, String userName, String type) async {
    _isLoading = true;

    ApiResponse apiResponse = await authRepo!.checkPhoneExist(mobileNumber);
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      _data = apiResponse.response?.data;
      debugPrint("Success: ${apiResponse.response?.data['msg']}");

      if (apiResponse.response?.data['msg'] == 'Mobile Number Found') {
        _isLoading = false;
        if (type == 'register') {
          Fluttertoast.showToast(
              msg: "Mobile number already registered. Please select login.");
        }
      } else {
        _isLoading = false;
        Navigator.of(context).pushNamed('/verify_otp', arguments: {
          'name': userName.trim(),
          'number': mobileNumber.trim(),
          'type': type,
        });
      }
    } else {
      _data = apiResponse.response!.data;
      _registrationErrorMessage =
          ApiChecker.getError(apiResponse).errors![0].message;
      debugPrint("Error: ${apiResponse.response?.data}");
    }

    return apiResponse.response?.data['msg'];
  }

  
  // Login user
  Future<void> login(BuildContext context, String mobileNumber) async {
    ApiResponse apiResponse = await authRepo!.checkPhoneExist(mobileNumber);

    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      _data = apiResponse.response?.data;
      debugPrint("Success: ${apiResponse.response?.data['msg']}");

      if (apiResponse.response?.data['msg'] == 'Mobile Number Found') {
        _isLoading = false;
        int id = apiResponse.response?.data['data'][0]['id'];
        debugPrint("User Data ID: $id");

        saveUser(Data(
          fName: apiResponse.response?.data['data'][0]['f_name'],
          phone: apiResponse.response?.data['data'][0]['phone'],
          email: apiResponse.response?.data['data'][0]['email'],
          id: id,
        )).then((value) async {
          Fluttertoast.showToast(msg: "Login successfully");
          await Navigator.pushNamedAndRemoveUntil(
              context, RoutesName.categoryScreen, (route) => false);
        });
      }
    }
  }

  // Register user
  Future<void> register(User? user, String name, String number, String email,
      BuildContext context, String referBy) async {
    if (user != null) {
      Data signUpModel = Data(
        fName: name,
        phone: number,
        email: email,
        referBy: referBy,
      );

      await registration(signUpModel).then((status) async {
        await saveUser(Data(
          fName: name,
          phone: number,
          id: status['data']['id'],
          email: email,
        ));
        await Navigator.pushNamedAndRemoveUntil(
            context, RoutesName.categoryScreen, (route) => false);
      });
    } else {
      Fluttertoast.showToast(msg: "Login failed, please try again.");
    }
  }

  // Register user with Google
  Future<void> registerWithGoogle(
      String name, String number, String email, BuildContext context) async {
    Data signUpModel = Data(
      fName: name,
      email: email,
    );

    await registration(signUpModel).then((status) async {
      await saveUser(Data(
        fName: name,
        phone: number,
        id: status['data']['id'],
        email: email,
      ));
      await Navigator.pushNamedAndRemoveUntil(
          context, RoutesName.categoryScreen, (route) => false);
    }).onError((error, stackTrace) {
      debugPrint('Error during Google Registration: $error');
      Fluttertoast.showToast(msg: "Registration failed, please try again.");
    });
  }
}
