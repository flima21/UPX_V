import 'package:flutter/material.dart';

class ToastService {
  final BuildContext context;

  String? _message;
  Color? _colorBackground;
  Color? _colorFont;

  //gets 
  String get message => _message.toString();
  Color get colorBackground => _colorBackground ?? Colors.red;
  Color get colorFont => _colorFont ?? Colors.black;

  // sets
  set colorFont(Color newColor) => _colorFont = newColor;
  set colorBackground(Color newColor) => _colorBackground = newColor;
  set message(String newMessage) => _message = newMessage;

  ToastService({ required this.context});

  void clear() {
    ScaffoldMessenger.of(context).clearSnackBars();
  }

  void show() {
    clear();
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(color: colorFont, fontWeight: FontWeight.bold),
        ),
        duration: Duration(seconds: 5),
        backgroundColor: _colorBackground,
      ),
    );
  }
}