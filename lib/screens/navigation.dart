import 'package:achievex/screens/audio_section.dart';
import 'package:achievex/screens/courses_screen.dart';
import 'package:achievex/screens/ebook_section.dart';
import 'package:achievex/utils/colors.dart';
import 'package:flutter/material.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(40),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Container(
                height: 50,
                width: double.infinity,
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.9),
                      spreadRadius: 0,
                      blurRadius: 2,
                      offset: const Offset(0, 0), // changes position of shadow
                    ),
                  ],
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: Colors.white,
                ),
                child: const TabBar(
                  labelStyle:
                      TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  indicatorPadding:
                      EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: Colors.transparent,
                  indicator: BoxDecoration(
                    color: AppColors.accentColor,
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  tabs: [
                    Text("Courses"),
                    Text("Ebooks"),
                    Text("Audio Books"),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: CourseScreen()),
            Center(child: EBookSection()),
            Center(child: AudioSection()),
          ],
        ),
      ),
    );
  }
}
