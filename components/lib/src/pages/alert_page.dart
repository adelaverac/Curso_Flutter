import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page'),
      ),
      body: Center(
          child: ElevatedButton(
        child: Text('Mostrar mensaje'),
        onPressed: () => _showAlert(context),
        style: ElevatedButton.styleFrom(
            primary: Colors.lightBlue, shape: StadiumBorder()),
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  _showAlert(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            title: Text('Titulo'),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('Este es el contenido de la caja de la alerta'),
                FlutterLogo(size: 100.0)
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Cancelar'),
                onPressed: () => Navigator.of(context).pop(),
              ),
              TextButton(
                child: Text('Continuar'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}
