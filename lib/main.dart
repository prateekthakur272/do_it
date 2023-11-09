import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Do It',
      home: Placeholder(),
    );
  }
}


void main(List<String> args) {
  runApp(const App());
}
