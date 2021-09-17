import 'package:flutter/material.dart';

import 'login_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            children: [
              Text.rich(
                TextSpan(
                    text: 'Bienvenido,',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                        text: 'usuario',
                        style: TextStyle(fontWeight: FontWeight.normal),
                      ),
                    ]),
                style: TextStyle(fontSize: 55),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'login');
                  },
                  child: Text('Iniciar sesión'),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    primary: Color(0xFF55aaff),
                  ))
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () {
      //     Navigator.pushNamed(context, 'login');
      //   },
      //   label: const Text('Iniciar sesión'),
      //   backgroundColor: Color.fromRGBO(63, 63, 150, 1.0),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
