

import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseApi {
  
  final _firebaseMessaging = FirebaseMessaging.instance;



  void requestPermission() async{
    NotificationSettings settings = await _firebaseMessaging.requestPermission(

      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    
    );


    if(settings.authorizationStatus == AuthorizationStatus.authorized ){

        print('user allowed permission');

    }else if(settings.authorizationStatus == AuthorizationStatus.provisional){
      print('user allowed provision permission');

    }else{
      print('user denied permission');
    }

    


  }



  Future<String> getDeviceToken() async{

    String? token = await _firebaseMessaging.getToken();

    return token!;
  }
 

          


}