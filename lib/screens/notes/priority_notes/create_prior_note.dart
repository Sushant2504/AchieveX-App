import 'package:achievex/data/model/response/prior_note_model.dart';
import 'package:achievex/helper/database_helper.dart';
import 'package:flutter/material.dart';

class CreatePriorNoteScreen extends StatefulWidget {
  String priority;
  CreatePriorNoteScreen({super.key, required this.priority});

  @override
  State<CreatePriorNoteScreen> createState() => _CreatePriorNoteScreenState();
}

class _CreatePriorNoteScreenState extends State<CreatePriorNoteScreen> {
  late Future<DateTime?> selectedDate;
  String date = "-";

  TimeOfDay selectedTime = TimeOfDay.now();
  TextEditingController title_controller = TextEditingController();
  TextEditingController desc_controller = TextEditingController();
  final DatabaseHelper dbHelper = DatabaseHelper();

  String time = "-";

  void saveNote() {
    final notes = PriorNote(
        title: title_controller.text,
        description: desc_controller.text,
        isComplete: '0',
        priority: widget.priority

        // id: 0,
        );

    dbHelper.insertOrUpdatePriorNote(notes, context);
  }

  @override
  Widget build(BuildContext context) {
    String title, emptyWarning;
    Color backgroundColor, textColor, cardBgColor;
    if (widget.priority == "0") {
      title = "IMPORTANT AND URGENT";
      backgroundColor = const Color(0xFFFCDBD6);
      textColor = const Color(0xFFFF4848);
      cardBgColor = const Color.fromARGB(255, 250, 210, 204);
      emptyWarning =
          "“You can add here task which is Important and urgent at the same time”";
    } else if (widget.priority == "1") {
      title = "URGENT NOT IMPORTENT";
      backgroundColor = const Color(0xFFFFE6C8);
      textColor = const Color(0xFFE06D03);
      cardBgColor = const Color.fromARGB(255, 253, 225, 192);
      emptyWarning =
          "“You can add here task which is Urgent but not important at the same time”";
    } else if (widget.priority == "2") {
      title = "IMPORTANT NOT URGENT";
      backgroundColor = const Color(0xFFBFF1C3);
      textColor = const Color(0xFF1E9500);
      cardBgColor = const Color.fromARGB(255, 160, 241, 166);
      emptyWarning =
          "“You can add here task which is  important but not urgent at the same time”";
    } else {
      title = "NOT IMPORTANT NOT URGENT";
      backgroundColor = const Color(0xFFB5C7CB);
      textColor = const Color(0xFF00677C);
      cardBgColor = const Color.fromARGB(255, 168, 210, 219);
      emptyWarning =
          "“You can add here task which is neither important nor urgent at the same time”";
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: cardBgColor,
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
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 12),
              child: TextField(
                controller: title_controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter title...',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 12),
              child: TextField(
                controller: desc_controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter description...',
                ),
              ),
            ),
            InkWell(
              onTap: () => {
                saveNote(),
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width / 1,
                margin: const EdgeInsets.all(80),
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all()),
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
      ),
    );
  }
}
