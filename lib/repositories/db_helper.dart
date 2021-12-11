
// import 'package:sqflite/sqflite.dart';
// import 'dart:io' as io;
// import 'package:path_provider/path_provider.dart';
// import 'dart:async';
// import 'package:path/path.dart';


// class DBHelper{
//   static Database _db;
//   static const String DB_NAME = 'tdnote.db';

//   static const String ID = 'id';
//   static const String TITLE = 'title';
//   static const String TASK = 'task';
//   static const String DATE = 'date';
//   static const String TIME = 'time';
//   static const String REPEAT = 'repeat';

//   static const String TABLE = 'ToDoTable';

  

//   Future<Database> get db async{
//     if(_db != null){
//       return _db;
//     }

//     _db = await initDb();
//     return _db;
//   }

//   initDb() async{
//     io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
//     String path = join(documentsDirectory.path, DB_NAME);
//     var db = await openDatabase(path, version: 1,onCreate: _onCreate);
//     return db;
//   }

//   _onCreate(Database db, int version) async{
//     await db
//     .execute("CREATE TABLE $TABLE($ID INTEGER PRIMARY KEY, $TITLE TEXT, $TASK TEXT,$DATE TEXT,$TIME TEXT,$REPEAT TEXT)");
//   }

// }