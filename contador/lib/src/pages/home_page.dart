import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final textStyle = new TextStyle(fontSize: 25);
  final count = 10;

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
              style: textStyle,
            ),
            Text(
              '$count',
              style: textStyle,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('Hola Mundo');
            //count++;
          },
          child: Icon(Icons.add)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
