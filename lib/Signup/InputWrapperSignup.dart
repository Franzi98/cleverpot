import 'package:cleverpot/Activity/signin.dart';
import 'package:cleverpot/signin/s/InputField.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'Button_Register.dart';

class InputWrapperRegister extends StatefulWidget {
  InputWrapperRegister({Key? key}) : super(key: key);

  @override
  _InputWrapperRegisterState createState() => _InputWrapperRegisterState();
}

class _InputWrapperRegisterState extends State<InputWrapperRegister> {
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
                  text: "Già registrato? Accedi!",
                  style: TextStyle(color: Colors.grey),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.of(context).push(PageRouteBuilder(
                          pageBuilder: (BuildContext context, _, __) {
                        return Signup();
                      }));
                      ;
                    })),
          SizedBox(
            height: 20,
          ),
          ButtonRegister(
            email: email,
            password: password,
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
