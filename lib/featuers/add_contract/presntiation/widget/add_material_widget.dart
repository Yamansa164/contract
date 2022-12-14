import 'package:contracts/core/widget/new_button.dart';
import 'package:contracts/featuers/add_contract/domain/entities/contract_material.dart';

import 'package:contracts/core/resources/const.dart';
import 'package:flutter/material.dart';


import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/decoration_manager.dart';

import '../../../../core/widget/row_text_field.dart';
import '../bloc/add_contract_bloc.dart';

class AddMaterialToContractWidget extends StatelessWidget {
  AddMaterialToContractWidget({super.key, required this.bloc});
  AddContractBloc bloc;

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
              textEditingController: bloc.materialName,
            ),
            RowTextField(
              type: 'name',
              title: ': الوحدة',
              textEditingController: bloc.materialUnit,
            ),
            RowTextField(
              type: 'num',
              title: ': الكمية',
              textEditingController: bloc.materialAmount,
            ),
            RowTextField(
              type: 'num',
              title: ': السعر الافرادي',
              textEditingController: bloc.materialPrice,
            ),
            SizedBox(
              height: SizeManage.screen.height / 50,
            ),
            NewButton(width: 12, buttonName: 'اضافة',onPressed: (){
                if (_formKey.currentState!.validate()) {
                    bloc.listRow.add(AddContractMaterialModel(
                        num: (bloc.listRow.length + 1).toString(),
                        name: bloc.materialName.text,
                        unit: bloc.materialUnit.text,
                        amount: int.parse(bloc.materialAmount.text),
                        individualPrice: double.parse(bloc.materialPrice.text),
                        overallPrice: double.parse(bloc.materialPrice.text) *
                            int.parse(bloc.materialAmount.text)));
                    AddContractBloc.getBloc(context).add(GoToTableItem());
                    bloc.materialAmount.clear();
                    bloc.materialName.clear();
                    bloc.materialPrice.clear();
                    bloc.materialUnit.clear();
                  }

            },color: ColorManage.primery)
            
          ],
        ),
      ),
    );
  }
}
