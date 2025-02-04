import 'package:achievex/data/model/response/prior_note_model.dart';
import 'package:achievex/helper/database_helper.dart';
import 'package:achievex/screens/notes/priority_notes/create_prior_note.dart';
import 'package:achievex/screens/notes/priority_notes/edit_prior_note.dart';
import 'package:flutter/material.dart';

class DetailsNotesScreen extends StatefulWidget {
  String priority;
  DetailsNotesScreen({super.key, required this.priority});

  @override
  State<DetailsNotesScreen> createState() => _DetailsNotesScreenState();
}

class _DetailsNotesScreenState extends State<DetailsNotesScreen> {
  final DatabaseHelper dbHelper = DatabaseHelper();
  List<PriorNote> tasksList = [];

  Future<void> fetchPriorityWiseNotes() async {
    final priorityAWiseNotes = await dbHelper.getPriorList(widget.priority);

    setState(() {
      tasksList = priorityAWiseNotes;
    });
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
    fetchPriorityWiseNotes();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            title,
            style: TextStyle(fontSize: 16, color: textColor),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          autofocus: true,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        CreatePriorNoteScreen(priority: widget.priority)));
          },
          backgroundColor: const Color(0xff485BFF),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(90)),
          child: const Text(
            "+",
            style: TextStyle(
                color: Colors.white, fontSize: 32, fontWeight: FontWeight.w500),
          ),
        ),
        backgroundColor: backgroundColor,
        body: (tasksList.isEmpty)
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Text(
                    emptyWarning.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: textColor),
                  ),
                ),
              )
            : ListView.builder(
                itemCount: tasksList.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(left: 12, right: 12, top: 12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: (tasksList.isNotEmpty &&
                                tasksList[index].isComplete == "1")
                            ? const Color(0xFFC1C1C1)
                            : cardBgColor),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            Checkbox(
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              value: tasksList.isNotEmpty &&
                                      tasksList[index].isComplete == "0"
                                  ? false
                                  : true,
                              onChanged: (value) async {
                                int newValue = value! ? 1 : 0;
                                await dbHelper.markAsCompletePriority(
                                  int.parse(tasksList[index].id.toString()),
                                  newValue,
                                  context,
                                );
                                setState(() {
                                  tasksList[index].isComplete =
                                      newValue.toString();
                                });
                              },
                            ),
                            Text(
                              tasksList[index].title,
                              style: TextStyle(
                                fontSize: 17,
                                color: (tasksList.isNotEmpty &&
                                        tasksList[index].isComplete == "1")
                                    ? textColor
                                    : textColor,
                                decoration: (tasksList[index].isComplete == '1')
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                              ),
                            ),
                            const Spacer(),
                            PopupMenu(
                                tasksList[index].title,
                                tasksList[index].description,
                                tasksList[index].id.toString()),
                          ]),
                          Padding(
                            padding: const EdgeInsets.only(left: 13.0),
                            child: Text(
                              tasksList[index].description,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: (tasksList.isNotEmpty &&
                                        tasksList[index].isComplete == "1")
                                    ? textColor
                                    : textColor,
                                decoration: (tasksList[index].isComplete == '1')
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }));
  }

  PopupMenuButton<String> PopupMenu(String title, String desc, String id) {
    return PopupMenuButton<String>(
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          value: 'Edit',
          child: InkWell(
            onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EditPriorNoteScreen(
                          priority: widget.priority,
                          title: title,
                          description: desc,
                          id: id.toString()))),
            },
            child: const ListTile(
              title: Text('Edit'),
            ),
          ),
        ),
        PopupMenuItem<String>(
          value: 'Delete',
          child: InkWell(
            onTap: () => {
              dbHelper.deletePriorNoteItem(int.parse(id), context),
              setState(() => {}),
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
}
