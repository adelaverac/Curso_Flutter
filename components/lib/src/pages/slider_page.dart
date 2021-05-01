import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valueSlider = 100.0;
  bool _blockCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Slider')),
        body: Container(
          padding: EdgeInsets.only(top: 50.0),
          child: Column(children: <Widget>[
            _createSlider(),
            _createCheckBox(),
            _createSwitch(),
            Expanded(child: _createImage())
          ]),
        ));
  }

  Widget _createSlider() {
    return Slider(
        activeColor: Colors.indigoAccent,
        label: 'Tamano de la imagen',
        value: _valueSlider,
        min: 10.0,
        max: 400.0,
        onChanged: (_blockCheck)
            ? null
            : (value) {
                setState(() {
                  _valueSlider = value;
                });
              });
  }

  Widget _createImage() {
    return Image(
        image: NetworkImage(
            'https://elpais.com/deportes/imagenes/2013/07/21/actualidad/1374433549_067984_1374434152_noticia_grande.jpg'),
        width: _valueSlider,
        fit: BoxFit.contain);
  }

  Widget _createCheckBox() {
    return CheckboxListTile(
      title: Text('Bloquear Slider'),
      value: _blockCheck,
      onChanged: (value) {
        setState(() {
          _blockCheck = value;
        });
      },
    );
  }

  Widget _createSwitch() {
    return SwitchListTile(
      title: Text('Bloquear Slider'),
      value: _blockCheck,
      onChanged: (value) {
        setState(() {
          _blockCheck = value;
        });
      },
    );
  }
}
