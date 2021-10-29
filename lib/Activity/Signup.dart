import 'package:cleverpot/Signup/InputWrapperSignup.dart';
import 'package:cleverpot/signin/s/Header.dart';
import 'package:cleverpot/signin/s/InputWrapper.dart';
import 'package:flutter/material.dart';

class Registration extends StatefulWidget {
  Registration({Key? key}) : super(key: key);

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  @override
  Widget build(BuildContext context) {
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
            Header("Registrati", "Cura la tua pianta con l'app di cleverpot"),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  color: Colors.green[300],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60))),
              child: InputWrapperRegister(),
            ))
          ],
        ),
      ),
    );
  }
}
