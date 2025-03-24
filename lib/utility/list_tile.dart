import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)?
  onCheckboxChanged; //add nullsafety else constructor will throw error[outer ? for constructor and inner ? for function]
  final VoidCallback dltmethod; //function to delete the task
  TodoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onCheckboxChanged,
    required this.dltmethod,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      //remove container margin and add padding and add padding widget
      padding: const EdgeInsets.all(8.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed:
                  (context) =>
                      dltmethod(), // Add parentheses to call the function
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(12),
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.amber[300],
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
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
        ),
      ),
    );
  }
}
