import 'package:do_it/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        body: ListView(
          children: [
            SwitchListTile(
              value: Provider.of<ThemeProvider>(context).isDark,
              onChanged: (value) {
                Provider.of<ThemeProvider>(context, listen: false).changeTheme();
              },
              title: const Text('Dark Theme'),
              subtitle: Text(Provider.of<ThemeProvider>(context).isDark?'Enabled':'Disabled'),
            ),
          ],
        ),
      ),
    );
  }
}
