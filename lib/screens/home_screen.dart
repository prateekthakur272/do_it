import 'package:do_it/models/task.dart';
import 'package:do_it/screens/add_task_screen.dart';
import 'package:do_it/screens/settings_screen.dart';
import 'package:flutter/material.dart';

import '../database/db_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Do It'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const SettingsScreen()));
              },
              icon: const Icon(Icons.settings))
        ],
      ),
      body: Center(
        child: FutureBuilder(
          future: DatabaseHelper.getTasks(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.isEmpty) {
                return const Text(
                  'No tasks',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                );
              }
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) => CheckboxListTile(
                  value: snapshot.data![index].status==TaskStatus.done,
                  onChanged: (value) {},
                  title: Text(snapshot.data![index].title),
                  subtitle: Text(snapshot.data![index].description),
                  controlAffinity: ListTileControlAffinity.leading,
                ),
              );
            }
            if (snapshot.hasError) {
              return const Text(
                'Some Error Occurred',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              );
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddTaskScreen()));
        },
        child: const Icon(Icons.add),
      ),
      drawer: const NavigationDrawer(children: [
        DrawerHeader(
            child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Do It',
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
              Text(
                'Finish all tasks and enjoy',
                style: TextStyle(
                  fontSize: 16,
                ),
              )
            ],
          ),
        ))
      ]),
    );
  }
}
