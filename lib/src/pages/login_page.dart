import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:homehealth/src/bloc/login_bloc.dart';
import 'package:homehealth/src/providers/provider.dart';

import 'package:homehealth/src/providers/usuario_provider.dart';
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
  final usuarioprovider = new UsuarioProvider();

  @override
  Widget build(BuildContext context) {
    //esta variable bloc se hace para poder tener control de los datos mediante la estructura bloc
    final bloc = Provider.of(context);
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
                  Divider(),
                  Text.rich(
                    TextSpan(
                        text: '¡Hola!',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black87),
                        children: [
                          TextSpan(
                            text: 'Por favor, inicia sesión',
                            style: TextStyle(fontWeight: FontWeight.normal),
                          ),
                        ]),
                    style: TextStyle(fontSize: 20),
                  ),
                  Expanded(
                    child: ListView(
                      // Crea los cuadros de texto
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 20.0),
                      children: <Widget>[
                        _crearInput(bloc),
                        Divider(),
                        _crearEmail(bloc),
                        Divider(),
                        _passwordField(bloc),
                        Divider(),
                        _registrarPersona(),
                        Divider(),
                        _loginButon(bloc)
                      ],
                    ),
                  ),
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
                  )),
                ],
              ),
            ),
          ),
          // ElevatedButton(
          //     onPressed: () {
          //       Navigator.pushNamed(context, 'home');
          //     },
          //     child: Text('Regresar a inicio'),
          //     style: ElevatedButton.styleFrom(
          //       shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(20)),
          //       primary: Color(0xFFFFD885),
          //     )),
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

  Widget _loginButon(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.formValidStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return ElevatedButton(
            onPressed: () {
              snapshot.hasData ? _login(bloc) : Null;
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
              child: Text('Ingresar'),
            ), //style: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.lerp(5.0, 5.0, 5.0)), SIRVE PARA DAR ESTILO AL NBOTON
          );
        });
  }

  _login(LoginBloc bloc) {
    usuarioprovider.login(bloc.email, bloc.password);
  }

  Widget _crearInput(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.namedStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
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
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0))),
            onChanged: (valor) {
              bloc.changeName(valor);
              setState(() {
                _nombre = valor;
              });
            },
          );
        });
  }

  Widget _crearEmail(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
            child: TextField(
          keyboardType: TextInputType.emailAddress,
          style: style,
          decoration: InputDecoration(
              errorText: snapshot.hasError ? '${snapshot.error}' : null,
              fillColor: Colors.white,
              filled: true,
              //borrar de para que no se vea debajo
              //counterText: snapshot.data,
              hintText: 'Ingresa tu correo electrónico',
              labelText: 'Email',
              helperText: 'Por favor, ingresa tu email',
              suffixIcon: Icon(Icons.alternate_email),
              icon: Icon(Icons.email),
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0))),
          onChanged: (valor) {
            bloc.changeEmail(valor);
            setState(() {
              _email = valor;
              log("HOLA ${snapshot.data.toString()}");
            });
          },
        ));
      },
    );
  }

  Widget _passwordField(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.passwordStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return TextField(
            obscureText: true,
            keyboardType: TextInputType.emailAddress,
            style: style,
            decoration: InputDecoration(
                errorText: snapshot.hasError ? '${snapshot.error}' : null,
                fillColor: Colors.white,
                filled: true,
                hintText: 'Ingresa tu contraseña',
                labelText: 'Password',
                helperText: 'Por favor, ingresa tu contraseña',
                suffixIcon: Icon(Icons.lock_open),
                icon: Icon(Icons.lock),
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0))),
            onChanged: (valor) {
              bloc.changePassword(valor);
              setState(() {
                _password = valor;
              });
            },
          );
        });
  }

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
