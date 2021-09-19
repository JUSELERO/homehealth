import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:homehealth/src/utils/fondo.dart';

class RegisterPage extends StatefulWidget {
  @override
  createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String _nombre = "";
  String _email = "";
  String _password = "";
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          crearFondo(context),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
            child: Column(
              children: [
                Text.rich(
                  TextSpan(
                      text: '¡Hola!',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black87),
                      children: [
                        TextSpan(
                          text:
                              'Para registrarte, diligencia los siguientes datos',
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                      ]),
                  style: TextStyle(fontSize: 20),
                ),
                Expanded(
                  child: ListView(
                    // Crea los cuadros de texto
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                    children: <Widget>[
                      _ingresarNombre(),
                      Divider(),
                      _crearEmail(),
                      Divider(),
                      _passwordField(),
                      Divider(),
                      //_registrarPersona(),
                    ],
                  ),
                ),
                Text.rich(TextSpan(
                  text: "¿Ya tienes una cuenta?",
                  children: [
                    TextSpan(
                        text: "Inicia sesión",
                        style: TextStyle(color: Colors.blue[300]),
                        recognizer: new TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, 'login');
                          })
                  ],
                ))
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

  // Ingresar correo
  Widget _crearEmail() {
    return TextField(
      autofocus: true,
      style: style,
      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: 'Ingresa tu correo electrónico',
          labelText: 'Correo',
          //helperText: 'Por favor, ingresa tu nombre',
          suffixIcon: Icon(Icons.alternate_email),
          icon: Icon(Icons.email),
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

  // Ingresar nombre
  Widget _ingresarNombre() {
    return TextField(
      autofocus: true,
      style: style,
      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: 'Ingresa tu nombre',
          labelText: 'Nombre',
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

  // Crear contraseña
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
}
