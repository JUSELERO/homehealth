import 'dart:convert';

//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homehealth/src/bloc/register_profile_bloc.dart';
import 'package:homehealth/src/models/profile_model.dart';
import 'package:homehealth/src/pages/activities/activities_page.dart';
import 'package:homehealth/src/pages/activities/my_activities_page.dart';
import 'package:homehealth/src/pages/profile_page.dart';
import 'package:homehealth/src/providers/provider.dart';
import 'package:homehealth/src/providers/usuario_provider.dart';
import 'package:homehealth/src/widgets/background.dart';

import 'activities/test_state.dart';

import 'auth/audioplayer.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> _listPages = [
    MyActivitiesPage(),
    ActivitiesPage(),
    ProfilePage()
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.registerProfile(
        context); //llamo al bloc para traer la infomracion guardada

    return Scaffold(
        body: Background(
          child: Center(child: _listPages.elementAt(_selectedIndex)),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.call),
              label: 'Quiero Hablar',
              backgroundColor: Colors.redAccent,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.text_snippet),
              backgroundColor: Colors.blueAccent,
              label: 'Test',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'My perfil',
            ),
          ],
          onTap: _onItemTapped,
          selectedItemColor: Colors.amber[800],
          currentIndex: _selectedIndex,
        ),
        floatingActionButton: _crearBotones(bloc));
  }

  void _onItemTapped(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }

  Widget _crearBotones(RegisterProfileBloc bloc) {
    switch (_selectedIndex) {
      case 0:
        return AudioPlayerHH();

        break;
      case 1:
        return Positioned(
          left: 50.0,
          top: 1000.0,
          child: ListView(
            children: [
              myLayoutWidget(),
              myLayoutWidget(),
              myLayoutWidget(),
              myLayoutWidget(),
              myLayoutWidget(),
              myLayoutWidget(),
              myLayoutWidget(),
            ],
          ),
        );
      //TestGeneric();
      // myLayoutWidget()

      case 2:
        return FloatingActionButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, 'edit-profile');
          },
          child: Icon(Icons.edit),
        );
      default:
        return Container();
    }
  }

  Future<void> _saveActivity(BuildContext context) {
    Navigator.pushNamed(context, "contacts2");
    // return showDialog(
    //   context: context,
    //   barrierDismissible: false,
    //   useSafeArea: false,
    //   useRootNavigator: false,
    //   builder: (BuildContext context) => AlertDialog(
    //     title: Text('Success!'),
    //     content: Text('You are in the football universe!'),

    //   )
    // );
  }
}

Widget myLayoutWidget() {
  // wrap everything in a purple container
  return Container(
    margin: EdgeInsets.all(16.0),
    padding: EdgeInsets.all(16.0),
    decoration: BoxDecoration(
      color: Colors.purple[900],
      border: Border.all(),
      borderRadius: BorderRadius.all(Radius.circular(3.0)),
    ),

    // column of three rows
    child: Column(
      // this makes the column height hug its content
      mainAxisSize: MainAxisSize.min,
      children: [
        // first row

        // second row (single item)
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 0,
          ),
          child: Text(
            'recuerda que todo puede mejorar   1. Me siento triste y deprimido.',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),

        // third row
        Row(
          children: [
            Text(
              'responda de acuerdo a su estado',
              style: TextStyle(
                color: Colors.green,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Icon(
                Icons.arrow_forward,
                color: Colors.green,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.favorite,
                color: Colors.orange,
              ),
            ),
            Text(
              'Todo mejora.',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
