import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/screens/todo_screen.dart';
import 'package:todo_app/theme/theme_notifier.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      title: 'Todo App',
      debugShowCheckedModeBanner: false,
      theme: themeProvider.currentTheme,
      home: const TodoScreen(),
    );
  }
}
