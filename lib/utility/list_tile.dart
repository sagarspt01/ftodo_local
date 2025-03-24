import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)?
  onCheckboxChanged; //add nullsafety else constructor will throw error[outer ? for constructor and inner ? for function]
  TodoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onCheckboxChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.amber[300],
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(color: Colors.grey, blurRadius: 5, offset: Offset(0, 2)),
        ],
      ),
      child: Row(
        children: [
          Checkbox(
            value: taskCompleted,
            onChanged: onCheckboxChanged, //bool ? for nullsafety above
          ),
          Text(
            taskName,
            style: TextStyle(
              decoration:
                  taskCompleted
                      ? TextDecoration.lineThrough
                      : null, //if task is completed then line through else null
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
