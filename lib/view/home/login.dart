import 'package:flutter/material.dart';
import 'package:just_do/view/home/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  void login() async {
    final name = nameController.text;
    final password = passwordController.text;

    if (name.isNotEmpty && password.isNotEmpty) {
      final save = await SharedPreferences.getInstance();
      await save.setBool("save", true);
      await save.setString("username", name);

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
          padding: EdgeInsets.all(10),
          child: Center(
            child: Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              height: 200,
              // color: Colors.amber,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "name",
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "password",
                    ),
                  ),
                  SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () {
                      login();
                    },
                    child: Text("login"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
