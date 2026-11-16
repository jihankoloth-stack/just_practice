import 'package:flutter/material.dart';
import 'package:just_do/view/home/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Loginpage extends StatefulWidget {
  const new({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {

  final namecontroller=TextEditingController();
  final passwordController =TextEditingController();

  void Login()async{
    String name =namecontroller.text;
    String password =passwordController.text;

    if(name .isNotEmpty && password .isNotEmpty){
      final savelogin=await SharedPreferences.getInstance();
      await savelogin.setBool("login", true);

      if(!mounted)return;

      Navigator.pushReplacement(context,
       MaterialPageRoute(builder: (context)=>Homepage())
       );


    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: SafeArea(
      child: Column(
        children: [
          TextField(
            controller: namecontroller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "enter your name"
            ),
          ),
          SizedBox(height:5,),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "enter your password"
            ),
          ),
          SizedBox(height: 10,),
          ElevatedButton(onPressed: (){
            Login();
          },
           child: Text("Login"),
           ),

        ],
      )
      ),
    );
  }
}