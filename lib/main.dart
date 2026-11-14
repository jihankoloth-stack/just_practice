import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:just_do/model/student_model.dart';
import 'package:just_do/view/home/home.dart';

void main()async{
WidgetsFlutterBinding.ensureInitialized();

await Hive.initFlutter();

Hive.registerAdapter(StudentModelAdapter());

await Hive.openBox<StudentModel>("students");

  runApp(JKapp());

}
class JKapp extends StatelessWidget {
  const JKapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}