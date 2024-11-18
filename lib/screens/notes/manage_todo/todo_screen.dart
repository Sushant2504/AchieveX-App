import 'package:achievex/data/model/response/todo_model.dart';
import 'package:achievex/helper/database_helper.dart';
import 'package:achievex/ui/theme.dart';
import 'package:flutter/material.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  bool markAsComplete = false;
  final DatabaseHelper dbHelper = DatabaseHelper();
  TextEditingController title_controller = TextEditingController();
Future<void>? _fetchTodos;
  List<Todos> todoList = [];
  int status = 0;

  Todos? todo;
  bool showTextWidget = false;

  int taskCount = 0;

  String? isComplete;
  String? id;
  String? desc;

  bool isUpdate = false;

  @override
  void initState() {
    super.initState();
    _fetchTodos =  fetchTodos();
  }

@override
void dispose() {
  _fetchTodos?.then((_) {
    if (mounted) {
      setState(() {}); 
    }
  });
  super.dispose();
}
  Future<void> fetchTodos() async {
    final fetcheTodo = await dbHelper.getTodoList();
    final fetchTask = await dbHelper.getTaskToCompleteList();

    setState(() {
      todoList = fetcheTodo;
      taskCount = fetchTask;
    });
  }

  void saveTodo() {
    final todos = Todos(
      title: title_controller.text,
      description: title_controller.text,
      isComplete: '0',
      // id: const Uuid().v4(),
    );
    dbHelper.insertOrUpdateTodo(todos, context);
  }

  void updateTodo(Todos todos) {
    dbHelper.insertOrUpdateTodo(todos, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (todoList.isEmpty)
          ? Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(28.0),
                      child: Center(
                        child: Image.asset(
                          'assets/images/empty-todo.png',
                          height: 200,
                          width: 200,
                        ),
                      ),
                    ),
                    const Spacer(),
                    showTextWidget
                        ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 70,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          border: Border.all(width: 1),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: title_controller,
                                maxLines: 1,
                                minLines: 1,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Add To do',
                                ),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.send),
                              onPressed: () {
                                if (isUpdate) {
                                  var tododata = Todos(
                                      title: title_controller.text,
                                      description: title_controller.text,
                                      isComplete: isComplete.toString(),
                                      id: int.parse(id.toString()));

                                  updateTodo(tododata);
                                } else {
                                  saveTodo();
                                }

                                setState(() {});
                                // Add your send button logic here
                              },
                            ),
                          ],
                        ),
                      ),
                    )
                  : Container()
                  ],
                ),
              ],
            )
          : Column(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Text("You have ",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: Colors.black)),
                    Text(taskCount.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: Colors.red)),
                    const Text(
                      " task to complete",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: todoList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal:  8.0,vertical: 4),
                        child: InkWell(
                          onLongPress: () => {
                            showLogoutConfirmationDialog(
                                context, todoList[index].id.toString()),
                          },
                          onTap: () => {
                            setState(() {
                              showTextWidget = true;
                              isUpdate = true;
                              title_controller.text =
                                  todoList[index].description.toString();
                              id = todoList[index].id.toString();
                              isComplete = todoList[index].isComplete.toString();
                        
                              //  todo = Todos(title:todoList[index].description.toString(),description: todoList[index].description.toString(),
                              // isComplete: todoList[index].isComplete.toString(), id: todoList[index].id );
                            }),
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => EditTodoScreen(
                            //             title: todoList[index].title,
                            //             description: todoList[index].description,
                            //             id: todoList[index].id.toString(),
                            //             isComplete: todoList[index]
                            //                 .isComplete
                            //                 .toString()))),
                          },
                          child: Container(
                            margin: const EdgeInsets.only(
                                right: 12, left: 12, top: 6),
                            decoration: BoxDecoration(
                              color: (todoList.isNotEmpty &&
                                      todoList[index].isComplete.toString() ==
                                          "1")
                                  ? const Color(0xFFF0F0F0)
                                  : const Color(0xffF1F5FF),
                            ),
                            child: Row(
                              children: [
                                Checkbox(
                                  value: todoList[index].isComplete == "0"
                                      ? false
                                      : true,
                                  onChanged: (value) async {
                                    int newValue = value! ? 1 : 0;
                                    todoList[index].isComplete =
                                          newValue.toString();
                                           await dbHelper.markAsComplete(
                                      int.parse(todoList[index].id.toString()),
                                      newValue,
                                      context,
                                    );
                                    setState(()  {
                                     
                                    });
                                  },
                                ),
                        
                                // Checkbox(value: (todoList[i].isComplete == 1) ? true : false, onChanged:
                        
                                Expanded(
                                    child: Text(todoList[index].description,
                                        style: TextStyle(
                                          decoration:
                                              (todoList[index].isComplete == '1')
                                                  ? TextDecoration.lineThrough
                                                  : TextDecoration.none,
                                        )
                                        )
                                        ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              (showTextWidget)
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 70,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          border: Border.all(width: 1),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: title_controller,
                                maxLines: 1,
                                minLines: 1,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Add To do',
                                ),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.send),
                              onPressed: () {
                                if (isUpdate) {
                                  var tododata = Todos(
                                      title: title_controller.text,
                                      description: title_controller.text,
                                      isComplete: isComplete.toString(),
                                      id: int.parse(id.toString()));

                                  updateTodo(tododata);
                                } else {
                                  saveTodo();
                                }

                                setState(() {});
                                // Add your send button logic here
                              },
                            ),
                          ],
                        ),
                      ),
                    )
                  : Container()
            ]),
      floatingActionButton: showTextWidget
          ? null
          : FloatingActionButton(
              autofocus: true,
              onPressed: () {
                setState(() {
                  if (!showTextWidget) {
                    showTextWidget = true;
                  } else {
                    showTextWidget = false;
                  }
                });
              },
              backgroundColor: const Color(0xff485BFF),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(90)),
              child: const Text(
                "+",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w500),
              ),
            ),
    );
  }

  Widget keyBoard(BuildContext context) {
    return Container(
        height: 190,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: Colors.black),
        child: const TextField());
  }

  Widget noDataWidget(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 80.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: Center(
                  child: Image.asset('assets/images/nodata-notepad.png')),
            )
          ],
        ),
      ),
    );
  }
}

Future<void> showLogoutConfirmationDialog(
    BuildContext context, String id) async {
  final DatabaseHelper dbHelper = DatabaseHelper();

  return showDialog<void>(
    context: context,
    barrierDismissible: false, // Prevents closing the dialog by tapping outside
    builder: (BuildContext context) {
      // Customize the appearance of the dialog
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(15.0), // Adjust the border radius as needed
        ),
        title: const Text(
          'Delete To do',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: AppColors.accentColor),
          textAlign: TextAlign.center,
        ),
        content: const Text('Are you sure you want to delete?'),
        actions: <Widget>[
          ElevatedButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
          ),
          ElevatedButton(
            child: const Text('Delete'),
            onPressed: () {
              dbHelper.deleteTodoItem(int.parse(id), context);
            },
          ),
        ],
      );
    },
  );
}
