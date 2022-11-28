import 'package:contracts/core/resources/color_manager.dart';
import 'package:contracts/core/widget/column_date_picker.dart';
import 'package:contracts/core/widget/column_text_field.dart';
import 'package:contracts/core/widget/new_button.dart';
import 'package:contracts/featuers/search_contract/presntiation/bloc/contract_bloc.dart';
import 'package:flutter/material.dart';

import '../../../../../core/resources/const.dart';
import '../../../../../core/resources/decoration_manager.dart';

class AddSubContractWidget extends StatelessWidget {
  AddSubContractWidget({super.key, required this.bloc});
  final ContractBloc bloc;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
          decoration: DecorationManage.tableDecoration,
          height: SizeManage.screen.height / 2,
          width: SizeManage.screen.width / 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ColumnDatePicker(
                    title: ' : تاريخ امر المباشرة',
                    controller: bloc.executingDate,
                    value: bloc.statementDate.text,
                  ),
                  ColumnTextField(
                    type: 'num',
                    title: ' : رقم الملحق',
                    textEditingController: bloc.subContractNumber,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ColumnDatePicker(
                    title: ' : تاريخ محضر الاتفاق',
                    controller: bloc.agreeDate,
                    value: bloc.statementDate.text,
                  ),
                  ColumnTextField(
                    type: 'num',
                    title: ' : رقم محضر الاتفاق',
                    textEditingController: bloc.agreeNumber,
                  ),
                ],
              ),
              ColumnTextField(
                type: 'name',
                title: ': الموضوع',
                textEditingController: bloc.subContractSubject,
                width: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  NewButton(
                    width: 12,
                    buttonName: 'الرجوع ',
                    color: ColorManage.primery,
                    onPressed: () {
                      bloc.add(DoSearchContractEvent());
                    },
                  ),
                  NewButton(
                    width: 4,
                    buttonName: 'اضافة المواد الخاصة بالملحق ',
                    color: ColorManage.primery,
                    onPressed: () {
                      if (!_formKey.currentState!.validate()) {
                        bloc.add(GoToAddMaterialToSubContract());
                      }
                    },
                  ),
                ],
              )
            ],
          )),
    );
  }
}
