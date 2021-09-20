import 'package:flutter/material.dart';

class EscucharAudios extends StatefulWidget {
  @override
  createState() => _EscucharAudios();
}

class _EscucharAudios extends State<EscucharAudios> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text('Escuchar Audios'),
      centerTitle: true,
    ));
  }
}
