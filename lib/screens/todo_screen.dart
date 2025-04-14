import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/components/header.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/theme/theme_notifier.dart';
import 'package:todo_app/widgets/task_input.dart';
import 'package:todo_app/widgets/task_tile.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  List<Task> tasks = [];
  String filter = 'All';

  void addTask(String taskName) {
    setState(() {
      tasks.add(Task(title: taskName));
    });
  }

  void toggleTask(int index) {
    setState(() {
      tasks[index].isCompleted = !tasks[index].isCompleted;
    });
  }

  void updateFilter(String newFilter) {
    setState(() {
      filter = newFilter;
    });
  }

  List<Task> getFilteredTasks() {
    if (filter == "Completed") {
      return tasks.where((t) => t.isCompleted).toList();
    } else if (filter == "Incomplete") {
      return tasks.where((t) => !t.isCompleted).toList();
    }
    return tasks;
  }

  @override
  Widget build(BuildContext context) {
    List<Task> filtered = getFilteredTasks();

    return SafeArea(
      child: Scaffold(
        appBar: Header(
          title: 'Todo App',
          actionButton: IconButton(
            icon: Icon(
              Provider.of<ThemeNotifier>(context).isDarkTheme
                  ? Icons.dark_mode
                  : Icons.light_mode,
            ),
            onPressed: () {
              Provider.of<ThemeNotifier>(context, listen: false).toggleTheme();
            },
          ),
        ),
        body: Column(
          children: [
            TaskInput(onSubmit: addTask),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:
                  ["All", "Completed", "Incomplete"].map((f) {
                    return ElevatedButton(
                      onPressed: () => updateFilter(f),
                      child: Text(f),
                    );
                  }).toList(),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filtered.length,
                itemBuilder: (context, index) {
                  return TaskTile(
                    task: filtered[index],
                    onChanged: () => toggleTask(index),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
