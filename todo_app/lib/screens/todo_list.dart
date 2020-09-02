import 'package:flutter/material.dart';
import 'package:todo_app/screens/todo_item.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  var list = ['teste1', 'teste2', 'teste3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Todo App'),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(list[index]),
              subtitle: Text(list[index]),
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => TodoItem())),
            );
          },
          separatorBuilder: (context, index) => Divider(),
          itemCount: list.length),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(Icons.add),
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => TodoItem())),
      ),
    );
  }
}
