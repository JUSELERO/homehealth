import 'package:flutter/material.dart';
import 'package:homehealth/src/utils/fondo.dart';

class BotonPanico extends StatefulWidget {
  @override
  createState() => _BotonPanicoState();
}

class _BotonPanicoState extends State<BotonPanico> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        crearFondo(context),
        Center(
          child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Column(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '');
                      },
                      child: Text('¡Ayúdame!'),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        primary: Color(0xFFFF3238),
                        minimumSize: Size(120.0, 40.0),
                      )),
                  SizedBox(width: 20),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '');
                      },
                      child: Text('Acompáñame'),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        primary: Color(0xFF4BFF32),
                        minimumSize: Size(120.0, 40.0),
                      ))
                ],
              )),
        )
      ],
    ));
  }
}
