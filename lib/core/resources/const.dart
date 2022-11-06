import 'package:flutter/material.dart';





class SizeManage {
  static Size screen =
      MediaQueryData.fromWindow(WidgetsBinding.instance.window).size;
}

class ConstManage{ 
  static String url = 'http://127.0.0.1:8000/api';
}