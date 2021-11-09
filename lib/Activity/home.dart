import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cleverpot/Home/home_body.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

void initializeFlutterFirebase() async {
  try {
    await Firebase.initializeApp();
  } catch (e) {
    Text(e.toString());
  }
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [Home_App()],
    );
  }
}

class Home_App extends StatefulWidget {
  Home_App({Key? key}) : super(key: key);

  @override
  _Home_AppState createState() => _Home_AppState();
}

class _Home_AppState extends State<Home_App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WillPopScope(
          child: home_body(),
          onWillPop: () {
            exit(0);
          }),
    );
  }
}
