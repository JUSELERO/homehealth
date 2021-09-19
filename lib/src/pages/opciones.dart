import 'package:flutter/material.dart';

class Opciones extends StatefulWidget {
  @override
  createState() => _OpcionesState();
}

class _OpcionesState extends State<Opciones> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text('El usuario aquí podrá decir que quiere hacer')),
    );
  }
}
