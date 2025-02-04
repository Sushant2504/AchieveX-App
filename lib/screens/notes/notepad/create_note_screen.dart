import 'package:achievex/data/model/response/note_model.dart';
import 'package:achievex/helper/database_helper.dart';
import 'package:flutter/material.dart';

class CreateNoteScreen extends StatefulWidget {
  const CreateNoteScreen({super.key});

  @override
  State<CreateNoteScreen> createState() => _CreateReminderScreenState();
}

class _CreateReminderScreenState extends State<CreateNoteScreen> {
  late Future<DateTime?> selectedDate;
  String date = "-";

  TimeOfDay selectedTime = TimeOfDay.now();
  TextEditingController title_controller = TextEditingController();
  TextEditingController desc_controller = TextEditingController();
  final DatabaseHelper dbHelper = DatabaseHelper();

  String time = "-";

void saveNote() {
    final notes = Notes(
      title: title_controller.text,
      description: desc_controller.text,
      // id: 0,
    );

    dbHelper.insertOrUpdateNote(notes,context);
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: const <Widget>[
          // PopupMenuButton(
           
          //   itemBuilder: (context) {
          //     return [
          //       const PopupMenuItem<int>(
          //         value: 0,
          //         child: Text("Reset"),
          //       ),
          //       const PopupMenuItem<int>(
          //         value: 1,
          //         child: Text("Delete Reminder"),
          //       ),
          //     ];
          //   },
          // )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 19,),
              child: TextField(
                
                controller: title_controller,
                decoration: const InputDecoration(
                      border: InputBorder.none, 
                      // Remove the bottom line

                  hintText: 'Title',
                  hintStyle: TextStyle(fontSize: 22)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 19,),
              child: TextField(
                  maxLines: null, // Allow unlimited number of lines

                  keyboardType: TextInputType.multiline, // Allow input of multiple lines

                controller: desc_controller,
                decoration: const InputDecoration(
                      border: InputBorder.none, // Remove the bottom line

                  
                  hintText: 'Description',
                ),
              ),
            ),
           
          
            Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
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
              ),
            )
          ],
        ),
      ),
    );
  }

  // void showDialogTimePicker(BuildContext context){
  //   selectedTime = showTimePicker(
  //     context: context,
  //     initialTime: TimeOfDay.now(),
  //     builder: (BuildContext context, Widget? child) {
  //       return Theme(
  //         data: ThemeData.light().copyWith(
  //           colorScheme: ColorScheme.light(
  //             // primary: MyColors.primary,
  //             primary: Theme.of(context).colorScheme.primary,
  //             onPrimary: Colors.white,
  //             surface: Colors.white,
  //             onSurface: Colors.black,
  //           ),
  //           //.dialogBackgroundColor:Colors.blue[900],
  //         ),
  //         child: child!,
  //       );
  //     },
  //   );
  //   selectedTime.then((value) {
  //     setState(() {
  //       if(value == null) return;
  //       time = "${value.hour} : ${value.minute}";
  //     });
  //   }, onError: (error) {
  //     if (kDebugMode) {
  //       print(error);
  //     }
  //   });
  // }
}
