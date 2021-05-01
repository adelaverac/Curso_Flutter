import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[_cardType1(), SizedBox(height: 30.0), _cardType2()],
      ),
    );
  }

  Widget _cardType1() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue),
            title: Text('Soy el titulo de esta tarjeta'),
            subtitle: Text(
                'Hola como estan, en esta ocasion les vengo a dar una breve descripcion de flutter, Hola como estan, en esta ocasion les vengo a dar una breve descripcion de flutter'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                child: Text('Cancelar'),
                onPressed: () {},
              ),
              TextButton(
                child: Text('Aceptar'),
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _cardType2() {
    final card = Container(
      child: Column(
        children: <Widget>[
          FadeInImage(
              image: NetworkImage(
                  'https://cdn.mos.cms.futurecdn.net/2bahN3dccspcjrAbtaDns3.jpg'),
              placeholder: AssetImage('assets/animation_500_knnu94dj.gif'),
              fadeInDuration: Duration(milliseconds: 200),
              height: 300.0,
              fit: BoxFit.cover),
          Container(
              padding: EdgeInsets.all(10.0),
              child: Text('No tengo idea de que poner'))
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                spreadRadius: 2.0,
                offset: Offset(2.0, 10.0))
          ]),
      child: ClipRRect(borderRadius: BorderRadius.circular(30.0), child: card),
    );
  }
}
