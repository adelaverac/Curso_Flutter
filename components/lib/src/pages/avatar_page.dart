import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  static final pageName = 'avatar';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Avatar Page'),
          actions: <Widget>[
            Container(
              padding: EdgeInsets.all(5.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://www.vistazo.com/sites/default/files/field/image/2020/11/16/pabloescobar-f4b364db0358a1331e8610a09248a763-1200x800.jpg'),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 10.0),
              child: CircleAvatar(
                child: Text('SL'),
                backgroundColor: Colors.brown,
              ),
            )
          ],
        ),
        body: Center(
          child: FadeInImage(
            image: NetworkImage(
                'https://www.vistazo.com/sites/default/files/field/image/2020/11/16/pabloescobar-f4b364db0358a1331e8610a09248a763-1200x800.jpg'),
            placeholder: AssetImage('assets/animation_500_knnu94dj.gif'),
            fadeInDuration: Duration(milliseconds: 200),
          ),
        ));
  }
}
