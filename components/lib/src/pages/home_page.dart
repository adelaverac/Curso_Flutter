import 'package:flutter/material.dart';

import 'package:components/src/providers/menu_provider.dart';
import 'package:components/src/utils/icon_string_util.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Componentes'),
        ),
        body: _list());
  }

  Widget _list() {
    //print(menuProvider.options);
    return FutureBuilder(
      future: menuProvider.loadData(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _listItems(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _listItems(List<dynamic> data, BuildContext context) {
    final List<Widget> options = [];

    data.forEach((element) {
      final widgetTemp = ListTile(
          title: Text(element['texto']),
          leading: getIcon(element['icon']),
          trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
          onTap: () {
            Navigator.pushNamed(context, element['ruta']);
          });
      options..add(widgetTemp)..add(Divider());
    });

    return options;
  }
}
