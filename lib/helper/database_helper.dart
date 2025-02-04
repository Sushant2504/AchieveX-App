// ignore_for_file: use_build_context_synchronously

import 'package:achievex/data/model/response/note_model.dart';
import 'package:achievex/data/model/response/prior_note_model.dart';
import 'package:achievex/data/model/response/remider_model.dart';
import 'package:achievex/data/model/response/todo_model.dart';
import 'package:achievex/screens/notes/notenest_screen.dart';
import 'package:achievex/screens/schedule_timetable/schedule_screen.dart';
import 'package:achievex/utils/routes/routes_name.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Database? _database;
  static Database? _note_database;
  static Database? _todo_database;
  static Database? _prior_note_database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> get notedatabase async {
    if (_note_database != null) return _note_database!;
    _note_database = await initNotesDatabase();
    return _note_database!;
  }

  Future<Database> get tododatabase async {
    if (_todo_database != null) return _todo_database!;
    _todo_database = await initTodoDatabase();
    return _todo_database!;
  }

  Future<Database> get priornotesdatabase async {
    if (_prior_note_database != null) return _prior_note_database!;
    _prior_note_database = await initPriorNotesDatabase();
    return _prior_note_database!;
  }

  Future<Database> initDatabase() async {
    final path = await getDatabasesPath();
    return openDatabase(
      join(path, 'reminders.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE reminders(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, description TEXT, time TEXT,end_time TEXT)',
        );
      },
      version: 2,
    );
  }

  Future<Database> initNotesDatabase() async {
    final path = await getDatabasesPath();
    return openDatabase(
      join(path, 'notes.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE notes(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, description TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<void> insertReminder(Reminder reminder, BuildContext context) async {
    final db = await database;
    await db
        .insert(
          'reminders',
          reminder.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        )
        .then((value) => {
              print("========>$value"),
            });

             Navigator.pushAndRemoveUntil(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(
              milliseconds: 500), // Adjust the duration as needed
          pageBuilder: (_, __, ___) => const ScheduleScreen(),
          transitionsBuilder:
              (_, Animation<double> animation, __, Widget child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
        (route) => route.isFirst);
      
     
    
  }

  Future<List<Reminder>> getReminders() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'reminders',
      orderBy:
          'time ASC', // Order by ID in descending order to get the latest one first
    );

    return List.generate(maps.length, (i) {
      return Reminder(
        title: maps[i]['title'],
        description: maps[i]['description'],
        time: DateTime.parse(maps[i]['time']),
        //  time: DateTime.now().add(Duration(minutes: 1)), // Set to a minute from now

        end_time: DateTime.parse(maps[i]['end_time']),
        id: maps[i]['id'].toString(),
      );
    });
  }

  Future<List<Reminder>> getLatestReminder() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'reminders',
      orderBy:
          'id DESC', // Order by ID in descending order to get the latest one first
      limit: 1, // Limit the query to retrieve only one record
    );

    final List<Map<String, dynamic>> latestMap = maps;
    return List.generate(maps.length, (i) {
      return Reminder(
        title: latestMap[i]['title'],
        description: latestMap[i]['description'],
        time: DateTime.parse(latestMap[i]['time']),
        end_time: DateTime.parse(latestMap[i]['end_time']),
        id: latestMap[i]['id'].toString(),
      );
    });
  }

  Future<void> deleteReminder(int reminderId, BuildContext context) async {
    print(reminderId);
    final db = await database;

    // Delete the note from the database
    await db.delete(
      'reminders',
      where: 'id = ?',
      whereArgs: [
        reminderId.toString()
      ], // Assuming note id is used for identifying the note
    );

    AwesomeNotifications().cancelSchedule(reminderId);

    // Navigator.pushNamedAndRemoveUntil(
    //   context,
    //   RoutesName.scheduleScreen,
    //   (route) => route.isFirst,
    // );

    Navigator.pushAndRemoveUntil(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(
              milliseconds: 500), // Adjust the duration as needed
          pageBuilder: (_, __, ___) => const ScheduleScreen(),
          transitionsBuilder:
              (_, Animation<double> animation, __, Widget child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
        (route) => route.isFirst);
  }

// ********** Note operations starts ************
  // ignore: duplicate_ignore
  Future<void> insertOrUpdateNote(Notes note, BuildContext context) async {
    final db = await notedatabase;

    try {
      if (note.id != 0) {
        // If the note has an ID, check if it already exists in the database
        final List<Map<String, dynamic>> existingNotes = await db.query(
          'notes',
          where: 'id = ?',
          whereArgs: [note.id],
        );

        if (existingNotes.isNotEmpty) {
          // If the note exists, perform an update
          await db.update(
            'notes',
            note.toMap(),
            where: 'id = ?',
            whereArgs: [note.id],
          );
        } else {
          // If the note doesn't exist, insert it as a new note
          await db.insert(
            'notes',
            note.toMap(),
            conflictAlgorithm: ConflictAlgorithm.replace,
          );
        }
      } else {
        // If the note doesn't have an ID, insert it as a new note
        await db.insert(
          'notes',
          note.toMap(),
          conflictAlgorithm: ConflictAlgorithm.ignore,
        );
      }

   
    } catch (e) {
      print('Error inserting/updating note: $e');
      // Handle error here, such as showing a dialog or logging the error
    }
       // After inserting or updating, navigate to the desired screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => NotenestScreen(
                  screenIndex: 0,
                )),
      );
  }

  Future<void> deleteNote(int noteId, BuildContext context) async {
    final db = await notedatabase;

    // Delete the note from the database
    await db.delete(
      'notes',
      where: 'id = ?',
      whereArgs: [noteId], // Assuming note id is used for identifying the note
    );

    // After deleting, navigate to the desired screen
     Navigator.pushAndRemoveUntil(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(
              milliseconds: 500), // Adjust the duration as needed
          pageBuilder: (_, __, ___) =>  NotenestScreen(screenIndex: 0,),
          transitionsBuilder:
              (_, Animation<double> animation, __, Widget child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
        (route) => route.isFirst);
  }

  Future<List<Notes>> getNotes() async {
    final db = await notedatabase;
    final List<Map<String, dynamic>> maps = await db.query('notes');
    return List.generate(maps.length, (i) {
      return Notes(
        title: maps[i]['title'],
        description: maps[i]['description'],
        id: maps[i]['id'],
      );
    });
  }
// ********** Note operations end ************

// ********** Todo operations start ************

  Future<Database> initTodoDatabase() async {
    final path = await getDatabasesPath();
    return openDatabase(
      join(path, 'todos.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE todos(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, description TEXT, is_complete TEXT)',
        );
      },
      version: 2,
    );
  }

  Future<List<Todos>> getTodoList() async {
    final db = await tododatabase;
    final List<Map<String, dynamic>> maps = await db.query('todos');
    return List.generate(maps.length, (i) {
      return Todos(
        title: maps[i]['title'],
        description: maps[i]['description'],
        isComplete: maps[i]['is_complete'],
        id: maps[i]['id'],
      );
    });
  }

  Future<int> getTaskToCompleteList() async {
    final db = await tododatabase;
    final List<Map<String, dynamic>> maps =
        await db.query('todos', where: 'is_complete = ?', whereArgs: ['0']);

    print('----->getTaskToCompleteList ${maps.length}');
    return maps.length;
  }

  Future<void> insertOrUpdateTodo(Todos todos, BuildContext context) async {
    final db = await tododatabase;
    // Check if the note already exists in the database
    final List<Map<String, dynamic>> existingTodoList = await db.query(
      'todos',
      where: 'id = ?',
      whereArgs: [
        todos.id
      ], // Assuming note id is used for identifying the note
    );

    if (existingTodoList.isNotEmpty) {
      // If the note exists, perform an update
      await db.update(
        'todos',
        todos.toMap(),
        where: 'id = ?',
        whereArgs: [todos.id],
      );
    } else {
      // If the note doesn't exist, perform an insert
      await db.insert(
        'todos',
        todos.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    // After inserting or updating, navigate to the desired screen
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration:
            const Duration(milliseconds: 500), // Adjust the duration as needed
        pageBuilder: (_, __, ___) => NotenestScreen(screenIndex: 1),
        transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    );
  }

  Future<void> deleteTodoItem(int todoId, BuildContext context) async {
    final db = await tododatabase;

    // Delete the note from the database
    await db.delete(
      'todos',
      where: 'id = ?',
      whereArgs: [todoId], // Assuming note id is used for identifying the note
    );
    // After deleting, navigate to the desired screen
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration:
            const Duration(milliseconds: 500), // Adjust the duration as needed
        pageBuilder: (_, __, ___) => NotenestScreen(screenIndex: 1),
        transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    );
  }

  Future<void> markAsComplete(
      int id, int isComplete, BuildContext context) async {
    final db = await tododatabase;
    await db.update(
      'todos',
      {'is_complete': isComplete}, // No need to convert to string
      where: 'id = ?',
      whereArgs: [id],
    );

    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration:
            const Duration(milliseconds: 500), // Adjust the duration as needed
        pageBuilder: (_, __, ___) => NotenestScreen(screenIndex: 1),
        transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    );
    // Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) => NotenestScreen(
    //               screenIndex: 1,
    //             )));
  }
  // ********** Todo operations end ************

  // ********** Priority Note operations start ************

  Future<Database> initPriorNotesDatabase() async {
    final path = await getDatabasesPath();
    return openDatabase(
      join(path, 'prior_notes.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE prior_notes(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, description TEXT,is_complete TEXT, priority TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<void> insertOrUpdatePriorNote(
      PriorNote priorNote, BuildContext context) async {
    final db = await priornotesdatabase;
    // Check if the note already exists in the database
    final List<Map<String, dynamic>> existingTodoList = await db.query(
      'prior_notes',
      where: 'id = ?',
      whereArgs: [
        priorNote.id
      ], // Assuming note id is used for identifying the note
    );

    if (existingTodoList.isNotEmpty) {
      // If the note exists, perform an update
      await db.update(
        'prior_notes',
        priorNote.toMap(),
        where: 'id = ?',
        whereArgs: [priorNote.id],
      );
    } else {
      // If the note doesn't exist, perform an insert
      await db.insert(
        'prior_notes',
        priorNote.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    // After inserting or updating, navigate to the desired screen
    Navigator.pushNamedAndRemoveUntil(
      context,
      RoutesName.noteNestScreen,
      arguments: {"selectedIndex": 2},
      (route) => route.isFirst,
    );
  }

  Future<List<PriorNote>> getPriorList(String priority) async {
    final db = await priornotesdatabase;

    final List<Map<String, dynamic>> maps = await db.query(
      'prior_notes',
      where: 'priority = ?',
      whereArgs: [priority],
    );

    return List.generate(maps.length, (i) {
      return PriorNote(
        title: maps[i]['title'],
        description: maps[i]['description'],
        isComplete: maps[i]['is_complete'],
        priority: maps[i]['priority'],
        id: maps[i]['id'],
      );
    });
  }

  Future<void> markAsCompletePriority(
      int id, int isComplete, BuildContext context) async {
    final db = await priornotesdatabase;
    await db.update(
      'prior_notes',
      {'is_complete': isComplete}, // No need to convert to string
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> deletePriorNoteItem(int id, BuildContext context) async {
    final db = await priornotesdatabase;

    // Delete the note from the database
    await db.delete(
      'prior_notes',
      where: 'id = ?',
      whereArgs: [id], // Assuming note id is used for identifying the note
    );

    
    Navigator.pushAndRemoveUntil(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(
              milliseconds: 500), // Adjust the duration as needed
          pageBuilder: (_, __, ___) =>  NotenestScreen(screenIndex: 2,),
          transitionsBuilder:
              (_, Animation<double> animation, __, Widget child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
        (route) => route.isFirst);

    // Navigator.pop(context);
    // After deleting, navigate to the desired screen
  }

  // ********** Priority Note operations end ************
}
