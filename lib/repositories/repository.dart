// ignore: import_of_legacy_library_into_null_safe
import 'package:sqflite/sqflite.dart';
import 'package:todo_my/repositories/database_connection.dart';

class Repository{
  late DatabaseConnection _databaseConnection;

  Repository() {
    _databaseConnection = DatabaseConnection();
  }

  static Database? _database;

  Future<Database> get database async{
    if(_database!=null) return _database!;
    _database = await _databaseConnection.setDatabase();
    return _database!;
  }

  insertData(table, data) async{
    var connection = await database;
    return await connection.insert(table, data);
  }

}