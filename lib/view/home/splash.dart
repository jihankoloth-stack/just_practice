import 'package:flutter/material.dart';
import 'package:just_do/view/home/home.dart';
import 'package:just_do/view/home/login.dart';
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class Splashscreen extends StatefulWidget {
  const new({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 3),()async{
    chacklogin();
    });
  }

  Future<void>chacklogin()async{
    final loginsave=await SharedPreferences.getInstance();
    final save=loginsave.getBool("login")??false;
    final username =loginsave.getString("username")??"";
   if(!mounted)return;

    if(save){
      Navigator.pushReplacement(context, 
      MaterialPageRoute(builder: (context)=>Homepage(username: username,))
      );
    }else{
      Navigator.pushReplacement(context, 
      MaterialPageRoute(builder: (context) => Loginpage(),),
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