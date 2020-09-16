import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/models/Todo.dart';

class TodoItem extends StatefulWidget {
  @override
  _TodoItemState createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  final _tituloController = TextEditingController();
  final _descricaoController = TextEditingController();

  _saveItem() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Todo> list = [];
    var data = prefs.getString('list');
    if (data != null) {
      var objs = jsonDecode(data) as List;
      list = objs.map((obj) => Todo.fromJson(obj)).toList();
    }

    Todo todo = Todo.fromTituloDescricao(
        _tituloController.text, _descricaoController.text);
    list.add(todo);
    prefs.setString('list', jsonEncode(list));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('TodoItem'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _tituloController,
              decoration: InputDecoration(
                  hintText: 'Título', border: OutlineInputBorder()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _descricaoController,
              decoration: InputDecoration(
                  hintText: 'Descrição', border: OutlineInputBorder()),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: ButtonTheme(
                  minWidth: 100,
                  child: RaisedButton(
                    child: Text(
                      'Salvar',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    color: Colors.green,
                    textColor: Colors.white,
                    onPressed: _saveItem,
                  )))
        ],
      ),
    );
  }
}
