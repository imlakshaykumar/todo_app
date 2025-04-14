import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final VoidCallback onChanged;

  const TaskTile({super.key, required this.task, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task.title,
        style: TextStyle(
          decoration: task.isCompleted ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        value: task.isCompleted,
        onChanged: (_) => onChanged(),
      ),
    );
  }
}
