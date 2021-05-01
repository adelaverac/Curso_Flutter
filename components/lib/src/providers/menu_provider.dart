import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class _MenuProvider {
  List<dynamic> options = [];

  _MenuProvider() {
    //_loadData();
  }

  Future<List<dynamic>> loadData() async {
    final result = await rootBundle.loadString('sample_data/menu_opts.json');
    Map dataMap = json.decode(result);
    options = dataMap['rutas'];
    return options;
  }
}

final menuProvider = new _MenuProvider();
