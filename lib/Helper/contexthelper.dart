import 'package:flutter/material.dart';

abstract class contextHelper {
  static String getInfo(BuildContext context) {
    return "HashCode: ${context.hashCode.toString()}\r\nType: ${context.widget.runtimeType.toString()}";
  }

  static String getSize(Size size) {
    return "Size: ${size.width.truncate()},${size.height.truncate()}";
  }
}
