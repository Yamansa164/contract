import 'package:flutter/material.dart';

import '../../../../../core/resources/const.dart';
import '../../../../../core/resources/decoration_manager.dart';
import '../bloc/add_contract_bloc.dart';
import '../sub_widget.dart/new_button.dart';
import '../sub_widget.dart/table.dart';

class TableItemWidget extends StatelessWidget {
  TableItemWidget({super.key, required this.bloc});

  AddContractBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: DecorationManage.tableDecoration,
          height: SizeManage.screen.height / 2,
          width: SizeManage.screen.width - 400,
          child: Center(
            child: TableWidget(
              listRow: bloc.listRow,
            ),
          ),
        ),
        SizedBox(
          height: SizeManage.screen.height / 50,
        ),  
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NewButton(
              
              buttonName: 'اضافة االعقد',
              onPressed: () {
                bloc.add(ExcuteAddContract());
              },
            ),
            NewButton(
              
              buttonName: 'اضافة مادة جديدة',
              onPressed: () {
                bloc.add(GoToAddContractMaterial());
              },
            ),
          ],
        ),
      ],
    );
  }
}
