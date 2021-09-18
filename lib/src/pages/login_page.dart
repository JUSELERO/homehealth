import 'package:flutter/material.dart';

//import 'home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _nombre = "";
  String _email = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _crearFondo(context),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
            child: ListView(
              // Crea los cuadros de texto
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              children: <Widget>[
                _crearInput(),
                Divider(),
                _crearEmail(),
                Divider(),
                _passwordField(),
                Divider(),
                _registrarPersona(),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, 'home');
        },
        label: const Text('Regresar'),
      ),
    );
  }

  Widget _crearInput() {
    TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
    return TextField(
      autofocus: true,
      style: style,
      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true, //Colorea fondo de blanco
          counter: Text('Letras ${_nombre.length}'),
          hintText: 'Ingresa tu nombre',
          labelText: 'Nombre',
          helperText: 'Por favor, ingresa tu nombre',
          suffixIcon: Icon(Icons.accessibility),
          icon: Icon(Icons.account_circle),
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
      onChanged: (valor) {
        setState(() {
          _nombre = valor;
        });
      },
    );
  }

  Widget _crearEmail() {
    TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
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
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
      onChanged: (valor) {
        setState(() {
          _email = valor;
        });
      },
    );
  }

  Widget _passwordField() {
    TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
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
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
      onChanged: (valor) {
        setState(() {
          _email = valor;
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
