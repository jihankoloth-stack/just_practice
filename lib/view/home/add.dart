import 'package:flutter/material.dart';

class Addpage extends StatefulWidget {
  const Addpage({super.key});

  @override
  State<Addpage> createState() => _AddpageState();
}

class _AddpageState extends State<Addpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:Padding(padding: EdgeInsets.all(10),
        child: Center(
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "name",
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "mark",
                ),
              ),
              SizedBox(height: 10,),
              ElevatedButton(onPressed: (){},
               child: Text("save")
               ),
            ],
          ),
        ),
        )
         ),
    );
  }
}