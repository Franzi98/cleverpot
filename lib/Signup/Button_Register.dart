import 'package:cleverpot/Helper/authelper.dart';
import 'package:flutter/material.dart';

class ButtonRegister extends StatelessWidget {
  final String email;
  final String password;
  ButtonRegister({Key? key, required this.email, required this.password})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 50),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.green),
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            authHelper(context).signUp(email, password);
          },
          child: Text("Registrati"),
        ),
      ),
    );
  }
}
