import 'package:flutter/material.dart';
import 'package:just_do/view/home/add.dart';

class Homepage extends StatefulWidget {
  final String? username;
  const Homepage({super.key,required this.username});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, 
          MaterialPageRoute(builder: (context) => Addpage(),)
          );
        },
        child:Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text(widget.username!),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
    );
  }
}