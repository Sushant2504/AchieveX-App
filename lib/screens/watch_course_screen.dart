import 'package:flutter/material.dart';

import '../utils/colors.dart';

class WatchCourseScreen extends StatefulWidget {
  const WatchCourseScreen({super.key});

  @override
  State<WatchCourseScreen> createState() => _WatchCourseScreenState();
}

class _WatchCourseScreenState extends State<WatchCourseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.accentColor,
          iconTheme: const IconThemeData(color: AppColors.whiteColor),
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Courses & More",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: AppColors.whitebackgroundColor, fontSize: 19),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
             
              Container(
              margin: const EdgeInsets.only(top: 15, right: 15, left: 15),
              height: 100,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
              child: Card(
                child: Row(
                  children: [
                    ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            bottomLeft: Radius.circular(15.0)),
                        child: Image.asset(
                          'assets/images/course_a.png',
                          height: 80,
                          width: 80,
                        )),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'NO EXCUSES - Best Motivational',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontWeight: FontWeight.w500, color: Colors.black),
                          ),
                          Text(
                            'Created by - Ben Lionel Scott',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                          ),
                          Text(
                            'https://benlionlscott.com/...',
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: AppColors.textColor),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15, right: 15, left: 15),
              height: 100,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
              child: Card(
                child: Row(
                  children: [
                    ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            bottomLeft: Radius.circular(15.0)),
                        child: Image.asset(
                          'assets/images/course_a.png',
                          height: 80,
                          width: 80,
                        )),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'NO EXCUSES - Best Motivational',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontWeight: FontWeight.w500, color: Colors.black),
                          ),
                          Text(
                            'Created by - Ben Lionel Scott',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                          ),
                          Text(
                            'https://benlionlscott.com/...',
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: AppColors.textColor),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
        
            Container(
              margin: const EdgeInsets.only(top: 15, right: 15, left: 15),
              height: 100,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
              child: Card(
                child: Row(
                  children: [
                    ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            bottomLeft: Radius.circular(15.0)),
                        child: Image.asset(
                          'assets/images/course_a.png',
                          height: 80,
                          width: 80,
                        )),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'NO EXCUSES - Best Motivational',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontWeight: FontWeight.w500, color: Colors.black),
                          ),
                          Text(
                            'Created by - Ben Lionel Scott',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                          ),
                          Text(
                            'https://benlionlscott.com/...',
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: AppColors.textColor),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15, right: 15, left: 15),
              height: 100,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
              child: Card(
                child: Row(
                  children: [
                    ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            bottomLeft: Radius.circular(15.0)),
                        child: Image.asset(
                          'assets/images/course_a.png',
                          height: 80,
                          width: 80,
                        )),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'NO EXCUSES - Best Motivational',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontWeight: FontWeight.w500, color: Colors.black),
                          ),
                          Text(
                            'Created by - Ben Lionel Scott',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                          ),
                          Text(
                            'https://benlionlscott.com/...',
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: AppColors.textColor),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
        
            Container(
              margin: const EdgeInsets.only(top: 15, right: 15, left: 15),
              height: 100,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
              child: Card(
                child: Row(
                  children: [
                    ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            bottomLeft: Radius.circular(15.0)),
                        child: Image.asset(
                          'assets/images/course_a.png',
                          height: 80,
                          width: 80,
                        )),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'NO EXCUSES - Best Motivational',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontWeight: FontWeight.w500, color: Colors.black),
                          ),
                          Text(
                            'Created by - Ben Lionel Scott',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                          ),
                          Text(
                            'https://benlionlscott.com/...',
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: AppColors.textColor),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15, right: 15, left: 15),
              height: 100,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
              child: Card(
                child: Row(
                  children: [
                    ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            bottomLeft: Radius.circular(15.0)),
                        child: Image.asset(
                          'assets/images/course_a.png',
                          height: 80,
                          width: 80,
                        )),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'NO EXCUSES - Best Motivational',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontWeight: FontWeight.w500, color: Colors.black),
                          ),
                          Text(
                            'Created by - Ben Lionel Scott',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                          ),
                          Text(
                            'https://benlionlscott.com/...',
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: AppColors.textColor),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            ],
          ),
        ),
    );
 
  }
}