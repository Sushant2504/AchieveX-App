import 'package:achievex/data/model/response/note_model.dart';
import 'package:achievex/helper/database_helper.dart';
import 'package:flutter/material.dart';

class EditNoteScreen extends StatefulWidget {
  // int id;
  String title='';
  String description = '';
  String id = '';

   EditNoteScreen({super.key,required  this.title, required  this.description, required this.id });


  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  
  late Future<DateTime?> selectedDate;
  String date = "-";

  TimeOfDay selectedTime = TimeOfDay.now();

  final DatabaseHelper dbHelper = DatabaseHelper();

  

  String time = "-";

  void saveNote(String title,String desc,String id) {
   
     final notes = Notes(
      title: title,
      description: desc,
      id: int.parse(id),
    );

    dbHelper.insertOrUpdateNote(notes,context);
    Navigator.pop(context);
  }



  
  @override
  Widget build(BuildContext context) {

    print('----> ${widget.description}');
  TextEditingController titleController = TextEditingController(text: widget.title.toString());
  TextEditingController descController = TextEditingController(text: widget.description.toString());
   

    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions:  <Widget>[

          InkWell(
            onTap: () => {
             dbHelper.deleteNote(int.parse(widget.id),context),
             Navigator.pop(context),
            },
            child: const Icon(Icons.delete)),


          const SizedBox(width: 10,),
          
          
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
                        Padding(
              padding: const EdgeInsets.symmetric(horizontal: 19,),
              child: TextField(
                
                controller: titleController,
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

                controller: descController,
                decoration: const InputDecoration(
                      border: InputBorder.none, // Remove the bottom line

                  
                  hintText: 'Description',
                ),
              ),
            ),
          
            InkWell(
              onTap: () => {
                saveNote( titleController.text.toString(),descController.text.toString(),widget.id,),
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
                    "Update",
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
// }
