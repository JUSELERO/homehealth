import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:homehealth/src/bloc/validators.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with Validators {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _nameController = BehaviorSubject<String>();

  Stream<String> get emailStream => _emailController.stream;
  Stream<String> get passwordStream => _passwordController.stream;
  Stream<String> get namedStream => _nameController.stream;

  Stream<String> get formValidStream => CombineLatestStream.combine2(
        emailStream,
        passwordStream,
        (a, b) => 'true',
      );

  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;
  Function(String) get changeName => _passwordController.sink.add;

  String get email => _emailController.value;
  String get password => _passwordController.value;

  dispose() {
    _emailController?.close();
    _passwordController?.close();
    _nameController?.close();
  }
}
