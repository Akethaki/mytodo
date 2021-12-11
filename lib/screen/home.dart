import 'package:flutter/material.dart';
//import 'list_screen.dart';
import 'note_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({ Key? key }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('All ToDo List'),
          backgroundColor: Colors.cyan[800],
          actions: [
            IconButton(
              onPressed: (){}, 
              icon: const Icon(
                Icons.more_vert,
                color: Colors.white,))
          ],
    
          // bottom: const TabBar(
          //   tabs: [
          //     Tab(icon: Icon(Icons.person, color: Colors.black,)),
          //     Tab(icon: Icon(Icons.home_filled, color: Colors.black,)),
          //     Tab(icon: Icon(Icons.shopping_bag, color: Colors.black,)),
          //   ],
          // ),
        ),
    
        // body: const TabBarView(
        //   children: [
        //     PersonalList(),
        //     WorkList(),
        //     ShopList(),
        //   ],
        // ),

        floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const WorkNote()));
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.cyan[800],
        ),
      ),
    );
  }
}