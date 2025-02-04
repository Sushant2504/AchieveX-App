import 'package:achievex/data/model/response/prior_note_model.dart';
import 'package:achievex/helper/database_helper.dart';
import 'package:flutter/material.dart';

class EditPriorNoteScreen extends StatefulWidget {
  String priority;
  String title = '';
  String description = '';
  String id = '';
  EditPriorNoteScreen(
      {super.key,
      required this.priority,
      required this.id,
      required this.title,
      required this.description});

  @override
  State<EditPriorNoteScreen> createState() => _EditPriorNoteScreenState();
}

class _EditPriorNoteScreenState extends State<EditPriorNoteScreen> {
  late Future<DateTime?> selectedDate;
  String date = "-";

  TimeOfDay selectedTime = TimeOfDay.now();

  final DatabaseHelper dbHelper = DatabaseHelper();

  String time = "-";
  TextEditingController? titleController;
  TextEditingController? descController;

  void savePriorNote(String title, String description, String id) {
    final notes = PriorNote(
      title: title,
      description: description,
      priority: widget.priority,
      id: int.parse(id),

      // id: 0,
    );

    dbHelper.insertOrUpdatePriorNote(notes, context);
  }

  @override
  Widget build(BuildContext context) {
    titleController = TextEditingController(text: widget.title.toString());
    descController = TextEditingController(text: widget.description.toString());

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
        title: Text(title),
        backgroundColor: backgroundColor,
        actions: <Widget>[
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem<int>(
                  value: 1,
                  child: InkWell(
                    onTap: () => {
                      dbHelper.deletePriorNoteItem(
                          int.parse(widget.id), context),
                    },
                    child: const Text("Delete"),
                  ),
                ),
              ];
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 12),
              child: TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter title...',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 12),
              child: TextField(
                controller: descController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter description...',
                ),
              ),
            ),
            InkWell(
              onTap: () => {
                savePriorNote(titleController!.text.toString(),
                    descController!.text.toString(), widget.id),
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
