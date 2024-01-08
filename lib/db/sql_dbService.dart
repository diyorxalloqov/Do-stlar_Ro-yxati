import 'dart:io';

import 'package:friends_list/model/friends_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class SqlDbService {
  final String friendsTable = 'Friends';

  SqlDbService._init();

  static final SqlDbService _db = SqlDbService._init();

  factory SqlDbService() => _db;

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    return openDatabase(join(documentsDirectory.path, 'task_database.data.db'),
        version: 2, onCreate: _onCreate, onUpgrade: _onUpgrade);
  }

  _onCreate(Database db, int newVersion) async {
    await db.execute(
      "CREATE TABLE $friendsTable(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, name TEXT, age INTEGER,description TEXT)",
    );
  }

  _onUpgrade(Database db, int oldVersion, int newVersion) async {
    await db.execute("DROP TABLE IF EXISTS $friendsTable");
    await db.execute(
      "CREATE TABLE $friendsTable(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, name TEXT, age INTEGER,description TEXT)",
    );
  }

  Future<List<FriendsModel>> getALlData() async {
    List<Map<String, Object?>> res =
        await ((await database)!.query(friendsTable));
    if (res.isNotEmpty) {
      List<FriendsModel> data = res
          .map((e) => FriendsModel(
              id: int.tryParse(e['id'].toString()),
              name: e['name'].toString(),
              age: int.tryParse(e['age'].toString()),
              description: e['description'].toString()))
          .toList();
          print(data);
      return data;
    } else {
      return [];
    }
  }

  /// insert friend to db
  Future insertData(FriendsModel data) async =>
      await ((await database)!.insert(friendsTable, data.toMap()));

  /// update friend to db

  Future updateData(FriendsModel data) async =>
      await ((await database)!.update(friendsTable, data.toMap(),
          where: "id = ?", whereArgs: [data.id]));

  ///  delete friend from db

  Future deleteData(int id) async => await ((await database)!
      .delete(friendsTable, where: "id = ?", whereArgs: [id]));

  /// delete database table
  Future deleteTable() async => await ((await database)!.delete(friendsTable));

}
