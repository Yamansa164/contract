import 'package:flutter/material.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/widget/new_button.dart';
import '../../bloc/contract_bloc.dart';
import '../../sub_widget/material_table_sub_contract.dart';
import '../../sub_widget/table_item.dart';

class AddMaterialToSubContractWidget extends StatelessWidget {
  const AddMaterialToSubContractWidget({super.key, required this.bloc});
  final ContractBloc bloc;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableItemWidget(
          tableWidget: MaterialTableSubContract(bloc: bloc),
          listWidget: [
            NewButton(
              width: 6,
              buttonName: 'الرجوع ',
              color: ColorManage.second,
              onPressed: () {
                bloc.add(GoToAddSubContractinitial());
              },
            ),
            NewButton(
              width: 6,
              buttonName: 'حفظ الملحق',
              color: ColorManage.second,
              onPressed: () {
            bloc.add(ExcuteAddSubContract());
              },
            ),
            NewButton(
              width: 6,
              buttonName: ' اضافة مادة  عقدية',
              color: ColorManage.second,
              onPressed: () {
                bloc.add(GoToAddContractMaterialToSubContract());
              },
            ),
            NewButton(
              width: 6,
              buttonName: 'اضافة مادة جديدة',
              color: ColorManage.second,
              onPressed: () {
                bloc.add(GoToAddOtherMaterialToSubContract());
              },
            )
          ],
        )
      ],
    );
  }
}
