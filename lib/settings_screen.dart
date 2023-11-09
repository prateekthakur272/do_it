import 'package:do_it/main.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool themeSwitch = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            value: themeSwitch,
            onChanged: (value) {
              setState(() {
                themeSwitch = !themeSwitch;
              });
            },
            title: const Text('Dark Theme'),
            subtitle: Text(themeSwitch?'Enabled':'Disabled'),
          )
        ],
      ),
    );
  }
}
