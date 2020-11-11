import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:testf/pages/addclass.dart';

import 'models/classObject.dart';
import 'models/taskObject.dart';

class DatabaseHelper {
  Future<Database> database() async {
    return openDatabase(
      join(await getDatabasesPath(), 'planner3.db'),

      onCreate: (db, version) async{
        // Run the CREATE TABLE statement on the database.

        await db.execute("CREATE TABLE classes(id INTEGER PRIMARY KEY, className TEXT, teacherName TEXT, color INTEGER)");
        await db.execute("CREATE TABLE tasks(id INTEGER PRIMARY KEY, taskName TEXT, notes TEXT, className TEXT, dueDate TEXT, isComplete TINYINT, isImportant TINYINT)");

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
      return ClassObject(id: classMap[index]['id'], className: classMap[index]['className'], teacherName: classMap[index]['teacherName'], color: classMap[index]['color']);
    });
  }

  Future<List<String>> getClassNames() async  {
    List<String> classNames = new List<String>();
    List<String> columnNames = new List<String>();
    columnNames.add('className');
    Database _db = await database();
    List<Map<String, dynamic>> result = await _db.query('classes', distinct: true, columns: columnNames);
    for(int i = 0; i < result.length; i++)
      {
        classNames.add((result[i])['className']);
      }
    return classNames;
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

  Future<void> updateCompletionStatus(bool completionStatus, int id) async{
    Database _db = await database();
    final Map<String, dynamic> taskMap = {
      "isComplete": completionStatus ? 1 : 0
    };

    List<dynamic> whereArgs = new List<dynamic>();
    whereArgs.add(id);
    await _db.update('tasks', taskMap, where: 'id = ?', whereArgs: whereArgs);
  }

  Future<void> updateImportanceStatus(bool importanceStatus, int id) async {
    Database _db = await database();
    final Map<String, dynamic> taskMap = {
      "isImportant": importanceStatus ? 1 : 0
    };

    List<dynamic> whereArgs = new List<dynamic>();
    whereArgs.add(id);
    await _db.update('tasks', taskMap, where: 'id = ?', whereArgs: whereArgs);
  }

    Future<List<TaskObject>> getTasks() async {
      Database _db = await database();
      List<Map<String, dynamic>> taskMap = await _db.query(
          'tasks', orderBy: 'dueDate ASC');

      return List.generate(taskMap.length, (index) {
        //DateTime parsedDate = DateTime.parse(taskMap[index]['dueDate']);
        return TaskObject(id: taskMap[index]['id'],
            taskName: taskMap[index]['taskName'],
            notes: taskMap[index]['notes'],
            dueDate: taskMap[index]['dueDate'],
            className: taskMap[index]['className'],
            isComplete: taskMap[index]['isComplete'],
            isImportant: taskMap[index]['isImportant']);
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