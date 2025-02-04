import 'package:achievex/data/model/response/todo_model.dart';
import 'package:achievex/helper/database_helper.dart';
import 'package:flutter/material.dart';

class CreateTodoScreen extends StatefulWidget {
  const CreateTodoScreen({super.key});

  @override
  State<CreateTodoScreen> createState() => _CreateReminderScreenState();
}

class _CreateReminderScreenState extends State<CreateTodoScreen> {


  TextEditingController title_controller = TextEditingController();
  TextEditingController desc_controller = TextEditingController();
  final DatabaseHelper dbHelper = DatabaseHelper();

  String time = "-";

  bool isComplete=false;

  void saveTodo() {
    final todos = Todos(
      title: title_controller.text,
      description: desc_controller.text,
      isComplete: '0',
      // id: const Uuid().v4(),
    );
    dbHelper.insertOrUpdateTodo(todos,context);
  }

  @override
  Widget build(BuildContext context) {
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
                  child: Text("Delete Todo"),
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
                saveTodo(),
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
