import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:testf/pages/addclass.dart';

import 'models/classObject.dart';
import 'models/taskObject.dart';

class DatabaseHelper {
  Future<Database> database() async {
    return openDatabase(
      join(await getDatabasesPath(), 'planner7.db'),

      onCreate: (db, version) async{
        // Run the CREATE TABLE statement on the database.

        await db.execute("CREATE TABLE classes(id INTEGER PRIMARY KEY, className TEXT, teacherName TEXT, color TEXT)");
        await db.execute("CREATE TABLE tasks(id INTEGER PRIMARY KEY, taskName TEXT, notes TEXT, className TEXT, dueDate TEXT, isComplete TINYINT, isImportant TINYINT, classID INTEGER)");

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


  Future<List<Map<String, dynamic>>> getClassNames() async  {
    List<String> columnNames = new List<String>();
    columnNames.add('id');
    columnNames.add('className');
    Database _db = await database();
    return await _db.query('classes', distinct: true, columns: columnNames);
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
    //List<Map<String, dynamic>> taskMap = await _db.query(
    //    'tasks', orderBy: 'dueDate ASC');
    List<Map<String, dynamic>> taskMap = await _db.rawQuery('''
    SELECT tasks.id,
    tasks.taskName,
    tasks.notes,
    tasks.dueDate, 
    tasks.className, 
    tasks.isComplete, 
    tasks.isImportant, 
    tasks.classID,
    classes.color from tasks INNER JOIN classes ON tasks.classID=classes.id order by dueDate ASC''');
    return List.generate(taskMap.length, (index) {
      return TaskObject(id: taskMap[index]['id'],
          taskName: taskMap[index]['taskName'],
          notes: taskMap[index]['notes'],
          dueDate: taskMap[index]['dueDate'],
          className: taskMap[index]['className'],
          isComplete: taskMap[index]['isComplete'],
          isImportant: taskMap[index]['isImportant'],
          classID: taskMap[index]['classID'],
          color: taskMap[index]['color']

      );
    });
  }
  Future<List<TaskObject>> getTasksByDate(DateTime date) async {
    Database _db = await database();
    //List<Map<String, dynamic>> taskMap = await _db.query(
    //    'tasks', orderBy: 'dueDate ASC');
    List<dynamic> args = new List<dynamic>();
    args.add(date.toString().substring(0, 11) + '00:00:00.000');


    List<Map<String, dynamic>> taskMap = await _db.rawQuery('SELECT * from tasks INNER JOIN classes ON tasks.classID=classes.id where dueDate = ? order by dueDate ASC', args);
    return List.generate(taskMap.length, (index) {
      return TaskObject(id: taskMap[index]['id'],
          taskName: taskMap[index]['taskName'],
          notes: taskMap[index]['notes'],
          dueDate: taskMap[index]['dueDate'],
          className: taskMap[index]['className'],
          isComplete: taskMap[index]['isComplete'],
          isImportant: taskMap[index]['isImportant'],
          classID: taskMap[index]['classID'],
          color: taskMap[index]['color']
      );
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