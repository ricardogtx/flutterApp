import 'package:flutter/material.dart';

class Contador extends StatefulWidget {
  @override
  _ContadorState createState() => _ContadorState();
}

class _ContadorState extends State<Contador> {
  var quantidade = 0;

  incrementar(){
    setState(() {
      quantidade++;
    });
  }

  decrementar(){
    setState(() {
      quantidade--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Contador'),
        backgroundColor: Colors.indigo,
      ),
      body: ListView(
        children: [
          Card(
            child: Column(
              children: [
                ListTile(
                  title: Text('Quantidade', style: TextStyle(fontSize: 30),)
                ),
                Text('$quantidade', style: TextStyle(fontSize: 30),),
                ButtonBar(
                  children: [
                    FlatButton(
                      child: Text('Incrementar', style: TextStyle(fontSize: 20),),
                      onPressed: incrementar,
                    ),
                    FlatButton(
                      child: Text('Decrementar', style: TextStyle(fontSize: 20),),
                      onPressed: decrementar,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
