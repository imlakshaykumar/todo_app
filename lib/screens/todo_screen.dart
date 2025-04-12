import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/components/header.dart';
import 'package:todo_app/theme/theme_notifier.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
