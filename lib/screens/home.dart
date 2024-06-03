import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:todo_app/widgets/todo_item.dart";

import "../models/todo.dart";

class home extends StatefulWidget {
  home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  final todoList = Todo.todoList();
  List<Todo> _foundtodo = [];
  final _todocontroller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    _foundtodo = todoList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEFF5),
      appBar: AppBar(
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.menu,
              color: Colors.black,
              size: 30,
            ),
            Container(
              height: 40,
              width: 40,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child:
                    // Image.asset("assets/photo.png"),
                    Icon(Icons.person),
              ),
            ),
          ],
        ),
        backgroundColor: Color(0xFFEEEFF5),
      ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                    onChanged: (value) => _runFilter(value),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(0),
                        prefixIcon: Icon(Icons.search),
                        hintText: "Search",
                        prefixIconConstraints:
                            BoxConstraints(maxHeight: 20, maxWidth: 25),
                        border: InputBorder.none),
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 50, bottom: 20),
                        child: Text(
                          "All Todos",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w500),
                        ),
                      ),
                      for (Todo todoo in _foundtodo.reversed)
                        todoitem(
                          todo: todoo,
                          onTodochanges: _hendletodochange,
                          onDeleteitem: _deleteTodoitem,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 10.0,
                            spreadRadius: 0.0)
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: _todocontroller,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Add a new todo here"),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20, right: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      addTodoitem(_todocontroller.text);
                    },
                    child: Text(
                      "+",
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 45, 114, 218),
                        foregroundColor: Colors.white,
                        elevation: 10),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _hendletodochange(Todo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteTodoitem(String id) {
    setState(() {
      todoList.removeWhere((item) => item.id == id);
    });
  }

  void addTodoitem(String todo) {
    setState(() {
      todoList.add(Todo(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          todoText: todo));
    });
    _todocontroller.clear();
  }

  void _runFilter(String enterKeyword) {
    List<Todo> result = [];
    if (enterKeyword.isEmpty) {
      result = todoList;
    } else {
      result = todoList
          .where((element) => element.todoText!
              .toLowerCase()
              .contains(enterKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundtodo = result;
    });
  }
}
