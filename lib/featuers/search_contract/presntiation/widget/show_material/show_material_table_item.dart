import 'package:contracts/featuers/search_contract/domain/entities/list_contract_model.dart';
import 'package:contracts/featuers/search_contract/presntiation/bloc/contract_bloc.dart';
import 'package:contracts/featuers/search_contract/presntiation/sub_widget/show_material_table.dart';
import 'package:contracts/featuers/search_contract/presntiation/sub_widget/table_item.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/resources/const.dart';
import '../../../../../../core/resources/decoration_manager.dart';
import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/widget/new_button.dart';

class MaterialTableItemWidget extends StatelessWidget {
  MaterialTableItemWidget(
      {super.key, required this.bloc, required this.listRow});
  final List<MaterialModel> listRow;
  ContractBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableItemWidget(
          tableWidget: MaterialTable(
            listRow: listRow,
          ),
          listWidget: [
            NewButton(
              width: 6,
              buttonName: 'الرجوع',
              color: ColorManage.second,
              onPressed: () {
                bloc.add(DoSearchContractEvent());
              },
            )
          ],
        ),
      ],
    );
  }
}
