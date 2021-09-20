import 'package:flutter/material.dart';
import 'package:homehealth/src/utils/fondo.dart';

class TomarTest extends StatefulWidget {
  @override
  createState() => _TomarTestState();
}

class _TomarTestState extends State<TomarTest> {
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
              child: Column(children: [
                SizedBox(height: 60),
                Image(
                  image: AssetImage('assets/images/whitebear.png'),
                  width: 250.0,
                  height: 250.0,
                ),
                SizedBox(height: 40),
                Text.rich(TextSpan(
                    text:
                        'Te invitamos a tomar un test para que podamos ayudarte mejor',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 25))),
                SizedBox(height: 40),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '');
                    },
                    child: Text('Sí, vamos'),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      primary: Color(0xFF4EE367),
                      minimumSize: Size(120.0, 40.0),
                    )),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'inicio');
                    },
                    child: Text('Mejor luego'),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      primary: Color(0xFF4ED3E3),
                      minimumSize: Size(120.0, 40.0),
                    ))
              ]),
            ),
          ],
        ));
  }
}
