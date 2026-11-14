
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:just_do/model/student_model.dart';
import 'package:just_do/service/service.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final nameController=TextEditingController();
  final ageController=TextEditingController();
  final students=Service();


  // save
  void save()async{

    String name=nameController.text.trim();
    String age=ageController.text.trim();

    if(name.isEmpty||age.isEmpty){
      return;
    }
    StudentModel student=StudentModel(name: name, age: age);

   await students.save(student);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: SafeArea(
        child:Padding(
          padding:EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter your name",

                ),
              ),
              SizedBox(height: 5,),
              TextField(
                controller: ageController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter your age",
                  
                ),
              ),
              SizedBox(height: 5,),
              ElevatedButton(onPressed: ()async{
                save();
              },
               child:Text("save")
               ),
               Expanded(
                child:ValueListenableBuilder(
                  valueListenable:students.box.listenable() , 
                  builder: (context,box,child){
                    final data=students.get();

                    return ListView.builder(
                      itemCount: data.length,
                      itemBuilder:(context,index){

                        return Card(
                          child: ListTile(
                            title: Text(data[index].name),
                            subtitle: Text(data[index].age),
                          trailing: IconButton(onPressed: (){},
                           icon: Icon(Icons.delete)
                           ),
                          ),
                        );
                      }
                       );
                  }) 
                )
            ],
          ), 
          ) 
        ),
    );
  }
}