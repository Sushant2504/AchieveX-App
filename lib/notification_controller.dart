
import 'package:achievex/helper/database_helper.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class NotificationService {


initNot(){
AwesomeNotifications().initialize(
  // set the icon to null if you want to use the default app icon
  'resource://drawable/logo_a',
  [
    NotificationChannel(
        channelGroupKey: 'basic_channel_group',
        channelKey: 'basic_channel',
        channelName: 'Basic notifications',
        channelDescription: 'Notification channel for basic tests',
        defaultColor: const Color(0xFF9D50DD),
        ledColor: Colors.white)
  ],
  // Channel groups are only visual and are not required
  channelGroups: [
    NotificationChannelGroup(
        channelGroupKey: 'basic_channel_group',
        channelGroupName: 'Basic group')
  ],
  debug: true
);
}


DatabaseHelper databaseHelper = DatabaseHelper();


    


showNoti(int timeDifferanceInMinutes,String title, String body) async{

  // Future<List<Reminder>> remindersList = databaseHelper.getReminders();


  String localTimeZone = await AwesomeNotifications().getLocalTimeZoneIdentifier();


  initNot();
  

 await AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: 23,
          channelKey: 'basic_channel',
          title: 'Notification at exactly every single minute',
          body: 'This notification was schedule to repeat at every single minute at clock.',
          notificationLayout: NotificationLayout.BigPicture,
          bigPicture: 'asset://assets/images/wallet.png'),
      schedule: NotificationCalendar(second: 0, timeZone: localTimeZone, repeats: true));
}

}
