import 'dart:nativewrappers/_internal/vm/bin/vmservice_io.dart';

import 'package:flutter/material.dart';
import 'package:just_do/service/service.dart';

class Homepage extends StatefulWidget {
  const new({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

final services=server();

final nameController=TextEditingController();
final ageController =TextEditingController();




  void pop(){
    showDialog(context: context,
     builder: (context){
      return AlertDialog(
        title: Text("fill your from"),
        content: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "enter your name "
              ),
            ),
            SizedBox(height: 5,),
            TextField(
              controller: ageController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "enter your age "
              ),
            ),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: (){},
             child: Text("save")
             )
          ],
        ),
      );
     });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        pop();
      },
      child:Icon(Icons.add),
      ),
    );
  }
}