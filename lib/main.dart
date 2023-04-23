import 'package:flutter/material.dart';
import 'taskScreen.dart';
void main() {
  runApp(TodoList());
}

class TodoList extends StatelessWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TaskScreen(),
    );
  }
}



