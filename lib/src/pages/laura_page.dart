import 'package:flutter/material.dart';

class LauraPage extends StatefulWidget {
  LauraPage({Key? key}) : super(key: key);

  @override
  _LauraPageState createState() => _LauraPageState();
}

class _LauraPageState extends State<LauraPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hola"),
      ),
      body: Container(
        child: Text("Mi pagina uno"),
      ),
    );
  }
}
