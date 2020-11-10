import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'models/classObject.dart';
import 'models/taskObject.dart';

class DatabaseHelper {
  Future<Database> database() async {
    return openDatabase(
      join(await getDatabasesPath(), 'planner.db'),

      onCreate: (db, version) async{
        // Run the CREATE TABLE statement on the database.

        await db.execute("CREATE TABLE classes(id INTEGER PRIMARY KEY, className TEXT, teacherName TEXT)");
        await db.execute("CREATE TABLE tasks(id INTEGER PRIMARY KEY, taskName TEXT, notes TEXT, className TEXT, dueDate TEXT)");

        return db;

      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
    );
  }

  Future<void> insertClass(ClassObject classObject) async{
    Database _db = await database();
    await _db.insert('classes', classObject.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<ClassObject>> getClasses() async {
    Database _db = await database();
    List<Map<String, dynamic>> classMap = await _db.query('classes');
    return List.generate(classMap.length, (index) {
      return ClassObject(id: classMap[index]['id'], className: classMap[index]['className'], teacherName: classMap[index]['teacherName']);
    });
  }

  Future<void> deleteClass(int id) async {
    Database _db = await database();
    // Get a reference to the database.
    await _db.delete(
      'classes',
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<void> insertTask(TaskObject taskObject) async{
    Database _db = await database();
    await _db.insert('tasks', taskObject.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<TaskObject>> getTasks() async {
    Database _db = await database();
    List<Map<String, dynamic>> taskMap = await _db.query('tasks');

    
    return List.generate(taskMap.length, (index) {
      print (taskMap.length);
      return TaskObject(id: taskMap[index]['id'], taskName: taskMap[index]['taskName'], notes: taskMap[index]['notes'], dueDate: taskMap[index]['dueDate'], className: taskMap[index]['className']);

    });
  }

  Future<void> deleteTask(int id) async {
    Database _db = await database();
    // Get a reference to the database.

    await _db.delete(
      'tasks',
      where: "id = ?",
      whereArgs: [id],
    );
  }

}