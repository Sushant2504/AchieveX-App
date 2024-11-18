import 'package:achievex/data/model/response/note_model.dart';
import 'package:achievex/helper/database_helper.dart';
import 'package:achievex/screens/notes/priority_notes/manage_notes_priority_screen.dart';
import 'package:achievex/screens/notes/notepad/notepad_screen.dart';
import 'package:achievex/screens/notes/manage_todo/todo_screen.dart';
import 'package:flutter/material.dart';

class NotenestScreen extends StatefulWidget {
  int screenIndex;
  NotenestScreen({super.key, required this.screenIndex});

  @override
  State<NotenestScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<NotenestScreen> {
  final DatabaseHelper dbHelper = DatabaseHelper();
  List<Notes> notes = [];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: widget.screenIndex,
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            bottom: PreferredSize(
              preferredSize:
                  const Size.fromHeight(48.0), // Adjust height as needed
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 0.5,
                      blurRadius: 2,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,

                  labelColor:
                      Colors.white, // Selected tab title background color
                  indicatorWeight: 0, // Hide the indicator line
                  // Match the label width

                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        24), // Rounded selected tab background
                    color: Colors.blue,
                    // Selected tab background color
                  ),

                  tabs: const [
                    Tab(
                      text: "   Notepad   ",
                    ),
                    Tab(text: "  To do list   "),
                    Tab(text: "   Manage    "),
                  ],
                ),
          
              ),
            ),
          ),
          body: const TabBarView(
            children: [
              NotepadScreen(),
              TodoScreen(),
              ManageNotePriorityScreen(),
            ],
          ),
        ));
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
