import 'package:flutter/material.dart';
import 'package:just_do/view/home/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final namecontroller = TextEditingController();
  final passwordController = TextEditingController();

  void login() async {
    final name = namecontroller.text;
    final password = passwordController.text;

    if (name.isNotEmpty && password.isNotEmpty) {
      final savelogin = await SharedPreferences.getInstance();
      await savelogin.setBool("login", true);
      await savelogin.setString("username", name);

      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Homepage(username: name)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                controller: namecontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "enter your name",
                ),
              ),
              SizedBox(height: 5),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "enter your password",
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  login();
                },
                child: Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
