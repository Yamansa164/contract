import 'package:contracts/featuers/search_contract/presntiation/bloc/contract_bloc.dart';
import 'package:contracts/featuers/search_contract/presntiation/sub_widget/quarter_table.dart';
import 'package:contracts/featuers/search_contract/presntiation/sub_widget/table_item.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/resources/const.dart';
import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/text_style_manager.dart';
import '../../../../../core/widget/column_text_field.dart';
import '../../../../../core/widget/new_button.dart';

class AddQuarterTableWidget extends StatelessWidget {
  AddQuarterTableWidget(
      {super.key, required this.bloc, });
 final ContractBloc bloc;
  final _formKey = GlobalKey<FormState>();

  @override
   Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
             
              ColumnTextField(
                textEditingController: bloc.quarterNum,
                title: '',
                type: 'num',
              ),
              SizedBox(
                width: SizeManage.screen.width / 30,
              ),
              Text(
                ' : رقم التكليف',
                style: TextStyleMange.headerTextStyle
                    .copyWith(color: Colors.white, letterSpacing: 0.6),
              ),
            ],
          ),
          SizedBox(
            height: SizeManage.screen.height / 100,
          ),
          TableItemWidget(
            tableWidget: QuarterTable(bloc: bloc,),
            listWidget: [
              NewButton(
                width: 6,
                buttonName: 'الرجوع ',
                color: ColorManage.second,
                onPressed: () {
                  bloc.add(DoSearchContractEvent());
                  bloc.listContractMaterialToAddToStatement.clear();
                },
              ),
              NewButton(
                width: 6,
                buttonName: 'اضافة الربع',
                color: ColorManage.second,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    bloc.add(ExcuteAddQuarterEvent());
                   
                  }
                },
              ),
              NewButton(
                width: 6,
                buttonName: 'اضافة مادة',
                color: ColorManage.second,
                onPressed: () {
                  bloc.add(GoToAddQuarterMaterialEvent  ());
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
