import 'dart:convert';
import 'package:http/http.dart' as http;

class UsuarioProvider {
  final String _firebaseToken = 'AIzaSyBZRCn6fb0BXeYMcWdDrdoB2e36vg31ybc';

  Future nuevoUsuario(String email, String password) async {
    final authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    final resp = await http.post(
        Uri.parse(
            'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$_firebaseToken'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode(authData));

    Map<String, dynamic> decodedResp = json.decode(resp.body);

    print(decodedResp);
  }
}
