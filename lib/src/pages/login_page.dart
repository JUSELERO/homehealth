import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:homehealth/src/utils/fondo.dart';

//import 'home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _nombre = "";
  String _email = "";
  String _password = "";

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          crearFondo(context),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(height: 80),
                  Text.rich(
                    TextSpan(
                      text: 'Por favor, inicia sesión',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    style: TextStyle(fontSize: 20),
                  ),
                  Expanded(
                    child: ListView(
                      // Crea los cuadros de texto
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 20.0),
                      children: <Widget>[
                        _crearInput(),
                        Divider(),
                        _crearEmail(),
                        Divider(),
                        _passwordField(),
                        Divider(),
                        //_registrarPersona(),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'tomartest');
                      },
                      child: Text('Iniciar sesión'),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        primary: Color(0xFF4ED3E3),
                        minimumSize: Size(120.0, 40.0),
                      )),
                  Text.rich(TextSpan(
                    text: "¿Aún no tienes una cuenta?",
                    children: [
                      TextSpan(
                          text: "Regístrate",
                          style: TextStyle(color: Colors.blue[300]),
                          recognizer: new TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(context, 'registro');
                            })
                    ],
                  ))
                ],
              ),
            ),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () {
      //     Navigator.pushNamed(context, 'home');
      //   },
      //   label: const Text('Regresar'),
      // ),
    );
  }

  Widget _crearInput() {
    return TextField(
      autofocus: true,
      style: style,
      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: 'Ingresa tu nombre',
          labelText: 'Nombre',
          helperText: 'Por favor, ingresa tu nombre',
          suffixIcon: Icon(Icons.accessibility),
          icon: Icon(Icons.account_circle),
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
      onChanged: (valor) {
        setState(() {
          _nombre = valor;
        });
      },
    );
  }

  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      style: style,
      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: 'Ingresa tu correo electrónico',
          labelText: 'Email',
          helperText: 'Por favor, ingresa tu email',
          suffixIcon: Icon(Icons.alternate_email),
          icon: Icon(Icons.email),
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
      onChanged: (valor) {
        setState(() {
          _email = valor;
        });
      },
    );
  }

  Widget _passwordField() {
    return TextField(
      obscureText: true,
      keyboardType: TextInputType.emailAddress,
      style: style,
      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: 'Ingresa tu contraseña',
          labelText: 'Password',
          helperText: 'Por favor, ingresa tu contraseña',
          suffixIcon: Icon(Icons.lock_open),
          icon: Icon(Icons.lock),
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
      onChanged: (valor) {
        setState(() {
          _password = valor;
        });
      },
    );
  }

//
  Widget _registrarPersona() {
    return ListTile(
        title: Text('El nombre es: $_nombre'),
        subtitle: Text('Email: $_email'));
  }
}

Widget _crearFondo(BuildContext context) {
  final size = MediaQuery.of(context).size;

  final fondoMorado = Container(
    height: size.height * 1,
    width: double.infinity,
    decoration: BoxDecoration(
        gradient: LinearGradient(colors: <Color>[
      Color.fromRGBO(63, 63, 150, 1.0),
      Color.fromRGBO(90, 70, 120, 1.0)
    ])),
  );

  final circulo = Container(
    width: 100.0,
    height: 100.0,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: Color.fromRGBO(255, 255, 255, 0.05)),
  );

  return Stack(
    children: <Widget>[
      fondoMorado,
      Positioned(
        top: 90.0,
        left: 30.0,
        child: circulo,
      ),
      Positioned(
        top: -40.0,
        left: -30.0,
        child: circulo,
      ),
      Positioned(
        top: -50.0,
        left: -100.0,
        child: circulo,
      ),
      // Container(
      //   padding: EdgeInsets.only(top: 50.0),
      //   child: Column(
      //     children: <Widget>[
      //       Icon(Icons.person_pin_circle, color: Colors.white, size: 100.0),
      //       SizedBox(
      //         height: 10.0,
      //         width: double.infinity,
      //       ),
      //       Text('sebastian ', style: TextStyle(color: Colors.white)),
      //     ],
      //   ),
      // )
    ],
  );
}
