import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:just_do/view/home/splash.dart';

void main()async{

  WidgetsFlutterBinding.ensureInitialized();
 await Hive.initFlutter();
 await Hive.openBox("students");
  runApp(JKapp());
}
class JKapp extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splashscreen(),
    );
  }
}