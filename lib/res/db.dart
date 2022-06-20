import 'dart:async';
import "dart:io" as io;
import 'package:jobick_shafeeque/models/table_model.dart';
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
  CREATE TABLE ${'Jobs'}(id INTEGER PRIMARY KEY, position TEXT, type TEXT, posted_date TEXT, last_date_to_apply TEXT, close_date TEXT, status TEXT, actions TEXT, is_title INTEGER);""";

  /// Initialize DB
  _initDb() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "jobs.db");
    var taskDb = await openDatabase(path,
        version: 1, onCreate: _onCreate, onUpgrade: _onUpgrade);
    return taskDb;
  }

  void _onCreate(Database db, int version) async {
    print("Create Query $_createTable}");
    await db.execute(_createTable);
  }

  FutureOr<void> _onUpgrade(Database db, int oldVersion, int newVersion) {
    print("upgraded");
    db.rawQuery("DROP TABLE IF EXISTS " "jobs");
    _onCreate(db, newVersion);
  }

/*  Future<dynamic> updateSession(List<String> apiList) async {
    var dbClient = await db;
    var args = "(${apiList.map((e) => "'${e}'").join(",")})";
    print("update args ${args}");
    var count = await dbClient.rawQuery("UPDATE User SET isSessionExpired = 1 WHERE api_key IN $args");
    return count;
  }*/

  /*Future<User> getUserByIdentity(String idetity) async {
    var dbClient = await db;
    var result =[];
    try {
      result =await dbClient.rawQuery(
          "SELECT * FROM ${Constants.TABLE_NAME} where ${Constants.COLUMN_identity} = '$idetity'");
    } catch (e) {
      print(e);
    };
    return result.length > 0 ? User.fromJson(result[0]) : null;
  }*/

/*  Future<User> getUserByApiKey(String apiKey) async {
    var dbClient = await db;
    var result =[];
    try {
      result =await dbClient.rawQuery(
          "SELECT * FROM ${Constants.TABLE_NAME} where ${Constants.COLUMN_api_key} = '$apiKey'");
    } catch (e) {
      print(e);
    }
    return result.length > 0 ? User.fromJson(result[0]) : null;
  }*/

  Future<List<TableModel>> getAllJobs() async {
    var dbClient = await db;
    var result = [];
    try {
      result = await dbClient!
          .rawQuery("SELECT * FROM ${'jobs'} where ${'id'} IS NOT NULL");
      print(result);
    } catch (e) {
      print(e);
    }
    return result.map((e) => TableModel.fromJson(e)).toList();
  }

  Future<int> addJob(TableModel tableRow) async {
    print("trigger");
    var dbClient = await db;
    var count = await dbClient!.insert('jobs', tableRow.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    print("Item inserted $count");
    return count;
  }

  Future<int> deleteJob(int id) async {
    var dbClient = await db;
    var count = await dbClient!
        .rawDelete('DELETE FROM ${'jobs'} where ${'id'} = "$id"');
    return count;
  }

/*  Future<int> deleetAllProduct() async {
    var dbClient = await db;
    var count = await dbClient.rawDelete('DELETE FROM ${Constants.TABLE_NAME}');
    return count;
  }*/

/*  Future<int> updateJob(TableModel tableRow) async {
    var dbClient = await db;
    var result = await dbClient!.update('jobs',tableRow.toJson(),where: 'id = ?',whereArgs: [tableRow.id]);
    return result;
  }*/

  Future<int> updateJob(TableModel tableRow) async {
    var dbClient = await db;
    var result = await dbClient!.update('jobs', tableRow.toJson(),
        where: 'id = ?', whereArgs: [tableRow.id]);
    return result;
  }

  /// Count number of tables in DB
/*  Future countTable() async {
    var dbClient = await db;
    var res =
    await dbClient.rawQuery("""SELECT count(*) as count FROM sqlite_master
         WHERE type = 'table'
         AND name != 'android_metadata'
         AND name != 'sqlite_sequence';""");
    return res[0]['count'];
  }*/
}
