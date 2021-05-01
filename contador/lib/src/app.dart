import 'package:flutter/material.dart';

//Custom
//import 'package:contador/src/pages/home_page.dart';
import 'package:contador/src/pages/count_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Center(
          child: CountPage(),
        ));
  }
}
