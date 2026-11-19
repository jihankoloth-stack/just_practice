import 'package:hive/hive.dart';
import 'package:just_do/model/student_model.dart';

class StudentService {
  Box<StudentModel>box=Hive.box<StudentModel>("students");

  // save
  Future<void>save(StudentModel saves)async{
  await box.add(saves);
  }

  // list/
  List<StudentModel>list(){
    return box.values.toList();
  }
  // update
  Future<void>update(int index,StudentModel saves)async{
    await box.putAt(index, saves);
  }
  // delete
  Future <void>delete(int index)async{
  await box.deleteAt(index);
  }
}