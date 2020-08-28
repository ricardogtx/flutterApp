import 'package:flutter/material.dart';

void main() {
  runApp(Hello());
}

class Hello extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Material(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            "assets/logo.jpg",
            width: 90,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('Hello', style: TextStyle(fontSize: 30)),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Text('Android', style: TextStyle(fontSize: 30)),
            ),
            Text('World', style: TextStyle(fontSize: 30)),
          ]),
          FlatButton(
            onPressed: () => {
              debugPrint('clicou')
            },
            color: Colors.lightGreen,
            child: Text(
              'Teste',
              style: TextStyle(fontSize: 20),
            ),
          )
        ],
      ),
    ));
  }
}
