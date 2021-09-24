import 'package:flutter/material.dart';

import 'package:homehealth/src/pages/home_page.dart';
import 'package:homehealth/src/pages/login_page.dart';
import 'package:homehealth/src/pages/register_page.dart';
import 'package:homehealth/src/pages/register_profile_page.dart';
import 'package:homehealth/src/providers/provider.dart';
import 'package:homehealth/src/utils/constants.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'register-profile',
        theme: ThemeData(
          primaryColor: primaryColor,
          scaffoldBackgroundColor: Colors.white
        ),
        routes: {
          'login': (BuildContext context) => LoginPage(),
          'home': (BuildContext context) => HomePage(),
          'registro': (BuildContext context) => RegisterPage(),
          'register-profile': (BuildContext context) => RegisterProfilePage()
        },
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en', 'US'),
          const Locale('es', 'ES'),
        ],
      ),
    );
  }
}
