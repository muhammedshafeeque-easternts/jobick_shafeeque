import 'dart:async';
import "dart:io" as io;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:jobick_shafeeque/core/res/constants.dart';
import 'package:jobick_shafeeque/core/models/table_model.dart';
import "package:path/path.dart";
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class Db {

  static final Db _instance = Db._internal();

  factory Db() => _instance;
  static Database? _db;

  Db._internal();

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await _initDb();
    return _db;
  }

  final String _createTable = """
  CREATE TABLE $tableName($columnId INTEGER PRIMARY KEY, $columnPosition TEXT, $columnType TEXT, $columnPostedDate TEXT, $columnLastDateToApply TEXT, $columnCloseDate TEXT, $columnStatus TEXT, $columnActions TEXT, $columnIsTitle INTEGER);""";

  /// Initialize DB
  _initDb() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "jobs.db");
    var taskDb = await openDatabase(path,
        version: 2, onCreate: _onCreate, onUpgrade: _onUpgrade);
    return taskDb;
  }

  void _onCreate(Database db, int version) async {
    print("Create Query $_createTable}");
    await db.execute(_createTable);
  }

  FutureOr<void> _onUpgrade(Database db, int oldVersion, int newVersion) {
    print("upgraded");
    db.rawQuery("DROP TABLE IF EXISTS " "$tableName");
    _onCreate(db, newVersion);
  }


  Future<List<TableModel>> getAllJobs() async {
    var dbClient = await db;
    var result = [];
    try {
      result = await dbClient!
          .rawQuery("SELECT * FROM $tableName where ${'id'} IS NOT NULL");
      print(result);
    } catch (e) {
      print(e);
    }
    return result.map((e) => TableModel.fromJson(e)).toList();
  }

  Future<int> addJob(TableModel tableRow) async {
    print("trigger");
    var dbClient = await db;
    var count = await dbClient!.insert(tableName, tableRow.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    print("Item inserted $count");
    return count;
  }

  Future<int> deleteJob(int id) async {
    var dbClient = await db;
    var count = await dbClient!
        .rawDelete('DELETE FROM $tableName where ${'id'} = "$id"');
    return count;
  }


  Future<int> updateJob(TableModel tableRow) async {
    var dbClient = await db;
    var result = await dbClient!.update(tableName, tableRow.toJson(),
        where: 'id = ?', whereArgs: [tableRow.id]);
    return result;
  }

}
