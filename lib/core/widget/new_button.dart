import 'package:contracts/core/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../core/resources/const.dart';
import '../../../../../core/resources/decoration_manager.dart';
import '../../../../../core/resources/text_style_manager.dart';

class NewButton extends StatelessWidget {
  NewButton( 
    
    {
      this.fontsize=25,
    Key? key,
    required this.width,
    required this.buttonName,
    this.onPressed,
    required this.color,
  }) : super(key: key);

  final String buttonName;
  final void Function()? onPressed;
  final int width;
  final Color color;
  double? fontsize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
            // ignore: sort_child_properties_last
            child: Center(
              child: Text(buttonName,
                  style: TextStyleMange.buttonTextStyle.copyWith(
                      color: color == ColorManage.primery
                          ? Colors.white
                          : Colors.black,
                      fontSize: fontsize ?? 25)),
            ),
            width: SizeManage.screen.width / width,
            height: SizeManage.screen.height / 12,
            decoration:
                DecorationManage.buttonDecoration.copyWith(color: color)),
      ),
    );
  }
}
