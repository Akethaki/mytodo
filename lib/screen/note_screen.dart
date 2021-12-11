import 'package:flutter/material.dart';
import 'package:todo_my/model/category.dart';
import 'package:todo_my/services/category_services.dart';
import 'home.dart';

class WorkNote extends StatefulWidget {
  

  const WorkNote({ Key? key }) : super(key: key);

  @override
  _WorkNoteState createState() => _WorkNoteState();
}

class _WorkNoteState extends State<WorkNote> {

  var _titleController = TextEditingController();
  var _taskController = TextEditingController();
  //var date;
  var newDate;
  var newTime;
  
  var _category = Category();
  var _categoryService = CategoryServices();

  late DateTime date;
  late TimeOfDay time;


  String getTextD(){
    if (date == null) {
      return 'Select the Date';
    }
    else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }

  String getTextT(){
    if (time == null) {
      return 'Select the Time';
    }
    else {
      final hours = time.hour.toString().padLeft(2, '0');
      final minutes = time.minute.toString().padLeft(2, '0');

      return '$hours:$minutes';
    }
  }


  @override
  void initState() {
    super.initState();
    date = DateTime.now();
    time = TimeOfDay.now();
  }


  // int id;
  // String title;
  // String task;
  // String date; 
  // String time;
  // String repeat;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Widget buildTitle(){
    return TextFormField(
      controller: _titleController,
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
        labelText: 'Task Title',
        labelStyle: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          color: Colors.black
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6.0)),
          borderSide: BorderSide(color: Colors.cyan)
        )
        ),

      maxLines: 1,
      validator: (value){
        if (value!.length < 3){
            return 'Enter at least 3 characters';
        } else{
          return null;
        }
      },
      // onSaved: (value) => title = value,
    );
  }


  Widget buildTask(){
    return TextFormField(
    controller: _taskController,
    keyboardType: TextInputType.text,
    decoration: InputDecoration(
      labelText: 'What Task is to be done?',
      labelStyle: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        color: Colors.black
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(6.0)),
        borderSide: BorderSide(color: Colors.cyan)
      ),
      ),

    maxLines: 1,
    validator: (value){
      if (value!.length < 3){
          return 'Enter at least 3 characters';
      } else{
        return null;
      }
    },
      // onSaved: (value) => title = value,
    ); 
  }


  Widget buildDate(){
    return TextFormField(
    controller: newDate,
    // keyboardType: TextInputType.text,
    decoration: InputDecoration(
      labelText: getTextD(),
      labelStyle: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        color: Colors.black
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(6.0)),
        borderSide: BorderSide(color: Colors.cyan)
      ),
      suffixIcon: IconButton(
        onPressed: () => pickDate(context),
        icon: Icon(
          Icons.date_range
          ),
        )
      ),

    maxLines: 1,
    validator: (value){
      if (value!.length < 0){
          return 'Please add a date';
      } else{
        return null;
      }
    },
      // onSaved: (value) => title = value,
    ); 
  }


  Widget buildTime(){
    return TextFormField(
    controller: newTime,
    keyboardType: TextInputType.text,
    decoration: InputDecoration(
      labelText: getTextT(),
      labelStyle: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        color: Colors.black
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(6.0)),
        borderSide: BorderSide(color: Colors.cyan)
      ),
      suffixIcon: IconButton(
        onPressed: () => pickTime(context),
        icon: Icon(
          Icons.timelapse
          ),
        )
      ),

    maxLines: 1,
    validator: (value){
      if (value!.length < 0){
          return 'Please add a time';
      } else{
        return null;
      }
    },
      // onSaved: (value) => title = value,
    ); 
  }


  // Widget buildRepeat(){
  //   return Container(
      
  //     padding: EdgeInsets.symmetric(horizontal: 10,),
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(6),
  //       border: Border.all(color: Colors.grey.shade500),
  //     ),
  //     child: DropdownButtonHideUnderline(
  //       child: DropdownButton(
  //         value: value,
  //         iconSize: 36,
  //         icon: Icon(Icons.arrow_drop_down, color: Colors.black,),
  //         isExpanded: true,
  //         items: items.map(buildMenuItem).toList(),
  //         onChanged: (value) => setState(() => this.value = value),
  //         ),
  //     ),
  //   );
  // }

  // final items = [
  //   'At time of event', '10 mins before', '1 hour before', '1 day before'
  // ];
  Object? value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Task - Work', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold), ),
        backgroundColor: Colors.cyan[800],
        leading: 
            IconButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
              }, 
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,))
      ),

      body: Container(
        margin: EdgeInsets.all(24),
        child: Form(
          key: formKey,
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildTitle(),
            const SizedBox(height: 36),

            buildTask(),
            const SizedBox(height: 36),

            buildDate(),
            const SizedBox(height: 36),

             buildTime(),
            const SizedBox(height: 36),

            // buildRepeat(),
            //SizedBox(height: 50),

           
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[

                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        _category.title = _titleController.text;
                        _category.task = _taskController.text;
                        // _category.date = newDate;
                        // _category.time = newTime;

                        var result = await _categoryService.saveCategory(_category);
                        print(result);

                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                        ),
                        primary: Colors.cyan[700],
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                        textStyle: const TextStyle(
                          fontStyle: FontStyle.italic, 
                          fontSize: 15.0, 
                          fontWeight: FontWeight.bold, 
                          color: Colors.black
                          ),
                        elevation: 20,
                      ),
                      child: Text('SAVE'),
                    ),
                  ),
                ),


                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // setState(() {
                        //   isUpdating = false;
                        // });
                        // updateName();
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                        ),
                        primary: Colors.cyan[700],
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                        textStyle: TextStyle(
                          fontStyle: FontStyle.italic, 
                          fontSize: 15.0, 
                          fontWeight: FontWeight.bold
                          ),
                        elevation: 20,
                      ),
                      child: Text('UPDATE'),
                    ),
                  ),
                ),


                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // setState(() {
                        //   isUpdating = false;
                        // });
                        // clearName();
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                        ),
                        primary: Colors.cyan[700],
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                        textStyle: TextStyle(
                          fontStyle: FontStyle.italic, 
                          fontSize: 15.0, 
                          fontWeight: FontWeight.bold
                          ),
                        elevation: 20,
                      ),
                      child: Text('CLEAR'),
                    ),
                  ),
                )
              ],
            ),
          ],
        )),
        ),
    );
  }

  Future pickDate(BuildContext context)async{
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context, 
      initialDate: initialDate, 
      firstDate: DateTime(DateTime.now().year - 5), 
      lastDate: DateTime(DateTime.now().year + 5)
      );

      if (newDate == null) return;

      setState(() => date = newDate);
  }

  Future pickTime(BuildContext context)async{
    final initialTime = TimeOfDay(hour: 9, minute: 0);
    final newTime  = await showTimePicker(
      context: context, 
      initialTime: initialTime,
      );

      if (newTime == null) return;

      setState(() => time = newTime);
  }


  // DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
  //   value: item,
  //   child: Text(
  //     item,
  //     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  //   ),
  //   );
}