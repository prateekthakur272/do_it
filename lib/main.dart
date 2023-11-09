import 'package:do_it/home_screen.dart';
import 'package:flutter/material.dart';

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
      theme: ThemeData(
        useMaterial3: true,
      ),
    );
  }
}


void main(List<String> args) {
  runApp(const App());
}
