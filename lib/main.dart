import 'package:flutter/material.dart';
import 'package:just_do/view/home/splash.dart';

void main(){
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