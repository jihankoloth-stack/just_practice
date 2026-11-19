
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:just_do/service/student_service.dart';
import 'package:just_do/view/home/add.dart';

class Homepage extends StatefulWidget {
  final String? username;
  const Homepage({super.key,required this.username});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final service=StudentService();

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, 
          MaterialPageRoute(builder: (context) => Addpage(),)
          );
        },
        child:Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text(widget.username!),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body:ValueListenableBuilder(
        valueListenable:service.box.listenable() ,
         builder: (context,box,child){
          final students=service.list();

          if(students.isEmpty){
            return Center(
              child: Text("students not added yet"),
            );
          }
          return ListView.builder(
            itemCount: students.length,
            itemBuilder:(context,index){
            final student=students[index];

            return Card(
            margin: EdgeInsets.all(10),
            elevation: 3,
            child: ListTile(
              title: Text(student.name),
              subtitle: Text(student.mark),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                IconButton(onPressed: (){
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => Addpage(student: student,intex: index,),));
                },
                 icon: Icon(Icons.edit)
                 ),
                IconButton(onPressed: (){
                  service.delete(index);
                },
                 icon: Icon(Icons.delete)
                 )
                ],
              ),
            ),
            );
            } 
            );
         },
         ),
    );
  }
}