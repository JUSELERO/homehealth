import 'package:flutter/material.dart';
import 'package:homehealth/src/utils/fondo.dart';

class Opciones extends StatefulWidget {
  @override
  createState() => _OpcionesState();
}

class _OpcionesState extends State<Opciones> {
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
          ),
          Column(children: [
            SizedBox(height: 60),
            Image(
              image: AssetImage('assets/images/whitebear.png'),
              width: 250.0,
              height: 250.0,
            ),
            SizedBox(height: 40),
            Text.rich(TextSpan(
                text:
                    "La felicidad de tu vida depende de la calidad de tus pensamientos",
                style: TextStyle(
                    fontWeight: FontWeight.normal, color: Colors.white),
                children: [
                  TextSpan(
                    text: "¿Qué quieres hacer?",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  )
                ])),
            SizedBox(height: 40),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '');
                },
                child: Text('Registrar Hábitos'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  primary: Color(0xFF4ED3E3),
                  minimumSize: Size(120.0, 40.0),
                )),
            SizedBox(height: 40),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'escucharAudios');
                },
                child: Text('Escuchar audios'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  primary: Color(0xFF4ED3E3),
                  minimumSize: Size(120.0, 40.0),
                )),
            SizedBox(height: 40),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'botonPanico');
                },
                child: Text('Ir al botón de pánico'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  primary: Color(0xFF4ED3E3),
                  minimumSize: Size(120.0, 40.0),
                ))
          ])
        ],
      ),
    );
  }
}
