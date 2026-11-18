
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:just_do/model/student_model.dart';
import 'package:just_do/service/student_service.dart';

class Homepage extends StatefulWidget {
  final String username;
  const Homepage({super.key,required this.username});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

final services=StudentService();
final nameController=TextEditingController();
final ageController =TextEditingController();

int? editindex;


void save()async{

  String name= nameController.text;
  String age=ageController.text;

  if(name.isEmpty||age.isEmpty){
    return;
  }

  StudentModel students =StudentModel(
    name: name,
     age: age
     );

     if(editindex == null){
      await services.saves(students);
     }else{
      await services.update(editindex!, students);
      editindex = null;
     }

     nameController.clear();
     ageController.clear();

     if(!mounted)return;

     Navigator.pop(context);
}


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
            ElevatedButton(onPressed: (){
              save();
            },
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
      appBar: AppBar(
        backgroundColor: Colors.blue,
        toolbarHeight: 50,
        title: Text(widget.username),
        centerTitle: true,
      ),
      body: SafeArea(
        child:Padding(padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child:ValueListenableBuilder(
                valueListenable:services.box.listenable(),
                 builder: (context,box,child){
                  final students =services.list();

                  if(students.isEmpty){
                   return Center(
                      child:Text("students not added yet"),
                  );
                  }
                  
                  return ListView.builder(
                    itemCount: students.length,
                    itemBuilder:(context,index){

                     return Card(
                      margin: EdgeInsets.all(10),
                      elevation: 3,
                      child: ListTile(
                        
                    title: Text(students[index].name),
                    subtitle: Text(students[index].age),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                       IconButton(onPressed: (){
                        nameController.text=students[index].name;
                        ageController.text=students[index].age;
                        editindex=index;
                        pop();
                       },
                        icon: Icon(Icons.edit)),


                       IconButton(onPressed: ()async{
                        await services.delete(index);

                       },
                        icon: Icon(Icons.delete)),
                      ],
                    ),
                      ),
                     );
                    } 
                    );
                 }
                 ), 
              )
          ],
        ),
        ) 
        ),
    );
  }
}