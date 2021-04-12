import 'package:calculadora_kleber/controllers/calculator_controller.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final _controller = CalculatorController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Calculadora'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.search),
              onPressed: (){},
          ),
          new IconButton(icon: new Icon(Icons.menu),
            onPressed: (){
             Share.share('Calculadora do Kleber https://medium.com/flutter-comunidade-br/desenvolvimento-de-uma-calculadora-simples-com-flutter-56106baae51',subject:'Para mais informações');
            },
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _histDisplay(historico: _controller.historico),
          _buildDisplay(result: _controller.result),
          Divider(color: Colors.white),
          _buildKeyboard(),
        ],
      ),
    );
  }

  _buildKeyboard() {
    return Container(
      height: 500,
      color: Colors.black,
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildButton(label: 'AC', color: Colors.deepOrange),
                _buildButton(label: 'DEL', color: Colors.deepOrange),
                _buildButton(label: '%', color: Colors.deepOrange),
                _buildButton(label: '/', color: Colors.deepOrange),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildButton(label: '7'),
                _buildButton(label: '8'),
                _buildButton(label: '9'),
                _buildButton(label: 'x', color: Colors.deepOrange),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildButton(label: '4'),
                _buildButton(label: '5'),
                _buildButton(label: '6'),
                _buildButton(label: '+', color: Colors.deepOrange),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildButton(label: '1'),
                _buildButton(label: '2'),
                _buildButton(label: '3'),
                _buildButton(label: '-', color: Colors.deepOrange),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildButton(label: '0', flex: 2),
                _buildButton(label: ','),
                _buildButton(label: '=', color: Colors.deepOrange),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildDisplay({String result}) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        alignment: Alignment.bottomRight,
        child: Text(
          result,
          textAlign: TextAlign.right,
          style: TextStyle(
            color: Colors.white,
            fontSize: 52,
            fontWeight: FontWeight.w300,
            fontFamily: "Calculator"
          ),
        ),
      ),
    );
  }
    _histDisplay({String historico}) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        alignment: Alignment.bottomRight,
        child: Text(
          historico,
          textAlign: TextAlign.right,
          style: TextStyle(
            color: Colors.white,
            fontSize: 52,
            fontWeight: FontWeight.w300,
            fontFamily: "Calculator"
          ),
        ),
      ),
    );
  }

  _buildButton({String label, int flex = 1, Color color = Colors.white}) {
    return Expanded(
      flex: flex,
      child: RaisedButton(
        color: Colors.black,
        child: Text(
          label ?? '',
          style: TextStyle(
            color: color,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () {
          setState(() {
            _controller.applyCommand(label);
          });
        },
      ),
    );
  }
}
