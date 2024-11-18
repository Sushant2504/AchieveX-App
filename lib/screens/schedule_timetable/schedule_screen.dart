import 'package:achievex/data/model/response/remider_model.dart';
import 'package:achievex/helper/database_helper.dart';
import 'package:achievex/screens/schedule_timetable/create_reminder_screen.dart';
import 'package:achievex/utils/app_constants.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  final DatabaseHelper dbHelper = DatabaseHelper();
  List<Reminder> reminders = [];
  List<NotificationPermission> permissionList = [
    NotificationPermission.Alert,
    NotificationPermission.Vibration,
    NotificationPermission.Sound
  ];

  @override
  void initState() {
    super.initState();
    fetchReminders();
  }

  Future<void> fetchReminders() async {
    DateTime now = DateTime.now();

    final fetchedReminders = await dbHelper.getReminders();
    setState(() {
      reminders = fetchedReminders;
    });

    // for (int i = 0; i < reminders.length; i++) {
    //   // print("time: ${reminders[i].time} title: ${reminders[i].title}");
    // }
  }

  bool isCurrent = false;
  int currentIndex = -0;
  HighlightedReminder findNextReminderIndex(List<Reminder> reminders) {
    DateTime now = DateTime.now();

    // Sort the reminders by start time
    reminders.sort((a, b) => a.time.compareTo(b.time));

    // Find the index of the next reminder
    for (int i = 0; i < reminders.length; i++) {
      if (reminders[i].end_time.isAfter(now)) {
        // Check if this reminder is the current one
        isCurrent = false;
        currentIndex = i;
        if (now.isAfter(reminders[i].time) &&
            now.isBefore(reminders[i].end_time)) {
          isCurrent = true;
        }
        currentIndex = i;
        return HighlightedReminder(i, isCurrent);
      }
    }

    print('currentIndex--->$currentIndex');

    // If no future reminders found, return -1 with isCurrent as false
    return HighlightedReminder(-1, false);
  }

  String convertDateTimeToTimeString(String dateTimeString) {
    // Parse the string into a DateTime object
    DateTime dateTime = DateTime.parse(dateTimeString);

    // Extract the time part from the DateTime object
    String timeString = DateFormat.jm().format(dateTime);

    return timeString;
  }

  // Schedule the notification.

  @override
  Widget build(BuildContext context) {
    findNextReminderIndex(reminders);
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd  MMM  yyyy').format(now);
    // scheduleNotification();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // sendNotification();
          // scheduleNotification();
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const CreateReminderScreen()),
          );
        },
        backgroundColor: const Color(0xff485BFF),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(90)),
        child: const Text(
          "+",
          style: TextStyle(
              color: Colors.white, fontSize: 32, fontWeight: FontWeight.w500),
        ),
        // ...FloatingActionButton properties...
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10, top: 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              formattedDate.toString(),
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff485BFF)),
            ),
            const SizedBox(
              height: 5,
            ),
            const SizedBox(
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Your Schedule",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  // Spacer(),
                  SizedBox(
                    width: 20,
                  ),
                  Text("On/Off"),
                  SizedBox(
                    width: 5,
                  ),
                  SwitchExample(),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            (reminders.isEmpty)
                ? noDataWidget(context)
                : Expanded(
                    child: ListView.builder(
                        itemCount: reminders.length,
                        itemBuilder: (context, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 52,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      convertDateTimeToTimeString(
                                          reminders[index].time.toString()),
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                    Container(
                                      height: 10,
                                      width: 1,
                                      color: Colors.black,
                                    ),
                                    Text(
                                        convertDateTimeToTimeString(
                                            reminders[index]
                                                .end_time
                                                .toString()),
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(fontSize: 10)),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                              SizedBox(
                                width: 25,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    (currentIndex == index)
                                        ? Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Container(
                                                margin: const EdgeInsets.all(4),
                                                padding:
                                                    const EdgeInsets.all(10),
                                                width: 18,
                                                height: 18,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(90),
                                                  border: Border.all(
                                                    color: Colors.blue,
                                                    width: 1,
                                                  ),
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Container(
                                                height: 12,
                                                width: 12,
                                                decoration: BoxDecoration(
                                                  color: Colors.blue,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    90,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        : Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Container(
                                                margin: const EdgeInsets.all(4),
                                                padding:
                                                    const EdgeInsets.all(10),
                                                width: 14,
                                                height: 14,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(90),
                                                  border: Border.all(
                                                    color: Colors.black,
                                                    width: 1,
                                                  ),
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                    (index < reminders.length - 1)
                                        ? Container(
                                            height: 100,
                                            width: 1,
                                            color: Colors.grey,
                                          )
                                        : Container()
                                  ],
                                ),
                              ),
                              Container(
                                width: 3,
                                decoration:
                                    const BoxDecoration(color: Colors.black),
                              ),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.all(4),
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: (currentIndex == index)
                                          ? const Color(0xFF446EDB)
                                          : const Color(0xFFE9FFFD),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              reminders[index].title,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: (currentIndex == index)
                                                    ? Colors.white
                                                    : Colors.black,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                          PopupMenu(
                                            reminders[index].id.toString(),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        reminders[index].description,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: (currentIndex == index)
                                              ? Colors.white
                                              : Colors.black,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),
                  ),
          ],
        ),
      ),
    );
  }

  PopupMenuButton<String> PopupMenu(String id) {
    return PopupMenuButton<String>(
      color: Colors.white,
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          value: 'Delete',
          child: InkWell(
            onTap: () => {
              dbHelper.deleteReminder(int.parse(id), context),
              Navigator.pop(context),
            },
            child: const ListTile(
              title: Text('Delete'),
            ),
          ),
        ),
      ],
      onSelected: (String value) {
        // Handle option selection here
        print('Selected option: $value');
      },
    );
  }

  Widget noDataWidget(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 80.0),
        child: Column(
          children: [
            const Text("Create Your daily Schedule with AchieveX"),
            const SizedBox(
              height: 20,
            ),
            Image.asset(
              'assets/icons/empty_schedule.png',
              height: 160,
            ),
          ],
        ),
      ),
    );
  }
}

