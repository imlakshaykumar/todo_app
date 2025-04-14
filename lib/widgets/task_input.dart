import 'package:flutter/material.dart';

class TaskInput extends StatefulWidget {
  final Function(String) onSubmit;

  const TaskInput({super.key, required this.onSubmit});

  @override
  State<TaskInput> createState() => _TaskInputState();
}

class _TaskInputState extends State<TaskInput> {
  final TextEditingController _controller = TextEditingController();

  void _handleSubmit() {
    widget.onSubmit(_controller.text);
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Add a new task',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (_) => _handleSubmit(),
            ),
          ),
          // ElevatedButton(onPressed: _handleSubmit, child: Text('Add')),
          IconButton(icon: Icon(Icons.add), onPressed: _handleSubmit),
        ],
      ),
    );
  }
}
