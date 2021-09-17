import 'package:flutter/material.dart';
import 'package:homehealth/src/pages/home_page.dart';
import 'package:homehealth/src/pages/laura_page.dart';
import 'package:homehealth/src/pages/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'laura',
      routes: {
        'login': (BuildContext context) => LoginPage(),
        'home': (BuildContext context) => HomePage(),
        'laura': (BuildContext context) => LauraPage(),
      },
    );
  }
}
