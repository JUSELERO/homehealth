import 'package:flutter/material.dart';

class Llamada extends StatefulWidget {
  @override
  createState() => _LlamadaState();
}

class _LlamadaState extends State<Llamada> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text('Hacer llamada'),
      centerTitle: true,
    ));
  }
}
