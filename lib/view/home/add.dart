import 'package:flutter/material.dart';
import 'package:just_do/model/student_model.dart';
import 'package:just_do/service/student_service.dart';

class Addpage extends StatefulWidget {
  final StudentModel? student;
  final int? intex;
  const Addpage({super.key, this.student, this.intex});

  @override
  State<Addpage> createState() => _AddpageState();
}

class _AddpageState extends State<Addpage> {
  @override
  void initState() {
    super.initState();

    if (widget.student != null) {
      nameController.text = widget.student!.name;
      markController.text = widget.student!.mark;

      //  = widget.intex;
    }
  }

  final nameController = TextEditingController();
  final markController = TextEditingController();
  final service = StudentService();

  void save() async {
    final name = nameController.text;
    final mark = markController.text;

    if (name.isEmpty || mark.isEmpty) {
      return;
    }

    StudentModel students = StudentModel(name: name, mark: mark);

    if (widget.intex == null) {
      await service.add(students);
    } else {
      await service.update(widget.intex!, students);
    }

    if (!mounted) return;

    Navigator.pop(context);

    nameController.clear();
    markController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Center(
            child: Column(
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
                  controller: markController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "mark",
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    save();
                  },
                  child: Text(widget.intex == null ? "save" : "update"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
