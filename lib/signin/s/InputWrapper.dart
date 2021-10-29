import 'package:cleverpot/Activity/signup.dart';
import 'package:cleverpot/Helper/authelper.dart';
import 'package:cleverpot/Helper/dbhelper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'Button.dart';
import 'InputField.dart';

class InputWrapper extends StatefulWidget {
  InputWrapper({Key? key}) : super(key: key);

  @override
  _InputWrapperState createState() => _InputWrapperState();
}

class _InputWrapperState extends State<InputWrapper> {
  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: InputField(
              email: email,
              password: password,
              onEmailChanged: (value) => setState(() {
                email = value;
              }),
              onPasswordChanged: (value) => setState(() {
                password = value;
              }),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          RichText(
              text: TextSpan(
                  text: "Password dimenticata?",
                  style: TextStyle(color: Colors.grey),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      authHelper(context).resetPassword(email);
                    })),
          SizedBox(
            height: 20,
          ),
          Button(
            email: email,
            password: password,
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.green[500],
                borderRadius: BorderRadius.circular(50)),
            child: RichText(
                text: TextSpan(
                    text: "Non sei registrato? Clicca qua",
                    style: TextStyle(color: Colors.black),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.of(context).push(PageRouteBuilder(
                            opaque: false,
                            pageBuilder: (BuildContext context, _, __) {
                              return Registration();
                            }));
                        print("Cliccato");
                      })),
          ),
        ],
      ),
    );
  }

  void onEmailChanged(String newEmail) {
    setState(() {
      email = newEmail;
    });
  }

  void onPasswordChanged(String newPassword) {
    setState(() {
      password = newPassword;
    });
  }
}
