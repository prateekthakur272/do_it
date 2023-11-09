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
        leading: IconButton(onPressed: (){}, icon: const Icon(Icons.list_alt_rounded),),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute( builder: (BuildContext context) => const SettingsScreen()));
          }, icon: const Icon(Icons.settings))
        ],
      ),
    );
  }
}
