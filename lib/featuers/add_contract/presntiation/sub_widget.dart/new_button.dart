import 'package:flutter/material.dart';

import '../../../../../core/resources/const.dart';
import '../../../../../core/resources/decoration_manager.dart';
import '../../../../../core/resources/text_style_manager.dart';
import '../bloc/add_contract_bloc.dart';

class NewButton extends StatelessWidget {
  const NewButton({
    Key? key,
    required this.buttonName,
    this.onPressed,
  }) : super(key: key);

  final String buttonName;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
        // ignore: sort_child_properties_last
        child: Center(
          child: TextButton(
            onPressed:onPressed,
            child:
                Text(buttonName, style: TextStyleMange.buttonTextStyle),
          ),
        ),
        width: SizeManage.screen.width / 6,
        height: SizeManage.screen.height / 12,
        decoration: DecorationManage.buttonDecoration);
  }
}
