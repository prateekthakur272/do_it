import 'package:do_it/settings_screen.dart';
import 'package:flutter/material.dart';

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
        // leading: IconButton(
        //   onPressed: () {
        //
        //   },
        //   icon: const Icon(Icons.list_alt_rounded),
        // ),
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
      body: ListView(
        children: [
          CheckboxListTile(
            value: true,
            onChanged: (value) {},
            controlAffinity: ListTileControlAffinity.leading,
            isThreeLine: true,
            title: const Text('Title'),
            subtitle: const Text(
                'Description is Description is Description is Description is Description is Description is.'),
          ),
          CheckboxListTile(
            value: true,
            onChanged: (value) {},
            controlAffinity: ListTileControlAffinity.leading,
            isThreeLine: true,
            title: const Text('Title'),
            subtitle: const Text(
                'Description is Description is Description is Description is Description is Description is.'),
          ),
          CheckboxListTile(
            value: true,
            onChanged: (value) {},
            controlAffinity: ListTileControlAffinity.leading,
            isThreeLine: true,
            title: const Text('Title'),
            subtitle: const Text(
                'Description is Description is Description is Description is Description is Description is.'),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      drawer: NavigationDrawer(
        children: [
          const DrawerHeader(
              child: Align(
                  child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Do It',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              Text('finish all and enjoy')
            ],
          ))),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.add),
            title: const Text('Create List'),
          ),
          ListTile(
            onTap: () {},
          )
        ],
      ),
    );
  }
}
