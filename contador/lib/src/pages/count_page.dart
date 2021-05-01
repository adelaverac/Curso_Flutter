import 'package:flutter/material.dart';

class CountPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CountPageState();
}

class CountPageState extends State<CountPage> {
  final _textStyle = new TextStyle(fontSize: 25);
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App ejemplo 1'),
        centerTitle: true,
        elevation: 2.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Numero de clicks',
              style: _textStyle,
            ),
            Text(
              '$_count',
              style: _textStyle,
            )
          ],
        ),
      ),
      floatingActionButton: _createButtons(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _createButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        SizedBox(width: 30),
        FloatingActionButton(
            onPressed: _restart, child: Icon(Icons.exposure_zero)),
        Expanded(child: SizedBox()),
        FloatingActionButton(onPressed: _remove, child: Icon(Icons.remove)),
        SizedBox(width: 5.0),
        FloatingActionButton(onPressed: _add, child: Icon(Icons.add)),
        SizedBox(width: 5.0)
      ],
    );
  }

  void _add() {
    setState(() => _count++);
  }

  void _remove() {
    setState(() => _count--);
  }

  void _restart() {
    setState(() => _count = 0);
  }
}
