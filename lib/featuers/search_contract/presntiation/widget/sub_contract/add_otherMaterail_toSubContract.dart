import 'package:contracts/core/widget/new_button.dart';
import 'package:contracts/featuers/add_contract/domain/entities/contract_material.dart';

import 'package:contracts/core/resources/const.dart';
import 'package:contracts/featuers/search_contract/data/request/add_sub_contract.dart';
import 'package:contracts/featuers/search_contract/domain/entities/list_contract_model.dart';
import 'package:contracts/featuers/search_contract/presntiation/bloc/contract_bloc.dart';
import 'package:flutter/material.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/decoration_manager.dart';
import '../../../../../core/widget/row_text_field.dart';

class AddOtherMaterialToSubContractWidget extends StatelessWidget {
  AddOtherMaterialToSubContractWidget({super.key, required this.bloc});
  final ContractBloc bloc;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        decoration: DecorationManage.tableDecoration,
        height: SizeManage.screen.height / 2,
        width: SizeManage.screen.width / 3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RowTextField(
              type: 'name',
              title: ': اسم المادة',
              textEditingController: bloc.otherMaterialName,
            ),
            RowTextField(
              type: 'name',
              title: ': الوحدة',
              textEditingController: bloc.otherMaterialUnit,
            ),
            RowTextField(
              type: 'num',
              title: ': الكمية',
              textEditingController: bloc.otherMaterialAmount,
            ),
            RowTextField(
              type: 'num',
              title: ': السعر الافرادي',
              textEditingController: bloc.otherMaterialPrice,
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
                        bloc.listOtherMaterialToAddToSubContract.add(
                            OtherMaterialsRequestToSubContract(
                                unit: bloc.otherMaterialUnit.text,
                                materialName: bloc.otherMaterialName.text,
                                quantity:
                                    int.parse(bloc.otherMaterialAmount.text),
                                number: (bloc
                                            .listOtherMaterialToAddToSubContract
                                            .length +
                                        1)
                                    .toString(),
                                individualPrice:
                                    int.parse(bloc.otherMaterialPrice.text),
                                overallPrice: (int.parse(
                                        bloc.otherMaterialPrice.text) *
                                    int.parse(bloc.otherMaterialAmount.text))));
                        bloc.listMaterialToAddToSubContract.add(MaterialModel(
                          subContractNumber: '',
                            number: (bloc
                                    .listOtherMaterialToAddToSubContract.length)
                                .toString(),
                            name: bloc.otherMaterialName.text,
                            unit: bloc.otherMaterialUnit.text,
                            notUsedQuantity: '0',
                            quantity: int.parse(bloc.otherMaterialAmount.text),
                            individualPrice:
                                double.parse(bloc.otherMaterialPrice.text),
                            newQuantity: int.parse(bloc.otherMaterialAmount.text),
                            id: 0));

                        bloc.add(GoToAddMaterialToSubContract());
                        bloc.otherMaterialAmount.clear();
                        bloc.otherMaterialName.clear();
                        bloc.otherMaterialPrice.clear();
                        bloc.otherMaterialUnit.clear();
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
