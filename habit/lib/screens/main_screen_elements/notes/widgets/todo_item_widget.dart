import 'package:flutter/material.dart';
import 'package:habit/screens/main_screen_elements/notes/screens/notes_screen.dart';

class TodoItemWidget extends StatelessWidget {
  final TodoItem todo;
  final ValueChanged<bool> onToggle;

  const TodoItemWidget({
    Key? key,
    required this.todo,
    required this.onToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: todo.isCompleted,
        onChanged: (value) => onToggle(value!),
      ),
      title: Text(
        todo.text,
        style: TextStyle(
          fontSize: 18,
          fontFamily: 'Inter',
          decoration: todo.isCompleted ? TextDecoration.lineThrough : null,
        ),
      ),
    );
  }
}