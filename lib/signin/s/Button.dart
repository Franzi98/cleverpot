import 'package:cleverpot/Activity/home.dart';
import 'package:cleverpot/Helper/authelper.dart';
import 'package:cleverpot/signin/s/InputField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String email;
  final String password;
  Button({Key? key, required this.email, required this.password})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    authHelper _helper = authHelper(context);
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 50),
      decoration: BoxDecoration(
        color: Colors.cyan[500],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            _helper.signIn(email, password);
          },
          child: Text(
            "Accedi",
            style: TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
