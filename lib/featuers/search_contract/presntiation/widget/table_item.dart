import 'package:contracts/featuers/search_contract/presntiation/bloc/search_contract_bloc.dart';
import 'package:flutter/material.dart';

import '../../../../../core/resources/const.dart';
import '../../../../../core/resources/decoration_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/widget/new_button.dart';

class TableItemWidget extends StatelessWidget {
  TableItemWidget(
      {super.key,
      required this.bloc,
      required this.tableWidget,
      required this.buttonName,
      required this.onPressed,
       this.onPressed2,
       this.buttonName2=''});

  SearchContractBloc bloc;
  final Widget tableWidget;
  final String buttonName;
  final void Function()? onPressed;
  final String buttonName2;
  final void Function()? onPressed2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: DecorationManage.tableDecoration,
          height: SizeManage.screen.height / 2,
          width: SizeManage.screen.width - 400,
          child: Center(child: tableWidget),
        ),
        SizedBox(
          height: SizeManage.screen.height / 50,
        ),
        Row(
          mainAxisAlignment: buttonName2==''?MainAxisAlignment.center: MainAxisAlignment.spaceAround,
          children: [
            NewButton(
                width: 6,
                buttonName: buttonName,
                color: ColorManage.second,
                onPressed: onPressed),
       buttonName2=='' ?const SizedBox():     NewButton(
                width: 6,
                buttonName: buttonName2,
                color: ColorManage.second,
                onPressed: onPressed2),
          ],
        )
      ],
    );
  }
}
