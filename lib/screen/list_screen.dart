import 'package:flutter/material.dart';
import 'package:todo_my/screen/note_screen.dart';

class WorkList extends StatefulWidget {
  const WorkList({ Key? key }) : super(key: key);

  @override
  _WorkListState createState() => _WorkListState();
}

class _WorkListState extends State<WorkList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('hello work')
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => WorkNote()));
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.cyan[800],
        ),
        
    );
  }
}