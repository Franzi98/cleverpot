import 'package:flutter/material.dart';

class MyThemes {
  static final primaryColor = Colors.blue.shade300;

  static final darkTheme = ThemeData(
    primaryColorDark: primaryColor,
    dividerColor: Colors.white,
    scaffoldBackgroundColor: Colors.grey.shade900,
    colorScheme: ColorScheme.dark(),
  );

  static final lightTheme = ThemeData(
    primaryColor: primaryColor,
    dividerColor: Colors.white,
  );
}