class SwitchExample extends StatefulWidget {
  const SwitchExample({super.key});

  @override
  State<SwitchExample> createState() => _SwitchExampleState();
}

class _SwitchExampleState extends State<SwitchExample> {
  List<NotificationPermission> permissionList = [
    NotificationPermission.Alert,
    NotificationPermission.Vibration,
    NotificationPermission.Sound
  ];

  Future<bool> isNotificationEnable() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool isNotificationEnabled =
        sp.getBool(AppConstants.isRemiderNotificationEnable) ?? true;
    return isNotificationEnabled;
  }

  bool isNotificationEnabled = true;

  @override
  Widget build(BuildContext context) {
    isNotificationEnable();
    return FutureBuilder<bool>(
      future: isNotificationEnable(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          isNotificationEnabled = snapshot.data ?? true;
          // Use isNotificationEnabled here
          return Switch(
              // This bool value toggles the switch.
              value: isNotificationEnabled,
              activeColor: Colors.red,
              onChanged: (bool value) async {
                // This is called when the user toggles the switch.
                SharedPreferences sp = await SharedPreferences.getInstance();
                if (isNotificationEnabled) {
                  sp.setBool(AppConstants.isRemiderNotificationEnable, false);

                  AwesomeNotifications().cancelAllSchedules();
                  AwesomeNotifications().dismissAllNotifications();
                } else {
                  sp.setBool(AppConstants.isRemiderNotificationEnable, true);
                  _scheduleNotifications(context);
                }
                isNotificationEnabled = value;

                // setState(() {
                setState(() {});
                // Navigator.pushAndRemoveUntil(
                //     context,
                //     PageRouteBuilder(
                //       transitionDuration: const Duration(
                //           milliseconds: 1500), // Adjust the duration as needed
                //       pageBuilder: (_, __, ___) => const ScheduleScreen(),
                //       transitionsBuilder:
                //           (_, Animation<double> animation, __, Widget child) {
                //         return FadeTransition(
                //           opacity: animation,
                //           child: child,
                //         );
                //       },
                //     ),
                //     (route) => route.isFirst);
                // });
              });
        } else {
          // Handle loading state
          return const CircularProgressIndicator();
        }
      },
    );
  }
}

final DatabaseHelper databaseHelper = DatabaseHelper();

void _scheduleNotifications(BuildContext context) async {
  final reminders = await databaseHelper.getReminders();

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

  if (timeDifference.isNegative) {
    // If the reminder time is in the past, schedule for the next day
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: int.parse(reminder.id.toString()),
        channelKey: 'basic_channel',
        title: reminder.title,
        body: reminder.description,
      ),
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
    debugPrint(
        'next day schedule----->Hour: ${reminder.time.hour.toString()} Minitues: ${reminder.time.minute.toString()} : Now day: ${now.day + 1}');
  } else {
    DateTime dateTime = reminder.time;
    // Schedule for today
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: int.parse(reminder.id.toString()),
        channelKey: 'basic_channel',
        title: reminder.title,
        body: reminder.description,
      ),
      schedule: NotificationCalendar(
        timeZone: 'Asia/Kolkata',
        hour: dateTime.hour,
        minute: int.parse(dateTime.minute.toString()) +
            int.parse(timeDifference.inMinutes.toString()),
        preciseAlarm: true,
        allowWhileIdle: true,
        repeats: false,
      ),
    );

    print(
        'next schedule----->Hour: ${dateTime.hour}Minitues: ${dateTime.minute} : Time differance from hour: ${timeDifference.inMinutes}');
  }
}

DateTime convertTimeOfDayToDateTime(TimeOfDay timeOfDay) {
  final now = DateTime.now(); // Get the current date
  return DateTime(
      now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
}

class HighlightedReminder {
  int index;
  bool isCurrent = false;

  HighlightedReminder(this.index, this.isCurrent);
}
