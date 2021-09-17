import 'package:flutter/material.dart';

import 'package:homehealth/src/pages/home_page.dart';
import 'package:homehealth/src/pages/login_page.dart';
import 'package:homehealth/src/pages/prueba.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        'login': (BuildContext context) => LoginPage(),
        'home': (BuildContext context) => HomePage(),
        'prueba': (BuildContext context) => PruebaPage()
      },
    );
  }
}
