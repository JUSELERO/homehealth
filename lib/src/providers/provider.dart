import 'package:flutter/material.dart';

//import 'package:form';
import 'package:homehealth/src/bloc/login_bloc.dart';

class Provider extends InheritedWidget {
  final loginbloc = LoginBloc();
  Provider({Key? key, required Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static LoginBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<Provider>() as Provider)
        .loginbloc;
  }
}
