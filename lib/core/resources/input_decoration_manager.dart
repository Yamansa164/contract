
import 'package:flutter/material.dart';

import 'const.dart';

class InputDecorationManage {
  static InputDecoration textFieldInputDecoration = InputDecoration(
    errorStyle: TextStyle(fontSize: SizeManage.screen.width / 150),
    errorBorder: const UnderlineInputBorder(
      borderSide: BorderSide(width: 0.4, color: Colors.red),
    ),
    enabledBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.black),
    ),
    border: const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.black),
    ),
    focusedBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.black),
    ),
  );
}
