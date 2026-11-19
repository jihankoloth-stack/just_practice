import 'package:flutter/material.dart';
import 'package:just_do/view/home/home.dart';
import 'package:just_do/view/home/login.dart';
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),()async{
   checklogin();
    });
  }
  Future<void>checklogin()async{
    final login=await SharedPreferences.getInstance();
    final savelogin=login.getBool("save")?? false;
    final username=login.getString("username")??"";
    if(!mounted)return;


    if(savelogin){
      Navigator.pushReplacement(context,
       MaterialPageRoute(builder: (context) =>Homepage(username:username,),)
       );
    }else{
      Navigator.pushReplacement(context,
       MaterialPageRoute(builder: (context) =>Loginpage() ,)
       );
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
    );
  }
}