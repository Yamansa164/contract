import 'package:contracts/core/resources/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/const.dart';
import '../bloc/add_contract_bloc.dart';
import '../sub_widget.dart/new_button.dart';

class LottieWidget extends StatelessWidget {
  const LottieWidget({
    required this.text,
    required this.lottie,
    Key? key,
  }) : super(key: key);
  final String text;
  final String lottie;
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
        lottie==AssetJson.loading?const SizedBox() :  NewButton( buttonName: 'OK',onPressed: () {
            AddContractBloc.getBloc(context).add(GoToAddContract());
          },)
        ],
      ),
    );
  }
}
