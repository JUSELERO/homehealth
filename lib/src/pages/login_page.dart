import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _crearFondo(context),
          _loginForm(context),
        ],
      ),
    );
  }
}

Widget _loginForm(context) {
  return SingleChildScrollView(
    child: Column(
      children: <Widget>[
        SafeArea(
          child: Container(
            height: 180.0,
          ),
        ),
        Container(
          //se deberia poder poner el ancho por % yno por pixeels
          width: 220.0,
          margin: EdgeInsets.symmetric(vertical: 30.0),
          padding: EdgeInsets.symmetric(vertical: 50.0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black26, blurRadius: 3.0, spreadRadius: 3.0)
              ]),
          child: Column(
            children: <Widget>[
              Text(
                'Ingresso',
                style: TextStyle(fontSize: 20.0),
              ),
              _crearEmail(),
              SizedBox(
                height: 30.0,
              ),
              _crearPassword(),
              SizedBox(
                height: 30.0,
              ),
              _crearBoton(),
              SizedBox(
                height: 30.0,
              )
            ],
          ),
        ),
        Text('olvido la contrnasena?'),
        SizedBox(
          height: 100.0,
        )
      ],
    ),
  );
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
      Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            Icon(Icons.person_pin_circle, color: Colors.white, size: 100.0),
            SizedBox(
              height: 10.0,
              width: double.infinity,
            ),
            Text('sebastian ', style: TextStyle(color: Colors.white)),
          ],
        ),
      )
    ],
  );
}

Widget _crearEmail() {
  return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            icon: Icon(
              Icons.alternate_email,
              color: Colors.deepPurple,
            ),
            hintText: 'ejemplo@corroe.com',
            label: Text('correo electronico'),
          )));
}

Widget _crearPassword() {
  return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            icon: Icon(
              Icons.password,
              color: Colors.deepPurple,
            ),
            hintText: '*******',
            label: Text('Crear contrasena'),
          )));
}

Widget _crearBoton() {
  return ElevatedButton(
    onPressed: () {},
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 50.0),
      child: Text('Ingresar'),
    ),
  );
}
