import 'package:hive_flutter/adapters.dart';
import 'package:just_do/model/student_model.dart';

class StudentService {
  Box<StudentModel>box=Hive.box<StudentModel>("students");

// save
  Future<void>saves(StudentModel data)async{
    await box.add(data);
  }
  // list
  List<StudentModel>list(){
    return box.values.toList();
  }

// dalete
Future<void>delete(int index )async{
    await box.deleteAt(index);
  }

// update
Future<void>update(int index , StudentModel data)async{
    await box.putAt(index,data);
  }


}