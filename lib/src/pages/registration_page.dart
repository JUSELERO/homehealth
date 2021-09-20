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
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          crearFondo(context),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
            child: Column(
              children: [
                SizedBox(height: 80),
                Text.rich(
                  TextSpan(
                    text: 'Diligencia los siguientes datos',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
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
                SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'login');
                    },
                    child: Text('Crear cuenta'),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      primary: Color(0xFF4ED3E3),
                      minimumSize: Size(120.0, 40.0),
                    )),
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
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () {
      //     Navigator.pushNamed(context, 'home');
      //   },
      //   label: const Text('Regresar'),
      // ),
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
