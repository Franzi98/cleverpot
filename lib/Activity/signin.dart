import 'package:cleverpot/Activity/home.dart';
import 'package:cleverpot/Helper/authelper.dart';
import 'package:cleverpot/signin/s/Header.dart';
import 'package:cleverpot/signin/s/InputField.dart';
import 'package:cleverpot/signin/s/InputWrapper.dart';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Signup extends StatefulWidget {
  Signup({
    Key? key,
  }) : super(key: key);

  @override
  _nameState createState() => _nameState();
}

class _nameState extends State<Signup> {
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    authHelper _helper = authHelper(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [Colors.green, Colors.greenAccent])),
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            Header("Login", "Benvenuto su Cleverpot"),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  color: Colors.green[300],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60))),
              child: InputWrapper(),
            ))
          ],
        ),
      ),
    );
  }
}
