// import 'package:flutter/foundation.dart';

class Category{
  int? id;
  late String title;
  late String task;
  // late String date;
  // late String time;

  categoryMap(){
    Map<String, dynamic> toMap(){
    var mapping = Map<String, dynamic>();
    mapping ['id'] = id;
    mapping ['title'] = title;
    mapping ['task'] = task;

    return mapping;
  }
  }

}







// class Note{
//   int id;
//   String title;
//   String task;
//   String date; 
//   String time;
//   String repeat;

//   Note(this.id, this.title, this.task, this.date, this.time, this.repeat);

//   Map<String, dynamic> toMap() {
//     var map = <String, dynamic>{
//       'id': id,
//       'title': title,
//       'task': task,
//       'date':date,
//       'time':time,
//       'repeat':repeat,
//     };
//     return map;
//   }

//   Note.fromMap(Map<String, dynamic> map){
//     id = map["id"];
//     title = map["title"];
//     task = map["task"];
//     date = map["date"];
//     time = map["time"];
//     repeat = map["repeat"];

// }
// }