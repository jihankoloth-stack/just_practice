import 'package:hive_flutter/hive_flutter.dart';
import 'package:just_do/model/student_model.dart';

class Service {
Box<StudentModel>box=Hive.box<StudentModel>("students");
// save
Future<void>save(StudentModel saves)async{
  await box.add(saves);
}

// list
List<StudentModel>get(){
  return box.values.toList();
}
// delete
Future<void>delete(int index)async{
 await box.deleteAt(index);
}

// update
Future<void>update(int index , StudentModel saves)async{
  await box.putAt(index, saves);

}
}