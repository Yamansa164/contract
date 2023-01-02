import 'package:contracts/core/widget/new_button.dart';

import 'package:contracts/core/resources/const.dart';
import 'package:contracts/featuers/search_contract/domain/entities/list_contract_model.dart';
import 'package:contracts/featuers/search_contract/presntiation/bloc/contract_bloc.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/resources/color_manager.dart';
import '../../../../../../core/resources/decoration_manager.dart';

import '../../../../../core/widget/row_drop_down_item.dart';
import '../../../../../core/widget/row_text_field.dart';

class SelectMaterialToStatements extends StatelessWidget {
  SelectMaterialToStatements({super.key, required this.bloc});
  final ContractBloc bloc;

  final _formKey = GlobalKey<FormState>();
  Map<String, String> items = {};

  @override
  Widget build(BuildContext context) {
    List.generate(bloc.contractsModel!.listMaterial.length, (index) {
      items.addAll({
        bloc.contractsModel!.listMaterial[index].id.toString():
            '${bloc.contractsModel!.listMaterial[index].name} (${bloc.contractsModel!.listMaterial[index].subContractNumber == '0' ? 'عقدية' :  bloc.contractsModel!.listMaterial[index].subContractNumber})'
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
                print(bloc.getSelectedMaterial);
                print(bloc.contractsModel!.listMaterial.map((e) => e.id));

                bloc.setSelectedMaterial(number.toString());
                int amount = int.parse(bloc.contractsModel!.listMaterial
                    .singleWhere(
                        (element) => element.id == bloc.getSelectedMaterial)
                    .notUsedQuantity);
                bloc.setMaxAmount(amount);
                print(bloc.getMaxAmount);
              },
              title: 'اسم المادة',
            ),
            RowTextField(
              type: 'num',
              title: ': الكمية',
              textEditingController: bloc.materialAmountToStatemets,
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
                    bloc.add(GoToAddStatementsEvent());
                  },
                ),
                NewButton(
                    width: 12,
                    buttonName: 'اضافة',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (int.parse(bloc.materialAmountToStatemets.text) >
                            bloc.getMaxAmount) {
                          bloc.add(MaterialAmountFaieldEvent(
                              message:
                                  ' الكمية العظمة هي  ${bloc.getMaxAmount}'));
                        } else {
                          print('x');
                          MaterialModel materialModel = bloc
                              .contractsModel!.listMaterial
                              .singleWhere((element) =>
                                  element.id == bloc.getSelectedMaterial);

                          materialModel.newQuantity =
                              int.parse(bloc.materialAmountToStatemets.text);

                          bloc.listContractMaterialToAddToStatement
                              .add(materialModel);
                          bloc.materialAmountToStatemets.clear();
                          bloc.contractsModel!.listMaterial.removeWhere(
                              (element) =>
                                  element.id == bloc.getSelectedMaterial);
                          bloc.add(GoToAddStatementsEvent());
                        }
                      }
                    },
                    color: ColorManage.primery),
              ],
            )
          ],
        ),
      ),
    );
  }
}
