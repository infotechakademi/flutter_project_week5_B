import 'dart:math';

import 'package:sqflite/sqlite_api.dart';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  Database _database;
  String teamTable = "Team";

  get database async {
    if (_database == null) _database = await initDatabase();
    return _database;
  }

  initDatabase() async {
    String path = join(await getDatabasesPath(), "organization.db");
    var _database = openDatabase(path, version: 1, onCreate: createDatabase);
    return _database;
  }

  createDatabase(Database db, int _) async {
    await db.execute(
      'CREATE TABLE $teamTable (id INTEGER PRIMARY KEY, name TEXT, age INTEGER)',
    );
  }

  Future<int> addUser() async {
    Database _db = await database;
    return await _db.insert(teamTable, {
      "name": "Name${Random().nextInt(255)}",
      "age": Random().nextInt(50),
    });
  }

  getUsers() async {
    Database _db = await database;
    List<Map<String, Object>> items = await _db.query(teamTable);
    print(items);
  }
}
