import 'package:flutter/material.dart';


import 'color_manager.dart';
import 'const.dart';

class DecorationManage {
  static BoxDecoration tableDecoration = BoxDecoration(
    // ignore: prefer_const_literals_to_create_immutables
    boxShadow: [
      const BoxShadow(blurRadius: 3, spreadRadius: 3, color: Colors.transparent)
    ],
    color: ColorManage.second,
  );
  static BoxDecoration buttonDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(SizeManage.screen.width / 10),
    color: const Color.fromARGB(255, 208, 212, 215),
  );
}