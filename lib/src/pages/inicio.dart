import 'package:flutter/material.dart';
import 'package:homehealth/src/utils/fondo.dart';

class PagInicio extends StatefulWidget {
  @override
  createState() => _PagInicioState();
}

class _PagInicioState extends State<PagInicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        crearFondo(context),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
          child: Column(children: [
            SizedBox(height: 60),
            Image(
              image: AssetImage('assets/images/whitebearcoffee.png'),
              width: 250.0,
              height: 250.0,
            ),
            SizedBox(height: 40),
            Text.rich(TextSpan(
                text: '¿Cómo va tu día?',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 25))),
            SizedBox(height: 30),
            Row(
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'opciones');
                    },
                    child: Text('Voy bien'),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      primary: Color(0xFF4EE367),
                      minimumSize: Size(120.0, 40.0),
                    )),
                SizedBox(width: 20),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'botonPanico');
                    },
                    child: Text('Nada bien'),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      primary: Color(0xFFFD7377),
                      minimumSize: Size(120.0, 40.0),
                    ))
              ],
            )
          ]),
        ),
      ],
    ));
  }
}
