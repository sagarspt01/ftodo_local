import 'package:flutter/material.dart';
import 'package:ftodo_local/utility/list_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      appBar: AppBar(
        title: const Text('Todo App'),
        backgroundColor: Colors.amber[300],
        elevation: 0,
      ),
      body: ListView(
        children: [
          TodoTile(
            taskName: 'go to gym',
            taskCompleted: true,
            onCheckboxChanged: (p0) {},
          ),
        ], //p0 is bool? for nullsafety
      ),
    );
  }
}
