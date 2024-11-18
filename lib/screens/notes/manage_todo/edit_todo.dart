import 'package:achievex/data/model/response/todo_model.dart';
import 'package:achievex/helper/database_helper.dart';
import 'package:flutter/material.dart';

class EditTodoScreen extends StatefulWidget {
   String title='';
  String description = '';
  String id = '';
  String isComplete;

   EditTodoScreen({super.key,required  this.title, required  this.description, required this.id, required this.isComplete });

  @override
  State<EditTodoScreen> createState() => _EditTodoScreenState();
}

class _EditTodoScreenState extends State<EditTodoScreen> {


  final DatabaseHelper dbHelper = DatabaseHelper();

  String time = "-";

  bool isComplete=false;

  void saveTodo(String title,String desc,String id,String isComplete) {
    final todos = Todos(
      title: title,
      description: desc,
      isComplete: isComplete,
      id: int.parse(id),
    );
    dbHelper.insertOrUpdateTodo(todos,context);
  }

  @override
  Widget build(BuildContext context) {
    
  TextEditingController titleController = TextEditingController(text: widget.title.toString());
  TextEditingController descController = TextEditingController(text: widget.description.toString());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions:  <Widget>[
          InkWell(
            onTap: () => {
             dbHelper.deleteTodoItem(int.parse(widget.id),context),
            },
            child: const Icon(Icons.delete)),
            const SizedBox(width: 10,),
          
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
          
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
                saveTodo( titleController.text.toString(),descController.text.toString(),widget.id,widget.isComplete),
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
