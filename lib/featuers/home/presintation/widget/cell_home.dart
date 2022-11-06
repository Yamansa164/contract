
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/resources/const.dart';
import '../../../../core/resources/text_style_manager.dart';

class CellHome extends StatelessWidget {
  const CellHome({
    Key? key,
    required this.onTap,
    required this.text,
    required this.lottie,
  }) : super(key: key);

  final void Function()? onTap;
  final String text;
  final String lottie;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Column(
          children: [
            Text(
              text,
              style:
                  TextStyleMange.buttonTextStyle.copyWith(color: Colors.white),
            ),
            Lottie.asset(lottie, height: SizeManage.screen.width / 3),
          ],
        ),
      ),
    );
  }
}
