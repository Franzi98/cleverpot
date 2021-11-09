import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  String email;
  String password;
  void Function(String) onEmailChanged;
  void Function(String) onPasswordChanged;
  InputField({
    required this.email,
    required this.password,
    required this.onEmailChanged,
    required this.onPasswordChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Color(4294638330)))),
          child: TextFormField(
            onChanged: onEmailChanged,
            decoration: InputDecoration(
                hintText: "Enter your email",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none),
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Color(4294638330)))),
          child: TextFormField(
            obscureText: true,
            onChanged: onPasswordChanged,
            decoration: InputDecoration(
                hintText: "Enter your password",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none),
          ),
        ),
      ],
    );
    ;
  }
}
