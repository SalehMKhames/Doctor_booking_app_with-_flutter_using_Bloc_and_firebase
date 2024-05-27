import 'package:flutter/material.dart';

class MySnackBar {
  final String message;
  final Color color;

  MySnackBar({required this.color, required this.message});

  static SnackBar call(String message,Color color,Color fontColor) =>
      SnackBar(
        content: Text(message,style: TextStyle(color: fontColor),),
        backgroundColor: color,
      );
}
