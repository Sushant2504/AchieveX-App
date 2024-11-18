import 'package:achievex/data/model/response/prior_note_model.dart';
import 'package:achievex/helper/database_helper.dart';
import 'package:achievex/screens/notes/priority_notes/details_notes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';

class ManageNotePriorityScreen extends StatefulWidget {
  const ManageNotePriorityScreen({super.key});

  @override
  State<ManageNotePriorityScreen> createState() => _ManageTaskScreenState();
}

class _ManageTaskScreenState extends State<ManageNotePriorityScreen> {
  Future<void>? _fetchPriorityWiseNotes;

  final DatabaseHelper dbHelper = DatabaseHelper();
  List<PriorNote> priorityAList = [];
  List<PriorNote> priorityBList = [];
  List<PriorNote> priorityCList = [];
  List<PriorNote> priorityDList = [];
  Future<void> fetchPriorityWiseNotes() async {
    final priorityAWiseNotes = await dbHelper.getPriorList("0");
    final priorityBWiseNotes = await dbHelper.getPriorList("1");
    final priorityCWiseNotes = await dbHelper.getPriorList("2");
    final priorityDWiseNotes = await dbHelper.getPriorList("3");

    setState(() {
      priorityAList = priorityAWiseNotes;
      priorityBList = priorityBWiseNotes;
      priorityCList = priorityCWiseNotes;
      priorityDList = priorityDWiseNotes;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchPriorityWiseNotes = fetchPriorityWiseNotes();
  }

  @override
  void dispose() {
    _fetchPriorityWiseNotes?.then((_) {
      if (mounted) {
        setState(() {});
      }
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int i;
    return Scaffold(
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
        overlayStyle: ExpandableFabOverlayStyle(blur: 3),
        openButtonBuilder: RotateFloatingActionButtonBuilder(
          child: const Icon(
            Icons.add,
            color: Colors.black,
          ),
          fabSize: ExpandableFabSize.regular,
          foregroundColor: Colors.blue,
          backgroundColor: Colors.blue,
          shape: const CircleBorder(),
        ),
        distance: 140,
        closeButtonBuilder: DefaultFloatingActionButtonBuilder(
          child: const Icon(
            Icons.close,
            color: Colors.black,
          ),
          fabSize: ExpandableFabSize.regular,
          foregroundColor: Colors.blue,
          backgroundColor: Colors.blue,
          shape: const CircleBorder(),
        ),
        children: [
          InkWell(
            onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailsNotesScreen(priority: "3")))
            },
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 177, 187, 190),
                  borderRadius: BorderRadius.circular(5)),
              child: const Icon(
                Icons.apps,
                size: 40,
                color: Color(0xff006278),
              ),
            ),
          ),
          InkWell(
            onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailsNotesScreen(priority: "1")))
            },
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: const Color(0xffFFE6C8),
                  borderRadius: BorderRadius.circular(5)),
              child: const Icon(
                Icons.apps,
                size: 40,
                color: Color(0xff793A00),
              ),
            ),
          ),
          InkWell(
            onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailsNotesScreen(priority: "2")))
            },
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: const Color(0xffBFF1C3),
                  borderRadius: BorderRadius.circular(5)),
              child: const Icon(
                Icons.apps,
                size: 40,
                color: Color(0xff006278),
              ),
            ),
          ),
          InkWell(
            onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailsNotesScreen(priority: "0")))
            },
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 243, 89, 89),
                  borderRadius: BorderRadius.circular(5)),
              child: const Icon(
                Icons.apps,
                size: 40,
                color: Color(0xff770000),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DetailsNotesScreen(priority: "0")))
              },
              child: (priorityAList.isEmpty)
                  ? Container(
                      height: 100,
                      margin:
                          const EdgeInsets.only(right: 12, left: 12, top: 10),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: const Color(0xffFCDBD6),
                          borderRadius: BorderRadius.circular(12)),
                      child: const Center(
                          child: Text(
                        'IMPORTANT\nAND URGENT',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff771000),
                        ),
                      )),
                    )
                  : Container(
                      margin:
                          const EdgeInsets.only(right: 12, left: 12, top: 10),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: const Color(0xffFCDBD6),
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 8.0, top: 8),
                                child: Text(
                                  'IMPORTANT AND URGENT',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xff771000),
                                  ),
                                ),
                              ),
                              Column(
                                children: List.generate(
                                    (priorityAList.length >= 4)
                                        ? 4
                                        : priorityAList.length, (index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 0.0, top: 0),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Checkbox(
                                              materialTapTargetSize:
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
                                              value: priorityAList[index]
                                                          .isComplete ==
                                                      "0"
                                                  ? false
                                                  : true,
                                              onChanged: (value) async {
                                                int newValue = value! ? 1 : 0;
                                                await dbHelper
                                                    .markAsCompletePriority(
                                                  int.parse(priorityAList[index]
                                                      .id
                                                      .toString()),
                                                  newValue,
                                                  context,
                                                );
                                                setState(() {
                                                  priorityAList[index]
                                                          .isComplete =
                                                      newValue.toString();
                                                });
                                              },
                                            ),
                                            Text(
                                              priorityAList[index].title,
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: const Color(0xffFF4848),
                                                decoration:
                                                    (priorityAList[index]
                                                                .isComplete ==
                                                            '1')
                                                        ? TextDecoration
                                                            .lineThrough
                                                        : TextDecoration.none,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                              ),
                              (priorityAList.length > 3)
                                  ? Align(
                                      alignment: Alignment.bottomRight,
                                      child: InkWell(
                                        onTap: () => {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      DetailsNotesScreen(
                                                          priority: "0")))
                                        },
                                        child: const Padding(
                                          padding: EdgeInsets.only(
                                              bottom: 8.0, right: 8),
                                          child: Text("Read More"),
                                        ),
                                      ))
                                  : Container(),
                            ]),
                      ),
                    ),
            ),
            InkWell(
                onTap: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DetailsNotesScreen(priority: "1")))
                    },
                child: (priorityBList.isEmpty)
                    ? Container(
                        height: 100,
                        margin:
                            const EdgeInsets.only(right: 12, left: 12, top: 10),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: const Color(0xffFFE6C8),
                            borderRadius: BorderRadius.circular(12)),
                        child: const Center(
                            child: Text(
                          'URGENT NOT\nIMPORTANT',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff9E5600),
                          ),
                        )),
                      )
                    : Container(
                        margin:
                            const EdgeInsets.only(right: 12, left: 12, top: 10),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: const Color(0xffFFE6C8),
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'URGENT NOT IMPORTANT',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xff9E5600),
                                  ),
                                ),
                              ),
                              Column(
                                children: List.generate(
                                    (priorityBList.length >= 4)
                                        ? 4
                                        : priorityBList.length, (index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 0.0, top: 0),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Checkbox(
                                              materialTapTargetSize:
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
                                              value: priorityBList[index]
                                                          .isComplete ==
                                                      "0"
                                                  ? false
                                                  : true,
                                              onChanged: (value) async {
                                                int newValue = value! ? 1 : 0;
                                                await dbHelper
                                                    .markAsCompletePriority(
                                                  int.parse(priorityBList[index]
                                                      .id
                                                      .toString()),
                                                  newValue,
                                                  context,
                                                );
                                                setState(() {
                                                  priorityBList[index]
                                                          .isComplete =
                                                      newValue.toString();
                                                });
                                              },
                                            ),
                                            Text(
                                              priorityBList[index].title,
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: const Color(0xffE06D03),
                                                decoration:
                                                    (priorityBList[index]
                                                                .isComplete ==
                                                            '1')
                                                        ? TextDecoration
                                                            .lineThrough
                                                        : TextDecoration.none,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                              ),
                              (priorityBList.length > 3)
                                  ? Align(
                                      alignment: Alignment.bottomRight,
                                      child: InkWell(
                                        onTap: () => {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      DetailsNotesScreen(
                                                          priority: "1")))
                                        },
                                        child: const Padding(
                                          padding: EdgeInsets.only(
                                              bottom: 8.0, right: 8),
                                          child: Text("Read More"),
                                        ),
                                      ))
                                  : Container(),
                            ],
                          ),
                        ),
                      )),
            InkWell(
              onTap: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DetailsNotesScreen(priority: "2")))
              },
              child: (priorityCList.isEmpty)
                  ? Container(
                      height: 100,
                      margin:
                          const EdgeInsets.only(right: 12, left: 12, top: 10),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: const Color(0xffBFF1C3),
                          borderRadius: BorderRadius.circular(12)),
                      child: const Center(
                          child: Text(
                        'IMPORTANT\nNOT URGENT',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff008A0C),
                        ),
                      )),
                    )
                  : Container(
                      margin:
                          const EdgeInsets.only(right: 12, left: 12, top: 10),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: const Color(0xffBFF1C3),
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 8.0, top: 8),
                                child: Text(
                                  'IMPORTANT NOT URGENT',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xff008A0C),
                                  ),
                                ),
                              ),
                              Column(
                                children: List.generate(
                                    (priorityCList.length >= 4)
                                        ? 4
                                        : priorityCList.length, (index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 0.0, top: 0),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Checkbox(
                                              materialTapTargetSize:
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
                                              value: priorityCList[index]
                                                          .isComplete ==
                                                      "0"
                                                  ? false
                                                  : true,
                                              onChanged: (value) async {
                                                int newValue = value! ? 1 : 0;
                                                await dbHelper
                                                    .markAsCompletePriority(
                                                  int.parse(priorityCList[index]
                                                      .id
                                                      .toString()),
                                                  newValue,
                                                  context,
                                                );
                                                setState(() {
                                                  priorityCList[index]
                                                          .isComplete =
                                                      newValue.toString();
                                                });
                                              },
                                            ),
                                            Text(
                                              priorityCList[index].title,
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: const Color(0xff00B40F),
                                                decoration:
                                                    (priorityCList[index]
                                                                .isComplete ==
                                                            '1')
                                                        ? TextDecoration
                                                            .lineThrough
                                                        : TextDecoration.none,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                              ),
                              (priorityCList.length > 3)
                                  ? Align(
                                      alignment: Alignment.bottomRight,
                                      child: InkWell(
                                        onTap: () => {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      DetailsNotesScreen(
                                                          priority: "2")))
                                        },
                                        child: const Padding(
                                          padding: EdgeInsets.only(
                                              bottom: 8.0, right: 8),
                                          child: Text("Read More"),
                                        ),
                                      ))
                                  : Container(),
                            ]),
                      )),
            ),
            InkWell(
              onTap: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DetailsNotesScreen(priority: "3")))
              },
              child: (priorityDList.isEmpty)
                  ? Container(
                      height: 100,
                      margin:
                          const EdgeInsets.only(right: 12, left: 12, top: 10),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: const Color(0xffB5C7CB),
                          borderRadius: BorderRadius.circular(12)),
                      child: const Center(
                          child: Text(
                        'NOT\nIMPORTANT\nNOT URGENT',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff004C5C),
                        ),
                      )),
                    )
                  : Container(
                      margin:
                          const EdgeInsets.only(right: 12, left: 12, top: 10),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: const Color(0xffB5C7CB),
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 8.0, top: 8),
                                child: Text(
                                  'NOT IMPORTANT NOT URGENT',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xff004C5C),
                                  ),
                                ),
                              ),
                              Column(
                                children: List.generate(
                                    (priorityDList.length >= 4)
                                        ? 4
                                        : priorityDList.length, (index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 0.0, top: 0),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Checkbox(
                                              materialTapTargetSize:
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
                                              value: priorityDList[index]
                                                          .isComplete ==
                                                      "0"
                                                  ? false
                                                  : true,
                                              onChanged: (value) async {
                                                int newValue = value! ? 1 : 0;
                                                await dbHelper
                                                    .markAsCompletePriority(
                                                  int.parse(priorityDList[index]
                                                      .id
                                                      .toString()),
                                                  newValue,
                                                  context,
                                                );
                                                setState(() {
                                                  priorityDList[index]
                                                          .isComplete =
                                                      newValue.toString();
                                                });
                                              },
                                            ),
                                            Text(
                                              priorityDList[index].title,
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: const Color(0xff006A82),
                                                decoration:
                                                    (priorityDList[index]
                                                                .isComplete ==
                                                            '1')
                                                        ? TextDecoration
                                                            .lineThrough
                                                        : TextDecoration.none,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                              ),
                              (priorityDList.length > 3)
                                  ? Align(
                                      alignment: Alignment.bottomRight,
                                      child: InkWell(
                                        onTap: () => {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      DetailsNotesScreen(
                                                          priority: "3")))
                                        },
                                        child: const Padding(
                                          padding: EdgeInsets.only(
                                              bottom: 8.0, right: 8),
                                          child: Text("Read More"),
                                        ),
                                      ))
                                  : Container(),
                            ]),
                      )),
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
