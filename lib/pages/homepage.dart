import 'package:flutter/material.dart';
import 'package:ftodo_local/utility/dialogbox.dart';
import 'package:ftodo_local/utility/list_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List todoList = [
    ['go to market', false],
    ['buy groceries', false],
    ['pay bills', false],
  ];
  final TextEditingController _taskController = TextEditingController();
  void checkTheBoxMethod(bool? value, int index) {
    if (value == null) return;
    setState(() {
      todoList[index][1] = value;
    });
  }

  // save the task
  void saveTask() {
    if (_taskController.text.isNotEmpty) {
      setState(() {
        todoList.add([_taskController.text, false]); // Add new task
      });
      _taskController.clear(); // Clear the input field
    }
    Navigator.of(context).pop(); // Close dialog after adding
  }

  // function to add new task
  void addNewTask() {
    // no need to pass any parameter
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _taskController,
          onSave: saveTask,
          onCancel: () {
            _taskController.clear(); //clear the input field
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      appBar: AppBar(
        title: const Text('Todo App'),
        backgroundColor: Colors.amber[300],
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: todoList.length, // to get the length of the list
        itemBuilder: (context, index) {
          return TodoTile(
            taskName:
                todoList[index][0], //returning the task name the first element of the list
            taskCompleted:
                todoList[index][1], //returning the task completed status the second element of the list
            onCheckboxChanged:
                (value) => checkTheBoxMethod(
                  value,
                  index,
                ), // value is the bool value of the checkbox and index is the index of the list
          );
        },
      ),
      // floating action button to add new task
      floatingActionButton: FloatingActionButton(
        onPressed: addNewTask,
        child: const Icon(Icons.add),
        backgroundColor: Colors.amber[300],
      ),
    );
  }
}
