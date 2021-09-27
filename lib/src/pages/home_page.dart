import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:homehealth/src/utils/fondo.dart';

//import 'login_page.dart';

class HomePage extends StatelessWidget {
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
                  SizedBox(height: 80),
                  Image(
                    image: AssetImage('assets/images/teddybear.png'),
                    width: 250.0,
                    height: 250.0,
                  ),
                  SizedBox(height: 20),
                  Text.rich(
                    TextSpan(
                        text: 'Bienvenido,',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                        children: [
                          TextSpan(
                            text: 'usuario',
                            style: TextStyle(fontWeight: FontWeight.normal),
                          ),
                        ]),
                    style: TextStyle(fontSize: 55),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'login');
                      },
                      child: Text('Iniciar sesión'),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        primary: Color(0xFF55aaff),
                      )),
                  SizedBox(height: 20),
                  SizedBox(width: 20),
                  Text.rich(TextSpan(
                    text: "¿Aún no tienes una cuenta?",
                    children: [
                      TextSpan(
                          text: "Regístrate",
                          style: TextStyle(color: Colors.blue[300]),
                          recognizer: new TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(context, 'registro');
                            }),
                      // TextSpan(
                      //     text: "Página principal",
                      //     style: TextStyle(color: Colors.red),
                      //     recognizer: new TapGestureRecognizer()
                      //       ..onTap = () {
                      //         Navigator.pushNamed(context, 'inicio');
                      //       })
                    ],
                  ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
