// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io'as io;

class DatabaseConnection{
  setDatabase() async{
    io.Directory documentsDirectory  = await getApplicationDocumentsDirectory();
    var path = join(documentsDirectory.path, 'db_todolist');
    var database = 
      await openDatabase(path, version:1, onCreate: _onCreatingDatabase);
    
    return database;
  }

  _onCreatingDatabase(Database database, int version) async{
    await database.execute("CREATE TABLE categories (id INTEGER PRIMARY KEY, title TEXT, task TEXT)");
  }
}