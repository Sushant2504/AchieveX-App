import 'package:achievex/provider/notification_provider.dart';
import 'package:achievex/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/colors.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<NotificationProvider>(context, listen: false)
        .getNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NotificationProvider>(
        builder: (context, notifcation, child) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.accentColor,
            iconTheme: const IconThemeData(color: AppColors.whiteColor),
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Notification",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColors.whitebackgroundColor, fontSize: 19),
                ),
              ],
            ),
          ),
          body: notifcation.isLoading
              ?  const Center(child: CircularProgressIndicator()):(notifcation.notificationList!.isEmpty)?
               const Center(
                child: Card(
                  
                  child: SizedBox(
                    height: 150,
                    width: 270,
                    child: Center(child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('If there is extra information / current news, important update, we will provide you video with  notification.',textAlign: TextAlign.center,),
                    ))),
                ),
              )
              : ListView.builder(
                  itemCount: notifcation.notificationList!.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin:
                          const EdgeInsets.only(top: 15, right: 15, left: 15),
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15)),
                      child: Card(
                        child: Row(
                          children: [
                            ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(15.0),
                                    bottomLeft: Radius.circular(15.0)),
                                child: Image.network(
                                  '${AppConstants.imageUrl}/notification/${notifcation.notificationList![index].image}',
                                  height: 80,
                                  width: 80,
                                  errorBuilder: (BuildContext context,
                                      Object exception,
                                      StackTrace? stackTrace) {
                                    return const SizedBox(
                                        height: 80,
                                        width: 80,
                                        child: Center(child: Text('😢')));
                                  },
                                )),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    notifcation.notificationList![index].title
                                        .toString(),
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    notifcation
                                        .notificationList![index].description
                                        .toString(),
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.start,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  })
          );
    });
  }
}
