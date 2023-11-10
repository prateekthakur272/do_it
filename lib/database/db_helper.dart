import 'package:do_it/models/task.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static const dbName = 'tasks_db.db';

  static const taskTableName = 'tasks';
  static const taskColumnId = 'id';
  static const taskColumnTitle = 'title';
  static const taskColumnDescription = 'description';
  static const taskColumnStatus = 'status';

  DatabaseHelper._();

  static Future<Database> get _instance async {
    return await openDatabase(
        join(await getDatabasesPath(), DatabaseHelper.dbName),
        version: 1, onCreate: (db, version) {
      const queryCreateTableTask =
          'CREATE TABLE $taskTableName ($taskColumnId INTEGER PRIMARY KEY AUTOINCREMENT, $taskColumnTitle TEXT, $taskColumnDescription TEXT, $taskColumnStatus INTEGER NOT NULL CHECK(status In (0,1)))';
      db.execute(queryCreateTableTask);
      return;
    });
  }

  static Future<List<Task>> getTasks() async {
    final db = await _instance;
    if (db.isOpen) {
      final queryData = await db.query(taskTableName);
      return queryData
          .map((e) => Task.id(
              e[taskColumnId] as int,
              e[taskColumnTitle] as String,
              e[taskColumnDescription] as String,
              (e[taskColumnStatus] as int) == 0
                  ? TaskStatus.pending
                  : TaskStatus.done))
          .toList();
    }
    return [];
  }

  static Future<int> addTask(Task task) async {
    final db = await _instance;
    if (db.isOpen) {
      return await db.insert(taskTableName, task.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    }
    return -1;
  }
}
