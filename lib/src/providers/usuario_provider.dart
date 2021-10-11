import 'dart:convert';
import 'dart:developer';
import 'package:homehealth/src/models/profile_model.dart';
import 'package:homehealth/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:http/http.dart' as http;

class UsuarioProvider {
  //cambiar dependiendo de  la base de datosd
  final String _firebaseToken = 'AIzaSyBZRCn6fb0BXeYMcWdDrdoB2e36vg31ybc';
  final String _urlProfile =
      'https://homehealth-a0eff-default-rtdb.firebaseio.com';
  final _prefs = new PreferenciasUsuario();

  Future<Map<String, dynamic>> login(String email, String password) async {
    final authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    final resp = await http.post(
        Uri.parse(
            'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$_firebaseToken'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode(authData));

    Map<String, dynamic> decodedResp = json.decode(resp.body);
    log("decodedResp ---> $decodedResp");
    if (decodedResp.containsKey('idToken')) {
      //_prefs.token = decodedResp['idToken'];
      _prefs.uid = decodedResp['localId'];
      log("uid --> ${_prefs.uid}");
      return {
        'ok': true,
        'token': decodedResp['idToken'],
        'Uid': decodedResp['localId']
      };
    } else {
      return {'ok': false, 'mensaje': decodedResp['error']['message']};
    }
  }

  Future<Map<String, dynamic>> registerUser(
      String email, String password) async {
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
    print(resp);
    //print(resp.body);
    Map<String, dynamic> decodedResp = json.decode(resp.body);
    if (decodedResp.containsKey('idToken')) {
      _prefs.token = decodedResp['idToken'];
      _prefs.email = decodedResp['email'];
      return {
        'ok': true,
        'token': decodedResp['idToken'],
        'Uid': decodedResp['localId']
      };
    } else {
      return {'ok': false, 'mensaje': decodedResp['error']['message']};
    }
  }

  Future<bool> registerProfileUser(ProfileModel profile) async {
    final url =
        '$_urlProfile/profiles/${profile.uID}.json'; //  se le quita el authtentication pora hora porque genera problema con laregla del servidor "?auth=${_prefs.token}"
    profile.user = _prefs.email;
    final resp = await http.post(Uri.parse(url), body: profileToJson(profile));
    Map<String, dynamic> decodedData = json.decode(resp.body);
    log(" DECODED DATA ----> $decodedData ");
    if (decodedData.containsKey('name')) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateProfileUser(ProfileModel profile) async {
    final url =
        '$_urlProfile/profiles/${profile.uID}.json'; //  se le quita el authtentication pora hora porque genera problema con laregla del servidor "?auth=${_prefs.token}"
    profile.user = _prefs.email;
    final resp = await http.put(Uri.parse(url), body: profileToJson(profile));
    Map<String, dynamic> decodedData = json.decode(resp.body);
    log(" DECODED DATA ----> $decodedData ");
    if (decodedData.containsKey('name')) {
      return true;
    } else {
      return false;
    }
  }

  ///     ESTE METODO NO SE A TERMINA DO DEVUELVE UN OBJETO PROFILE PERO EL OBJETO ESTA VACIO FALTA RELLENARLO CKON L RESPUESTA DE LACONSUTLA Y VERIFICAR LA CONSULTA JSLR
  Future<Map<String, dynamic>> getProfileUser(ProfileModel profile) async {
    final url =
        '$_urlProfile/profiles/${profile.uID}.json'; //  se le quita el authtentication pora hora porque genera problema con laregla del servidor "?auth=${_prefs.token}"
    profile.user = _prefs.email;
    final resp = await http.get(Uri.parse(url));
    Map<String, dynamic> decodedData = json.decode(resp.body);
    log(" DECODED DATA ----> $decodedData ");
    if (decodedData[0] != 'null') {
      //.containsKey('uID')  se lo uite
      return decodedData;
    } else {
      return decodedData;
    }
  }
}
