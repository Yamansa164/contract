import 'dart:math';

import 'package:contracts/core/widget/lottie_widget.dart';
import 'package:contracts/core/widget/new_button.dart';
import 'package:contracts/featuers/add_contract/domain/entities/contract_material.dart';

import 'package:contracts/core/resources/const.dart';
import 'package:contracts/featuers/search_contract/domain/entities/list_contract_model.dart';
import 'package:contracts/featuers/search_contract/presntiation/bloc/search_contract_bloc.dart';
import 'package:contracts/featuers/search_contract/presntiation/sub_widget/drop_down_item.dart';
import 'package:flutter/material.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/decoration_manager.dart';

import '../../../../core/widget/row_text_field.dart';

class AddNewMaterialToStatements extends StatelessWidget {
  AddNewMaterialToStatements({super.key, required this.bloc});
  SearchContractBloc bloc;

  final _formKey = GlobalKey<FormState>();
  Map<String, String> items = {};

  @override
  Widget build(BuildContext context) {
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
            DropDownItem(
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
              textEditingController: bloc.materialAmount,
            ),
            SizedBox(
              height: SizeManage.screen.height / 50,
            ),
            NewButton(
                width: 12,
                buttonName: 'اضافة',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (int.parse(bloc.materialAmount.text) >
                        bloc.getMaxAmount) {
                      bloc.add(MaterialAmountFaieldEvent(
                          message:
                              ' الكمية العظمة هي  ${bloc.getMaxAmount}'));
                    } else {
                      print(bloc.getSelectedMaterial);
                      MaterialModel materialModel = bloc
                          .contractsModel!.listMaterial
                          .elementAt(bloc.getSelectedMaterial);
                      materialModel.newAmount =
                          int.parse(bloc.materialAmount.text);

                      bloc.listMaterialModel.add(materialModel);
                      bloc.materialAmount.clear();
                      bloc.add(GoToAddStatementsEvent());
                    }
                  }
                },
                color: ColorManage.primery)
          ],
        ),
      ),
    );
  }
}
