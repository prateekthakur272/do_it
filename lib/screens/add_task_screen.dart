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
          IconButton(onPressed: (){}, icon: const Icon(Icons.done))
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const Text('List Name',
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
