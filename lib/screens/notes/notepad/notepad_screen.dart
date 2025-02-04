import 'package:achievex/data/model/response/note_model.dart';
import 'package:achievex/helper/database_helper.dart';
import 'package:achievex/screens/notes/notepad/create_note_screen.dart';
import 'package:achievex/screens/notes/notepad/edit_note_screen.dart';
import 'package:achievex/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class NotepadScreen extends StatefulWidget {
  const NotepadScreen({super.key});

  @override
  State<NotepadScreen> createState() => _NotePadScreenState();
}

class _NotePadScreenState extends State<NotepadScreen> {
  final DatabaseHelper dbHelper = DatabaseHelper();
  List<Notes> notes = [];

  @override
  void initState() {
    super.initState();
    fetchNotes();
  }

  Future<void> fetchNotes() async {
    final fetcheNotes = await dbHelper.getNotes();
    setState(() {
      notes = fetcheNotes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const CreateNoteScreen()),
            );
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
        body: (notes.isEmpty)
            ? Padding(
                padding: const EdgeInsets.all(28.0),
                child: Center(
                    child: Image.asset('assets/images/nodata-notepad.png')))
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 18.0, top: 20),
                    child: Text(
                      "Notepad",
                      style: TextStyle(
                          color: AppColors.blackColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Expanded(
                    child: MasonryGridView.builder(
                        padding: const EdgeInsets.all(12),
                        scrollDirection: Axis.vertical,
                        itemCount: notes.length,
                        gridDelegate:
                            const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EditNoteScreen(
                                          title: notes[index].title,
                                          description: notes[index].description,
                                          id: notes[index].id.toString()))),
                            },
                            child: Container(
                              margin: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                color: const Color(0xffF1F5FF),
                                border:
                                    Border.all(color: Colors.blue, width: 1),
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey
                                        .withOpacity(0.2), // Shadow color
                                    spreadRadius: 2, // Spread radius
                                    blurRadius: 2, // Blur radius
                                    offset: const Offset(
                                        0, 1), // Offset of the shadow
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      maxLines: 1,
                                      notes[index].title.toString(),
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                      textAlign: TextAlign.start,
                                    ),
                                    Text(
                                      maxLines: 10,
                                      notes[index].description.toString(),
                                      textAlign: TextAlign.start,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                          // ),
                        }),
                  ),
                ],
              ));

    // SingleChildScrollView(
    //     child: StaggeredGrid.count(
    //       crossAxisCount: 2,
    //       mainAxisSpacing: 2,
    //       crossAxisSpacing: 2,
    //       children: [
    //         for (int i = 0; i < notes.length; i++)
    //           StaggeredGridTile.count(
    //             crossAxisCellCount: 1,
    //             mainAxisCellCount: 1,
    //             child:
    //           //   InkWell(
    //           //     onTap: () => {
    //           //       Navigator.push(
    //           //           context,
    //           //           MaterialPageRoute(
    //           //               builder: (context) => EditNoteScreen(
    //           //                   title: notes[i].title,
    //           //                   description: notes[i].description,
    //           //                   id: notes[i].id.toString()))),
    //           //     },
    //           //     child: Container(
    //           //       margin: const EdgeInsets.all(5),
    //           //       decoration: BoxDecoration(
    //           //           color: const Color(0xffF1F5FF),
    //           //           border:
    //           //               Border.all(color: Colors.blue, width: 1),
    //           //           borderRadius: BorderRadius.circular(15)),
    //           //       child: Padding(
    //           //         padding: const EdgeInsets.all(8.0),
    //           //         child: Center(
    //           //             child: Text(
    //           //           notes[i].description.toString(),
    //           //           textAlign: TextAlign.center,
    //           //         )),
    //           //       ),
    //           //     ),
    //           //   ),
    //           // ),
    //       ],
    //     ),
    //   ));
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
