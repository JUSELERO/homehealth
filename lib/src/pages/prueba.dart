//import 'dart:html';

import 'package:flutter/material.dart';

class PruebaPage extends StatefulWidget {
  @override
  createState() {
    return _PruebaPageState();
  }
}

class _PruebaPageState extends State<PruebaPage> {
  final _estiloTexto = new TextStyle(fontSize: 25);
  int _conteo = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Statefull'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Número de clicks:', style: _estiloTexto),
          Text('$_conteo', style: _estiloTexto),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_right_alt),
        onPressed: () {
          //print("Hola mundo!");
          _conteo++;
          setState(() {});
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
