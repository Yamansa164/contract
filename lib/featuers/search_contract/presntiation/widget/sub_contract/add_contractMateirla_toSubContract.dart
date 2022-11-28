import 'package:flutter/material.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/const.dart';
import '../../../../../core/resources/decoration_manager.dart';
import '../../../../../core/widget/new_button.dart';
import '../../../../../core/widget/row_drop_down_item.dart';
import '../../../../../core/widget/row_text_field.dart';
import '../../../domain/entities/list_contract_model.dart';
import '../../bloc/contract_bloc.dart';

class AddContractMaterialToSubContractWidget extends StatelessWidget {
  AddContractMaterialToSubContractWidget({super.key, required this.bloc});
  final ContractBloc bloc;

  final _formKey = GlobalKey<FormState>();
  Map<String, String> items = {};

  @override
  Widget build(BuildContext context) {
    print('objectxxxxxxxxx');
    print(bloc.contractsModel!.listMaterial.length);
    List.generate(bloc.contractsModel!.listMaterial.length, (index) {
      items.addAll({
        bloc.contractsModel!.listMaterial[index].number.toString():
            bloc.contractsModel!.listMaterial[index].name
      });
    });
    return Form(
      key: _formKey,
      child: Container(
        decoration: DecorationManage.tableDecoration,
        height: SizeManage.screen.height / 2,
        width: SizeManage.screen.width / 3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RowDropDownItem(
              items: items,
              onChanged: (number) {
                bloc.setSelectedMaterial(number.toString());
                bloc.setMaxAmount(bloc.contractsModel!.listMaterial
                    .elementAt(bloc.getSelectedMaterial)
                    .amount);
              },
              title: 'اسم المادة',
            ),
            RowTextField(
              type: 'num',
              title: ': الكمية',
              textEditingController: bloc.materialAmountForStatemets,
            ),
            SizedBox(
              height: SizeManage.screen.height / 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                NewButton(
                  width: 12,
                  buttonName: 'الرجوع ',
                  color: ColorManage.primery,
                  onPressed: () {
                    bloc.add(GoToAddMaterialToSubContract());
                  },
                ),
                NewButton(
                width: 12,
                buttonName: 'اضافة',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    MaterialModel materialModel = bloc
                        .contractsModel!.listMaterial
                        .elementAt(bloc.getSelectedMaterial);
                    materialModel.newAmount =
                        int.parse(bloc.materialAmountForStatemets.text);

                    bloc.listContractMaterialModel.add(materialModel);
                    bloc.materialAmountForStatemets.clear();
                    // bloc.contractsModel!.listMaterial.removeAt(bloc.getSelectedMaterial);
                    bloc.add(GoToAddMaterialToSubContract());
                  }
                },
                color: ColorManage.primery)
              ],
            ),
            
          ],
        ),
      ),
    );
  }
}
