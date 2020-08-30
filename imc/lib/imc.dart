import 'package:flutter/material.dart';

class Imc extends StatefulWidget {
  @override
  _ImcState createState() => _ImcState();
}

class _ImcState extends State<Imc> {
  final TextEditingController _alturaController = TextEditingController();
  final TextEditingController _pesoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cálculo do IMC'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            "assets/balance.png",
            width: 90,
          ),
          TextField(
            controller: _alturaController,
            decoration: InputDecoration(
                hintText: 'Altura',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                icon: Icon(Icons.accessibility)),
          ),
          TextField(
            controller: _pesoController,
            decoration: InputDecoration(
                hintText: 'Peso',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                icon: Icon(Icons.person)),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.indigo,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.clear,
                color: Colors.white,
              ),
              title: Text(
                'Limpar',
                style: TextStyle(color: Colors.white),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.check,
                color: Colors.white,
              ),
              title: Text('Limpar', style: TextStyle(color: Colors.white)))
        ],
      ),
    );
  }
}
