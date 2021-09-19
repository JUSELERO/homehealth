import 'package:flutter/material.dart';
import 'package:homehealth/src/pages/botonPanico.dart';

import 'package:homehealth/src/pages/home_page.dart';
import 'package:homehealth/src/pages/inicio.dart';
import 'package:homehealth/src/pages/login_page.dart';
import 'package:homehealth/src/pages/registration_page.dart';
import 'package:homehealth/src/pages/tomar_test.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => HomePage(), //Bienvenido a la app
        'login': (BuildContext context) => LoginPage(), //Iniciar sesión
        'registro': (BuildContext context) => RegisterPage(), //Registro
        'tomartest': (BuildContext context) =>
            TomarTest(), //¿Quieres tomar el test?
        'inicio': (BuildContext context) =>
            PagInicio(), //Inicio - ¿Cómo va tu día?
        'botonPanico': (BuildContext context) => BotonPanico() //BotonPanico
      },
    );
  }
}
