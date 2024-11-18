import 'package:achievex/data/model/response/remider_model.dart';
import 'package:achievex/helper/database_helper.dart';
import 'package:achievex/utils/app_constants.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateReminderScreen extends StatefulWidget {
  const CreateReminderScreen({super.key});

  @override
  State<CreateReminderScreen> createState() => _CreateReminderScreenState();
}

class _CreateReminderScreenState extends State<CreateReminderScreen> {
  late Future<DateTime?> selectedDate;
  String date = "-";

  TimeOfDay selectedTime = TimeOfDay.now();
  TimeOfDay selectedEndTime = TimeOfDay.now();

  TextEditingController title_controller = TextEditingController();
  TextEditingController desc_controller = TextEditingController();
  TextEditingController start_time_controller = TextEditingController();
  TextEditingController end_time_controller = TextEditingController();

  final DatabaseHelper dbHelper = DatabaseHelper();

  String time = "-";

  DateTime convertTimeOfDayToDateTime(TimeOfDay timeOfDay) {
    final now = DateTime.now(); // Get the current date
    return DateTime(
        now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
  }

  void saveReminder() {
    DateTime dt = convertTimeOfDayToDateTime(selectedTime);
    DateTime dtEnd = convertTimeOfDayToDateTime(selectedEndTime);
    final reminder = Reminder(
      title: title_controller.text,
      description: desc_controller.text,
      time: dt,
      end_time: dtEnd,
    );

    dbHelper.insertReminder(reminder, context);

    _scheduleNotifications(context);

    Navigator.pop(context);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    checkScheduledNotifications();
    SharedPreferences sp;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: <Widget>[
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                const PopupMenuItem<int>(
                  value: 0,
                  child: Text("Reset"),
                ),
                const PopupMenuItem<int>(
                  value: 1,
                  child: Text("Delete Reminder"),
                ),
              ];
            },
          )
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/transparent-back.png',
            fit: BoxFit.fitWidth,
          ),
          Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 19, vertical: 12),
                child: TextField(
                  controller: title_controller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter title...',
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 19, vertical: 12),
                child: TextField(
                  controller: desc_controller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter description...',
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 19, left: 19),
                padding: const EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                        onTap: () async {
                          final TimeOfDay? timeOfDay = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                            builder: (BuildContext context, Widget? child) {
                              return MediaQuery(
                                data: MediaQuery.of(context)
                                    .copyWith(alwaysUse24HourFormat: false),
                                child: child!,
                              );
                            },
                          );

                          if (timeOfDay != null) {
                            setState(() {
                              selectedTime = timeOfDay;
                            });
                          }
                        },
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text("Start Time: "),
                              Text(
                                selectedTime.format(context),
                              ),
                            ])),
                    InkWell(
                      onTap: () async {
                        final TimeOfDay? timeOfDay1 = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                          builder: (BuildContext context, Widget? child) {
                            return MediaQuery(
                              data: MediaQuery.of(context)
                                  .copyWith(alwaysUse24HourFormat: false),
                              child: child!,
                            );
                          },
                        );

                        if (timeOfDay1 != null) {
                          setState(() {
                            selectedEndTime = timeOfDay1;
                          });
                        }
                      },
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("End Time: "),
                            Text(
                              selectedEndTime.format(context),
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 28.0),
                child: Text(
                  '“This is the key to time\nmanagement – to see the value\nof every moment.”',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () async => {
                  if (await isNotificationEnable())
                    {
                      saveReminder(),
                    }
                  else
                    {
                      Fluttertoast.showToast(
                          msg:
                              'Please enable notification permission from schedule screen.')
                    }

                  // _scheduleNotifications(context),
                },
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width / 1,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                        child: Text(
                      "Save",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    )),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Future<bool> isNotificationEnable() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool isNotificationEnabled =
        sp.getBool(AppConstants.isRemiderNotificationEnable) ?? true;
    return isNotificationEnabled;
  }

  final DatabaseHelper databaseHelper = DatabaseHelper();

  void _scheduleNotifications(BuildContext context) async {
    final reminders = await databaseHelper.getLatestReminder();

    for (var reminder in reminders) {
      await _scheduleNotificationForReminder(reminder);
    }
  }

  Future<List<NotificationModel>> checkScheduledNotifications() {
    return AwesomeNotifications().listScheduledNotifications();
  }

  Future<void> _scheduleNotificationForReminder(Reminder reminder) async {
    final now = DateTime.now();

    // await AwesomeNotifications().cancel(int.parse(reminder.id.toString()));

    final timeDifference = reminder.time.difference(now);

    print('timedifferance------>$timeDifference');

    if (timeDifference.isNegative) {
      // If the reminder time is in the past, schedule for the next day
      await AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: int.parse(reminder.id.toString()),
            channelKey: 'basic_channel',
            title: reminder.title,
            body: reminder.description,
            category: NotificationCategory.Alarm),
        schedule: NotificationCalendar(
          timeZone: 'Asia/Kolkata',
          day: now.day + 1,
          month: now.month,
          year: now.year,
          hour: int.parse(reminder.time.hour.toString()),
          minute: int.parse(reminder.time.minute.toString()),
          preciseAlarm: true,
          allowWhileIdle: true,
          repeats: false,
        ),
      );
      print(
          'next day schedule----->Hour: ${reminder.time.hour.toString()}Minitues: ${reminder.time.minute.toString()} : Now day: ${now.day + 1}');
    } else {
      DateTime dateTime = convertTimeOfDayToDateTime(selectedTime);
      // Schedule for today

      print(
          'minutes :=: ${dateTime.minute}inMinutes ::=:: ${timeDifference.inMinutes}');

      // await AwesomeNotifications().createNotification(
      //   content: NotificationContent(
      //     id: int.parse(reminder.id.toString()) ,
      //     channelKey: 'basic_channel',
      //     title: reminder.title,
      //     body: reminder.description,
      //     wakeUpScreen: true,
      //   ),
      //   schedule: NotificationCalendar(
      //     timeZone: 'Asia/Kolkata',
      //     hour: dateTime.hour,
      //     minute: int.parse(dateTime.minute.toString())+
      //         int.parse(timeDifference.inMinutes.toString()),
      //     preciseAlarm: true,
      //     allowWhileIdle: true,
      //     repeats: false,

      //   ),
      // );

      await AwesomeNotifications().createNotification(
          content: NotificationContent(
              id: int.parse(reminder.id.toString()),
              channelKey: 'basic_channel',
              title: reminder.title,
              body: reminder.description,
              category: NotificationCategory.Alarm),
          schedule: NotificationCalendar.fromDate(
            date: dateTime,
            preciseAlarm: true,
            allowWhileIdle: true,
            repeats: false,
          ));

      print(
          'today schedule----->Hour: ${dateTime.hour}Minitues: ${dateTime.minute} : Time differance from hour: ${timeDifference.inMinutes}');
    }
  }
}
