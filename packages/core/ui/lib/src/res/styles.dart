import 'package:flutter/material.dart';

class BlueyStyles {
  BlueyStyles._();

  static TextStyle title({Color color = Colors.white}) =>
      TextStyle(color: color, fontFamily: "Hello-Headline", fontSize: 28);

  static TextStyle body({Color color = Colors.white}) =>
      TextStyle(color: color, fontFamily: "Hello-Headline", fontSize: 20);
}
