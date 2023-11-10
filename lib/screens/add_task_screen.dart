import 'package:do_it/database/db_helper.dart';
import 'package:do_it/models/task.dart';
import 'package:flutter/material.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final title = TextEditingController();
  final description = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(onPressed: (){
            if(title.text.trim().isNotEmpty && description.text.trim().isNotEmpty){
              final task = Task(title.text.trim(), description.text.trim(), TaskStatus.pending);
              DatabaseHelper.addTask(task).then((value){
                Navigator.pop(context);
              });
            }
          }, icon: const Icon(Icons.done))
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const Text('Keep yourself reminded about',
              style: TextStyle(
                fontSize: 20,
              )),
          TextField(
            controller: title,
            decoration: const InputDecoration(label: Text('Title')),
          ),
          const SizedBox(
            height: 4,
          ),
          TextField(
            controller: description,
            decoration: const InputDecoration(label: Text('Description')),
          ),
        ],
      ),
    );
  }
}
