import 'package:flutter/material.dart';

class Imc extends StatefulWidget {
  @override
  _ImcState createState() => _ImcState();
}

class _ImcState extends State<Imc> {
  final TextEditingController _alturaController = TextEditingController();
  final TextEditingController _pesoController = TextEditingController();
  final key = GlobalKey<ScaffoldState>();
  var _resultado = '';
  var _situacao = '';

  _onItemTapped(int index) {
    if (index == 0) {
      _alturaController.clear();
      _pesoController.clear();
      setState(() {
        _resultado = '';
        _situacao = '';
      });

    } else if (_alturaController.text.isEmpty || _pesoController.text.isEmpty) {
      key.currentState.showSnackBar(SnackBar(
        content: Text('Altura e peso são obrigatórios'),
      ));
    } else {
      try {
        var peso = double.parse(_pesoController.text);
        var altura = double.parse(_alturaController.text);
        var imc = peso / (altura * altura);
        setState(() {
          _resultado = 'Seu IMC é ${imc.toStringAsFixed(2)}';

          if (imc < 17){
            _situacao ='Muito abaixo do peso';
          }
          else if (imc >= 17 && imc < 18.5){
            _situacao = 'Abaixo do peso';
          }
          else if (imc >= 18.5 && imc < 25){
            _situacao = 'Peso Normal';
          }
          else if (imc >= 25 && imc < 30){
            _situacao = 'Acima do Peso';
          }
          else if (imc >= 30 && imc < 35){
            _situacao = 'Obesidade I';
          }
          else if (imc >= 35 && imc < 40){
            _situacao = 'Obesidade II (Severa)';
          }
          else{
            _situacao = 'Obesidade III (Mórbida)';
          }

        });
      } catch (e) {
        key.currentState.showSnackBar(SnackBar(
          content: Text('Altura ou peso foram informados em formato inválido'),
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
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
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
                hintText: 'Altura',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                icon: Icon(Icons.accessibility)),
          ),
          TextField(
            controller: _pesoController,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
                hintText: 'Peso',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                icon: Icon(Icons.person)),
          ),
          Text('$_resultado',style: TextStyle(fontSize: 30)),
          Text('$_situacao',style: TextStyle(fontSize: 30))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.indigo,
        onTap: (value) => _onItemTapped(value),
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
