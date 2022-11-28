import 'package:contracts/featuers/search_contract/presntiation/bloc/contract_bloc.dart';
import 'package:flutter/material.dart';

import '../../../../../core/resources/const.dart';
import '../../../../../core/resources/decoration_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/widget/new_button.dart';

class TableItemWidget extends StatelessWidget {
  TableItemWidget(
      {super.key,
      required this.tableWidget,
     required this.listWidget});

  final Widget tableWidget;
 final List<Widget> listWidget;

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
          mainAxisAlignment:  MainAxisAlignment.spaceAround,
          children :listWidget
        )
      ],
    );
  }
}
