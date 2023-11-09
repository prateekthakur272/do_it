import 'package:do_it/screens/home_screen.dart';
import 'package:do_it/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Do It',
        home: const HomeScreen(),
        theme: Provider.of<ThemeProvider>(context).themeData);
  }
}

void main(List<String> args) {
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) => ThemeProvider(), child: const App()));
}
