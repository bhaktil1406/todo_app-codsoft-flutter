import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';

class todoitem extends StatelessWidget {
  final Todo todo;
  final onTodochanges;
  final onDeleteitem;
  const todoitem(
      {super.key,
      required this.todo,
      required this.onDeleteitem,
      required this.onTodochanges});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          onTodochanges(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.white,
        leading: Icon(
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank_rounded,
          color: Color.fromARGB(255, 45, 114, 218),
        ),
        title: Text(
          todo.todoText!,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
            decoration: todo.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(5)),
          child: IconButton(
            icon: Icon(
              Icons.delete,
              color: Colors.white,
            ),
            iconSize: 18,
            onPressed: () {
              onDeleteitem(todo.id);
            },
          ),
        ),
      ),
    );
  }
}
