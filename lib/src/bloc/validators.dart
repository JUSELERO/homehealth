import 'dart:async';

class Validators {
  
    final validarEmail = StreamTransformer<String,String>.fromHandlers(
    handleData: ( email, sink ) { 
      String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regExp = new RegExp(pattern);
      if(regExp.hasMatch(email)) {
        sink.add(email);
      } else {
        sink.addError('Email no es correcto');
      }
    }
  );
  
  final validarPassword = StreamTransformer<String,String>.fromHandlers(
    handleData: ( password, sink ) {
      if( password.length >= 6 ) {
        sink.add(password);
      } else {
        sink.addError('Más de 6 caracteres. Por Favor');
      }
    }
  );

  final validateName = StreamTransformer<String,String>.fromHandlers(
    handleData: ( name, sink ) {
      if( name.length >= 2 ) {
        sink.add(name);
      } else {
        sink.addError('Ingrese el nombre valido!');
      }
    }
  );

  final validateLastname = StreamTransformer<String,String>.fromHandlers(
    handleData: ( lastname, sink ) {
      if( lastname.length >= 2 ) {
        sink.add(lastname);
      } else {
        sink.addError('Ingrese un apellido valido!');
      }
    }
  );

  final validatePhone = StreamTransformer<String,String>.fromHandlers(
    handleData: ( phone, sink ) {
      if( phone.length == 10 ) {
        sink.add(phone);
      } else {
        sink.addError('Ingrese un número valido!');
      }
    }
  );

}
