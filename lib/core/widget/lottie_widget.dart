import 'package:contracts/core/resources/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../core/resources/color_manager.dart';
import '../../../core/resources/const.dart';
import 'new_button.dart';
import '../../featuers/add_contract/presntiation/bloc/add_contract_bloc.dart';

class LottieWidget extends StatelessWidget {
  const LottieWidget({super.key, 
    required this.text,
    required this.lottie,
  required  this.onPressed,
  });
  final String text;
  final String lottie;
 final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white10,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Lottie.asset(lottie, height: SizeManage.screen.height / 2),
          Text(
            text,
            style: TextStyle(
                fontSize: 30, color: ColorManage.second, letterSpacing: 3),
          ),
          lottie == AssetJson.loading
              ? const SizedBox()
              : NewButton(
                  buttonName: 'OK',
                  onPressed: onPressed,
                  width: 6,
                  color: ColorManage.second,
                )
        ],
      ),
    );
  }
}
