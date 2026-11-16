import 'package:hive/hive.dart';
part 'student_model.g.dart';

@HiveType(typeId: 0)
class StudentModel extends HiveObject{
@HiveField(0)
String name;
@HiveField(1)
String age;

StudentModel({
  required this.name,
  required this .age
});
}